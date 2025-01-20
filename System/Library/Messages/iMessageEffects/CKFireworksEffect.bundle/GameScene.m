@interface GameScene
- (BOOL)shouldReduceParticles;
- (BOOL)type1FireworkEnabled;
- (BOOL)type2FireworkEnabled;
- (GameScene)init;
- (float)globalScale;
- (float)launchTrailAt:(CGPoint)a3 angle:(float)a4 speed:(float)a5 group:(id)a6;
- (void)createFireworkTypeOneAt:(CGPoint)a3 scale:(float)a4;
- (void)createFireworkTypeTwoAt:(CGPoint)a3 scale:(float)a4 color:(unint64_t)a5;
- (void)launchFireworkAt:(CGPoint)a3 type:(unint64_t)a4 scale:(float)a5 color:(unint64_t)a6;
- (void)runChoregraphy;
- (void)runEndingSparkleParticleEmitter:(CGPoint)a3 scale:(float)a4 radius:(float)a5 color:(id)a6;
- (void)runLightHaloEffectAt:(CGPoint)a3 scale:(float)a4 color:(unint64_t)a5;
- (void)runOrbParticleEmitter:(CGPoint)a3 scale:(float)a4 color:(id)a5;
- (void)runSmokeEmitter:(CGPoint)a3 scale:(float)a4 color:(id)a5;
- (void)runSparkleEmitter:(CGPoint)a3 scale:(float)a4 rangeRatio:(float)a5 particleSizeRatio:(float)a6 color:(unint64_t)a7 texture:(id)a8;
- (void)runTrailParticleEmitter:(CGPoint)a3 scale:(float)a4;
- (void)setGlobalScale:(float)a3;
- (void)setShouldReduceParticles:(BOOL)a3;
- (void)setType1FireworkEnabled:(BOOL)a3;
- (void)setType2FireworkEnabled:(BOOL)a3;
- (void)setup;
@end

@implementation GameScene

- (GameScene)init
{
  v5.receiver = self;
  v5.super_class = (Class)GameScene;
  v2 = [(GameScene *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_globalScale = 1.0;
    [(GameScene *)v2 setup];
  }
  return v3;
}

- (void)setup
{
  v3 = [(GameScene *)self physicsWorld];
  objc_msgSend(v3, "setGravity:", 0.0, -0.08);

  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = +[UIImage imageNamed:@"Emitter__Glow-Sphere" inBundle:v4];
  v6 = +[SKTexture textureWithImage:v5];
  emitterGlowSphereTexture = self->_emitterGlowSphereTexture;
  self->_emitterGlowSphereTexture = v6;

  v8 = +[UIImage imageNamed:@"spark" inBundle:v4];
  v9 = +[SKTexture textureWithImage:v8];
  sparkTexture = self->_sparkTexture;
  self->_sparkTexture = v9;

  v173 = (void *)v4;
  v11 = +[UIImage imageNamed:@"spark-softglow" inBundle:v4];
  v12 = +[SKTexture textureWithImage:v11];
  sparkSoftGlowTexture = self->_sparkSoftGlowTexture;
  self->_sparkSoftGlowTexture = v12;

  v14 = +[UIImage imageNamed:@"BackGlow_1" inBundle:v4];
  v15 = +[SKTexture textureWithImage:v14];
  backGlowTexture = self->_backGlowTexture;
  self->_backGlowTexture = v15;

  self->_type1FireworkScale = 2.1;
  v17 = (SKEmitterNode *)[objc_alloc((Class)SKEmitterNode) initWithMinimumParticleCapacity:8000 minimumPositionBufferCapacity:1000];
  trailParticleEmitter = self->_trailParticleEmitter;
  self->_trailParticleEmitter = v17;

  v19 = self->_trailParticleEmitter;
  [(SKEmitterNode *)v19 setParticleScale:0.09];
  [(SKEmitterNode *)v19 setParticleBirthRate:120.0];
  [(SKEmitterNode *)v19 setParticleTexture:self->_emitterGlowSphereTexture];
  [(SKEmitterNode *)v19 setParticleLifetime:1.0];
  [(SKEmitterNode *)v19 setParticleLifetimeRange:0.5];
  [(SKEmitterNode *)v19 setParticleScaleRange:0.09];
  [(SKEmitterNode *)v19 setParticleScaleSpeed:-0.11];
  -[SKEmitterNode setParticlePositionRange:](v19, "setParticlePositionRange:", 0.0, 0.0);
  [(SKEmitterNode *)v19 setEmissionAngle:1.57079633];
  [(SKEmitterNode *)v19 setEmissionAngleRange:6.28318531];
  [(SKEmitterNode *)v19 setEmissionDistance:0.0];
  [(SKEmitterNode *)v19 setParticleSpeed:1.0];
  [(SKEmitterNode *)v19 setParticleSpeedRange:0.0];
  [(SKEmitterNode *)v19 setXAcceleration:0.0];
  [(SKEmitterNode *)v19 setYAcceleration:0.0];
  [(SKEmitterNode *)v19 setParticleAlpha:0.8];
  [(SKEmitterNode *)v19 setParticleAlphaRange:0.01];
  [(SKEmitterNode *)v19 setParticleAlphaSpeed:-0.03];
  [(SKEmitterNode *)v19 setParticleScaleSpeed:-0.11];
  [(SKEmitterNode *)v19 setParticleRotation:0.0];
  [(SKEmitterNode *)v19 setParticleRotationRange:0.0];
  [(SKEmitterNode *)v19 setParticleRotationSpeed:0.0];
  [(SKEmitterNode *)v19 setParticleColorBlendFactor:1.0];
  [(SKEmitterNode *)v19 setParticleColorBlendFactorRange:0.0];
  [(SKEmitterNode *)v19 setParticleColorBlendFactorSpeed:0.0];
  [(SKEmitterNode *)v19 setUsesPointSprites:1];
  v20 = +[SKNode node];
  trailContainer = self->_trailContainer;
  self->_trailContainer = v20;

  v22 = +[SKPhysicsBody bodyWithCircleOfRadius:1.0];
  [(SKNode *)self->_trailContainer setPhysicsBody:v22];

  v23 = [(SKNode *)self->_trailContainer physicsBody];
  [v23 setAffectedByGravity:0];

  v24 = [(SKNode *)self->_trailContainer physicsBody];
  [v24 setCollisionBitMask:0];

  v25 = [(SKNode *)self->_trailContainer physicsBody];
  [v25 setContactTestBitMask:0];

  v26 = [(SKNode *)self->_trailContainer physicsBody];
  [v26 setFieldBitMask:3];

  v27 = [(SKNode *)self->_trailContainer physicsBody];
  [v27 setCategoryBitMask:1];

  self->_type1FireworkTrailCount = 100;
  id v28 = objc_alloc((Class)SKKeyframeSequence);
  v29 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  v189[0] = v29;
  v30 = +[UIColor colorWithRed:0.490196078 green:0.415686275 blue:0.345098039 alpha:1.0];
  v189[1] = v30;
  v31 = +[NSArray arrayWithObjects:v189 count:2];
  id v32 = [v28 initWithKeyframeValues:v31 times:&off_C648];
  [(SKEmitterNode *)v19 setParticleColorSequence:v32];

  v33 = (SKEmitterNode *)objc_opt_new();
  orbParticleEmitter = self->_orbParticleEmitter;
  self->_orbParticleEmitter = v33;

  v35 = self->_orbParticleEmitter;
  [(SKEmitterNode *)v35 setParticleScale:0.04];
  [(SKEmitterNode *)v35 setParticleBirthRate:2000.0];
  [(SKEmitterNode *)v35 setParticleTexture:self->_emitterGlowSphereTexture];
  [(SKEmitterNode *)v35 setParticleLifetime:0.5];
  [(SKEmitterNode *)v35 setParticleLifetimeRange:0.1];
  [(SKEmitterNode *)v35 setParticleScaleRange:0.05];
  [(SKEmitterNode *)v35 setParticleScaleSpeed:0.0];
  [(SKEmitterNode *)v35 setEmissionDistance:80.0];
  -[SKEmitterNode setParticlePositionRange:](v35, "setParticlePositionRange:", 1.0, 1.0);
  [(SKEmitterNode *)v35 setParticleSpeed:0.0];
  [(SKEmitterNode *)v35 setParticleSpeedRange:0.0];
  [(SKEmitterNode *)v35 setEmissionAngle:0.0];
  [(SKEmitterNode *)v35 setEmissionAngleRange:0.0];
  [(SKEmitterNode *)v35 setXAcceleration:0.0];
  [(SKEmitterNode *)v35 setYAcceleration:0.0];
  [(SKEmitterNode *)v35 setParticleAlpha:1.0];
  [(SKEmitterNode *)v35 setParticleAlphaRange:0.2];
  [(SKEmitterNode *)v35 setParticleAlphaSpeed:-1.0];
  [(SKEmitterNode *)v35 setParticleColorSequence:0];
  [(SKEmitterNode *)v35 emissionDistance];
  [(SKEmitterNode *)v35 setEmissionDistanceRange:v36 + v36];
  [(SKEmitterNode *)v35 setEmissionAngle:0.0];
  [(SKEmitterNode *)v35 setEmissionAngleRange:6.28318531];
  [(SKEmitterNode *)v35 setParticleColorBlendFactor:1.0];
  [(SKEmitterNode *)v35 setParticleColorBlendFactorRange:0.0];
  [(SKEmitterNode *)v35 setParticleColorBlendFactorSpeed:0.0];
  [(SKEmitterNode *)v35 setParticleColorBlendFactorSequence:0];
  [(SKEmitterNode *)v35 setParticleBlendMode:1];
  [(SKEmitterNode *)v35 setUsesPointSprites:1];
  [(SKEmitterNode *)v35 setTargetNode:self];
  v37 = +[SKPhysicsBody bodyWithCircleOfRadius:0.5];
  [(SKEmitterNode *)v35 setPhysicsBody:v37];

  v38 = [(SKEmitterNode *)v35 physicsBody];
  [v38 setAffectedByGravity:0];

  v39 = [(SKEmitterNode *)v35 physicsBody];
  [v39 setCollisionBitMask:0];

  v40 = [(SKEmitterNode *)v35 physicsBody];
  [v40 setFieldBitMask:0];

  self->_type2FireworkScale = 1.6;
  v41 = (SKEmitterNode *)objc_opt_new();
  sparklesParticleEmitter = self->_sparklesParticleEmitter;
  self->_sparklesParticleEmitter = v41;

  v43 = self->_sparklesParticleEmitter;
  [(SKEmitterNode *)v43 setParticleScale:0.1];
  [(SKEmitterNode *)v43 setParticleBirthRate:1500.0];
  [(SKEmitterNode *)v43 setNumParticlesToEmit:100];
  [(SKEmitterNode *)v43 setParticleLifetime:3.0];
  [(SKEmitterNode *)v43 setParticleLifetimeRange:0.0];
  [(SKEmitterNode *)v43 setParticleScaleRange:0.2];
  [(SKEmitterNode *)v43 setParticleScaleSpeed:-0.2];
  -[SKEmitterNode setParticlePositionRange:](v43, "setParticlePositionRange:", 0.0, 0.0);
  [(SKEmitterNode *)v43 setEmissionAngle:0.0];
  [(SKEmitterNode *)v43 setEmissionAngleRange:6.28318531];
  [(SKEmitterNode *)v43 setParticleSpeed:200.0];
  [(SKEmitterNode *)v43 setParticleSpeedRange:20.0];
  [(SKEmitterNode *)v43 setXAcceleration:0.0];
  [(SKEmitterNode *)v43 setYAcceleration:0.0];
  [(SKEmitterNode *)v43 setParticleAlpha:1.0];
  [(SKEmitterNode *)v43 setParticleAlphaRange:0.2];
  [(SKEmitterNode *)v43 setParticleAlphaSpeed:-0.2];
  [(SKEmitterNode *)v43 setParticleColorSequence:0];
  [(SKEmitterNode *)v43 setParticleColorBlendFactor:1.0];
  [(SKEmitterNode *)v43 setParticleColorBlendFactorRange:0.0];
  [(SKEmitterNode *)v43 setParticleColorBlendFactorSpeed:0.0];
  [(SKEmitterNode *)v43 setParticleColorBlendFactorSequence:0];
  [(SKEmitterNode *)v43 setParticleBlendMode:1];
  [(SKEmitterNode *)v43 setUsesPointSprites:1];
  v44 = +[SKPhysicsBody bodyWithCircleOfRadius:0.5];
  [(SKEmitterNode *)v43 setPhysicsBody:v44];

  v45 = [(SKEmitterNode *)v43 physicsBody];
  [v45 setAffectedByGravity:1];

  v46 = [(SKEmitterNode *)v43 physicsBody];
  [v46 setCollisionBitMask:0];

  v47 = [(SKEmitterNode *)v43 physicsBody];
  [v47 setFieldBitMask:0];

  objc_storeStrong((id *)&self->_sparklesType1Texture, self->_sparkTexture);
  objc_storeStrong((id *)&self->_sparklesType2Texture, self->_sparkSoftGlowTexture);
  v48 = (SKEmitterNode *)objc_opt_new();
  smokeParticleEmitter = self->_smokeParticleEmitter;
  self->_smokeParticleEmitter = v48;

  v50 = self->_smokeParticleEmitter;
  [(SKEmitterNode *)v50 setParticleScale:0.46];
  [(SKEmitterNode *)v50 setParticleBirthRate:1500.0];
  [(SKEmitterNode *)v50 setParticleTexture:self->_sparkTexture];
  [(SKEmitterNode *)v50 setNumParticlesToEmit:20];
  [(SKEmitterNode *)v50 setParticleLifetime:2.0];
  [(SKEmitterNode *)v50 setParticleLifetimeRange:0.0];
  [(SKEmitterNode *)v50 setParticleScaleRange:0.2];
  [(SKEmitterNode *)v50 setParticleScaleSpeed:-0.02];
  [(SKEmitterNode *)v50 setParticleRotationSpeed:0.2];
  [(SKEmitterNode *)v50 setParticleRotationRange:6.28318531];
  -[SKEmitterNode setParticlePositionRange:](v50, "setParticlePositionRange:", 60.0, 60.0);
  [(SKEmitterNode *)v50 setParticleColorSequence:0];
  [(SKEmitterNode *)v50 setEmissionAngle:0.0];
  [(SKEmitterNode *)v50 setEmissionAngleRange:6.28318531];
  [(SKEmitterNode *)v50 setParticleSpeed:10.0];
  [(SKEmitterNode *)v50 setParticleSpeedRange:10.0];
  [(SKEmitterNode *)v50 setXAcceleration:0.0];
  [(SKEmitterNode *)v50 setYAcceleration:0.0];
  [(SKEmitterNode *)v50 setParticleAlpha:0.5];
  [(SKEmitterNode *)v50 setParticleAlphaRange:0.3];
  [(SKEmitterNode *)v50 setParticleAlphaSpeed:-0.3];
  [(SKEmitterNode *)v50 setUsesPointSprites:1];
  [(SKEmitterNode *)v50 setParticleColorBlendFactor:1.0];
  [(SKEmitterNode *)v50 setParticleColorBlendFactorRange:0.0];
  [(SKEmitterNode *)v50 setParticleColorBlendFactorSpeed:0.0];
  [(SKEmitterNode *)v50 setParticleColorBlendFactorSequence:0];
  [(SKEmitterNode *)v50 setParticleBlendMode:1];
  v51 = +[SKPhysicsBody bodyWithCircleOfRadius:0.5];
  [(SKEmitterNode *)v50 setPhysicsBody:v51];

  v52 = [(SKEmitterNode *)v50 physicsBody];
  [v52 setAffectedByGravity:1];

  v53 = [(SKEmitterNode *)v50 physicsBody];
  [v53 setCollisionBitMask:0];

  v54 = [(SKEmitterNode *)v50 physicsBody];
  [v54 setFieldBitMask:0];

  v55 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  whiteColor = self->_whiteColor;
  self->_whiteColor = v55;

  v57 = +[UIColor colorWithVectorRGBA:0.00471875164];
  type1SmokeColor = self->_type1SmokeColor;
  self->_type1SmokeColor = v57;

  [(SKEmitterNode *)self->_sparklesParticleEmitter particleLifetime];
  float v60 = v59;
  v61 = +[UIColor colorWithRed:1.0 green:0.266666667 blue:0.501960784 alpha:1.0];
  type2FireworkInnerPinkColor = self->_type2FireworkInnerPinkColor;
  self->_type2FireworkInnerPinkColor = v61;

  v63 = +[UIColor colorWithRed:0.992156863 green:0.203921569 blue:0.376470588 alpha:1.0];
  type2FireworkOuterPinkColor = self->_type2FireworkOuterPinkColor;
  self->_type2FireworkOuterPinkColor = v63;

  v65 = +[UIColor colorWithRed:1.0 green:0.670588235 blue:0.729411765 alpha:1.0];
  v188[0] = v65;
  v66 = +[UIColor colorWithRed:0.992156863 green:0.203921569 blue:0.376470588 alpha:1.0];
  v188[1] = v66;
  v67 = +[UIColor colorWithRed:0.992156863 green:0.0666666667 blue:0.266666667 alpha:1.0];
  v188[2] = v67;
  v68 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:");
  v188[3] = v68;
  v172 = +[NSArray arrayWithObjects:v188 count:4];

  v187[0] = &off_C5B8;
  double v69 = v60;
  v70 = +[NSNumber numberWithDouble:v69 * 0.05];
  v187[1] = v70;
  v71 = +[NSNumber numberWithDouble:v69 * 0.3];
  v187[2] = v71;
  v72 = +[NSNumber numberWithDouble:v69];
  v187[3] = v72;
  v73 = +[NSArray arrayWithObjects:v187 count:4];

  v74 = (SKKeyframeSequence *)[objc_alloc((Class)SKKeyframeSequence) initWithKeyframeValues:v172 times:v73];
  type2FireworkOuterPinkColorSequence = self->_type2FireworkOuterPinkColorSequence;
  self->_type2FireworkOuterPinkColorSequence = v74;

  v76 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.992156863);
  v186[0] = v76;
  v77 = +[UIColor colorWithRed:1.0 green:0.266666667 blue:0.501960784 alpha:1.0];
  v186[1] = v77;
  v78 = +[UIColor colorWithRed:1.0 green:0.247058824 blue:0.596078431 alpha:1.0];
  v186[2] = v78;
  v79 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:");
  v186[3] = v79;
  v80 = +[NSArray arrayWithObjects:v186 count:4];

  v185[0] = &off_C5B8;
  v81 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v185[1] = v81;
  v82 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v185[2] = v82;
  v83 = +[NSNumber numberWithDouble:v69];
  v185[3] = v83;
  v84 = +[NSArray arrayWithObjects:v185 count:4];

  v85 = (SKKeyframeSequence *)[objc_alloc((Class)SKKeyframeSequence) initWithKeyframeValues:v80 times:v84];
  type2FireworkInnerPinkColorSequence = self->_type2FireworkInnerPinkColorSequence;
  self->_type2FireworkInnerPinkColorSequence = v85;

  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:");
  v87 = (UIColor *)objc_claimAutoreleasedReturnValue();
  type2FireworkInnerBlueColor = self->_type2FireworkInnerBlueColor;
  self->_type2FireworkInnerBlueColor = v87;

  v89 = +[UIColor colorWithRed:0.51372549 green:0.807843137 blue:0.949019608 alpha:1.0];
  type2FireworkOuterBlueColor = self->_type2FireworkOuterBlueColor;
  self->_type2FireworkOuterBlueColor = v89;

  v91 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:");
  v184[0] = v91;
  v92 = +[UIColor colorWithRed:0.51372549 green:0.807843137 blue:0.949019608 alpha:1.0];
  v184[1] = v92;
  v93 = +[UIColor colorWithRed:0.419607843 green:0.843137255 blue:0.992156863 alpha:1.0];
  v184[2] = v93;
  v94 = +[UIColor colorWithRed:0.917647059 green:0.870588235 blue:0.968627451 alpha:0.0];
  v184[3] = v94;
  v171 = +[NSArray arrayWithObjects:v184 count:4];

  v183[0] = &off_C5B8;
  v95 = +[NSNumber numberWithDouble:v69 * 0.08];
  v183[1] = v95;
  v96 = +[NSNumber numberWithDouble:v69 * 0.37];
  v183[2] = v96;
  v97 = +[NSNumber numberWithDouble:v69];
  v183[3] = v97;
  v170 = +[NSArray arrayWithObjects:v183 count:4];

  v98 = (SKKeyframeSequence *)[objc_alloc((Class)SKKeyframeSequence) initWithKeyframeValues:v171 times:v170];
  type2FireworkOuterBlueColorSequence = self->_type2FireworkOuterBlueColorSequence;
  self->_type2FireworkOuterBlueColorSequence = v98;

  v100 = +[UIColor colorWithRed:0.894117647 green:0.882352941 blue:0.992156863 alpha:1.0];
  v182[0] = v100;
  v101 = +[UIColor colorWithRed:0.564705882 green:0.835294118 blue:0.956862745 alpha:1.0];
  v182[1] = v101;
  v102 = +[UIColor colorWithRed:0.694117647 green:0.992156863 blue:0.992156863 alpha:1.0];
  v182[2] = v102;
  v103 = +[UIColor colorWithRed:0.952941176 green:0.870588235 blue:0.968627451 alpha:0.0];
  v182[3] = v103;
  v104 = +[NSArray arrayWithObjects:v182 count:4];

  v181[0] = &off_C5B8;
  v105 = +[NSNumber numberWithDouble:v69 * 0.07];
  v181[1] = v105;
  v106 = +[NSNumber numberWithDouble:v69 * 0.4];
  v181[2] = v106;
  v107 = +[NSNumber numberWithDouble:v69];
  v181[3] = v107;
  v108 = +[NSArray arrayWithObjects:v181 count:4];

  v109 = (SKKeyframeSequence *)[objc_alloc((Class)SKKeyframeSequence) initWithKeyframeValues:v104 times:v108];
  type2FireworkInnerBlueColorSequence = self->_type2FireworkInnerBlueColorSequence;
  self->_type2FireworkInnerBlueColorSequence = v109;

  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:");
  v111 = (UIColor *)objc_claimAutoreleasedReturnValue();
  type2FireworkInnerGreenColor = self->_type2FireworkInnerGreenColor;
  self->_type2FireworkInnerGreenColor = v111;

  v113 = +[UIColor colorWithRed:0.615686275 green:0.992156863 blue:0.0274509804 alpha:1.0];
  type2FireworkOuterGreenColor = self->_type2FireworkOuterGreenColor;
  self->_type2FireworkOuterGreenColor = v113;

  v115 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:");
  v180[0] = v115;
  v116 = +[UIColor colorWithRed:0.615686275 green:0.992156863 blue:0.0274509804 alpha:1.0];
  v180[1] = v116;
  v117 = +[UIColor colorWithRed:0.737254902 green:0.97254902 blue:0.235294118 alpha:1.0];
  v180[2] = v117;
  v118 = +[UIColor colorWithRed:0.949019608 green:0.964705882 blue:0.870588235 alpha:0.0];
  v180[3] = v118;
  v174 = +[NSArray arrayWithObjects:v180 count:4];

  v179[0] = &off_C5B8;
  v119 = +[NSNumber numberWithDouble:v69 * 0.06];
  v179[1] = v119;
  v120 = +[NSNumber numberWithDouble:v69 * 0.38];
  v179[2] = v120;
  v121 = +[NSNumber numberWithDouble:v69];
  v179[3] = v121;
  v122 = +[NSArray arrayWithObjects:v179 count:4];

  v123 = (SKKeyframeSequence *)[objc_alloc((Class)SKKeyframeSequence) initWithKeyframeValues:v174 times:v122];
  type2FireworkOuterGreenColorSequence = self->_type2FireworkOuterGreenColorSequence;
  self->_type2FireworkOuterGreenColorSequence = v123;

  v125 = +[UIColor colorWithRed:0.949019608 green:0.984313725 blue:0.82745098 alpha:1.0];
  v178[0] = v125;
  v126 = +[UIColor colorWithRed:0.847058824 green:0.941176471 blue:0.376470588 alpha:1.0];
  v178[1] = v126;
  v127 = +[UIColor colorWithRed:0.839215686 green:0.992156863 blue:0.188235294 alpha:1.0];
  v178[2] = v127;
  v128 = +[UIColor colorWithRed:0.988235294 green:0.984313725 blue:0.905882353 alpha:0.0];
  v178[3] = v128;
  v129 = +[NSArray arrayWithObjects:v178 count:4];

  v177[0] = &off_C5B8;
  v130 = +[NSNumber numberWithDouble:v69 * 0.06];
  v177[1] = v130;
  v131 = +[NSNumber numberWithDouble:v69 * 0.36];
  v177[2] = v131;
  v132 = +[NSNumber numberWithDouble:v69];
  v177[3] = v132;
  v133 = +[NSArray arrayWithObjects:v177 count:4];

  v134 = (SKKeyframeSequence *)[objc_alloc((Class)SKKeyframeSequence) initWithKeyframeValues:v129 times:v133];
  type2FireworkInnerGreenColorSequence = self->_type2FireworkInnerGreenColorSequence;
  self->_type2FireworkInnerGreenColorSequence = v134;

  v136 = +[UIColor colorWithRed:1.0 green:0.97254902 blue:0.898039216 alpha:1.0];
  v176[0] = v136;
  v137 = +[UIColor colorWithRed:1.0 green:0.960784314 blue:0.905882353 alpha:1.0];
  v176[1] = v137;
  v138 = +[UIColor colorWithRed:0.992156863 green:0.992156863 blue:0.898039216 alpha:1.0];
  v176[2] = v138;
  v139 = +[NSArray arrayWithObjects:v176 count:3];

  v140 = +[UIColor colorWithRed:1.0 green:0.980392157 blue:0.921568627 alpha:1.0];
  v175[0] = v140;
  v141 = +[UIColor colorWithRed:1.0 green:0.960784314 blue:0.905882353 alpha:1.0];
  v175[1] = v141;
  v142 = +[UIColor colorWithRed:0.992156863 green:0.992156863 blue:0.898039216 alpha:1.0];
  v175[2] = v142;
  v143 = +[NSArray arrayWithObjects:v175 count:3];

  v144 = (SKKeyframeSequence *)[objc_alloc((Class)SKKeyframeSequence) initWithKeyframeValues:v139 times:&off_C660];
  type1FireworkSequence1 = self->_type1FireworkSequence1;
  self->_type1FireworkSequence1 = v144;

  v146 = (SKKeyframeSequence *)[objc_alloc((Class)SKKeyframeSequence) initWithKeyframeValues:v143 times:&off_C660];
  type1FireworkSequence2 = self->_type1FireworkSequence2;
  self->_type1FireworkSequence2 = v146;

  v148 = +[SKFieldNode dragField];
  dragField = self->_dragField;
  self->_dragField = v148;

  LODWORD(v150) = 973279855;
  [(SKFieldNode *)self->_dragField setStrength:v150];
  [(SKFieldNode *)self->_dragField setCategoryBitMask:1];
  v151 = +[SKFieldNode turbulenceFieldWithSmoothness:0.2 animationSpeed:1.0];
  noiseField = self->_noiseField;
  self->_noiseField = v151;

  LODWORD(v153) = 0.5;
  [(SKFieldNode *)self->_noiseField setStrength:v153];
  [(SKFieldNode *)self->_noiseField setCategoryBitMask:2];
  v154 = +[SKFieldNode turbulenceFieldWithSmoothness:0.2 animationSpeed:0.1];
  intenseNoiseField = self->_intenseNoiseField;
  self->_intenseNoiseField = v154;

  LODWORD(v156) = 12.0;
  [(SKFieldNode *)self->_intenseNoiseField setStrength:v156];
  [(SKFieldNode *)self->_intenseNoiseField setCategoryBitMask:4];
  [(GameScene *)self addChild:self->_dragField];
  [(GameScene *)self addChild:self->_noiseField];
  [(GameScene *)self addChild:self->_intenseNoiseField];
  [(GameScene *)self frame];
  double v158 = v157;
  [(GameScene *)self frame];
  if (v158 >= v159) {
    double v160 = v158;
  }
  else {
    double v160 = v159;
  }
  float v161 = v160;
  +[SKSpriteNode spriteNodeWithTexture:size:](SKSpriteNode, "spriteNodeWithTexture:size:", self->_backGlowTexture, v161, v161, v170);
  v162 = (SKSpriteNode *)objc_claimAutoreleasedReturnValue();
  lightHalo = self->_lightHalo;
  self->_lightHalo = v162;

  self->_backGlowScale = 0.75;
  self->_backGlowAlpha = 1.0;
  self->_backGlowDuration = 1.55;
  v164 = +[UIColor clearColor];
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v164;

  v166 = +[UIColor colorWithRed:0.125490196 green:0.11372549 blue:0.145098039 alpha:1.0];
  backgroundLitColor = self->_backgroundLitColor;
  self->_backgroundLitColor = v166;

  v168 = self->_backgroundColor;
  v169 = [(GameScene *)self scene];
  [v169 setBackgroundColor:v168];
}

- (void)runChoregraphy
{
  [(GameScene *)self removeAllActions];
  v3 = [(GameScene *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  float v8 = v5;
  float globalScale = self->_globalScale;
  float type1FireworkScale = self->_type1FireworkScale;
  *(float *)&double v7 = v7;
  float type2FireworkScale = self->_type2FireworkScale;
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_5500;
  v86[3] = &unk_C250;
  v86[4] = self;
  float v87 = v8;
  int v88 = LODWORD(v7);
  float v89 = globalScale;
  float v90 = type1FireworkScale;
  v12 = objc_retainBlock(v86);
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_5564;
  v81[3] = &unk_C250;
  v81[4] = self;
  float v82 = v8;
  int v83 = LODWORD(v7);
  float v84 = globalScale;
  float v85 = type2FireworkScale;
  v13 = objc_retainBlock(v81);
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_55C8;
  v76[3] = &unk_C250;
  v76[4] = self;
  float v77 = v8;
  int v78 = LODWORD(v7);
  float v79 = globalScale;
  float v80 = type2FireworkScale;
  v14 = objc_retainBlock(v76);
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_562C;
  v71[3] = &unk_C250;
  v71[4] = self;
  float v72 = v8;
  int v73 = LODWORD(v7);
  float v74 = globalScale;
  float v75 = type2FireworkScale;
  v15 = objc_retainBlock(v71);
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_56A4;
  v66[3] = &unk_C250;
  v66[4] = self;
  float v67 = v8;
  int v68 = LODWORD(v7);
  float v69 = globalScale;
  float v70 = type2FireworkScale;
  v16 = objc_retainBlock(v66);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_5708;
  v61[3] = &unk_C250;
  v61[4] = self;
  float v62 = v8;
  int v63 = LODWORD(v7);
  float v64 = globalScale;
  float v65 = type1FireworkScale;
  v17 = objc_retainBlock(v61);
  v52 = v12;
  v18 = objc_retainBlock(v12);
  v92[0] = v18;
  v51 = v13;
  v19 = objc_retainBlock(v13);
  v92[1] = v19;
  v50 = v14;
  v20 = objc_retainBlock(v14);
  v92[2] = v20;
  v49 = v15;
  v21 = objc_retainBlock(v15);
  v92[3] = v21;
  v48 = v16;
  v22 = objc_retainBlock(v16);
  v92[4] = v22;
  v47 = v17;
  v23 = objc_retainBlock(v17);
  v92[5] = v23;
  v24 = +[NSArray arrayWithObjects:v92 count:6];

  v25 = +[NSMutableArray array];
  uint64_t v26 = 0;
  LODWORD(v27) = 0;
  do
  {
    float v28 = flt_A64C[v26];
    v29 = +[SKAction waitForDuration:(float)(v28 - *(float *)&v27)];
    [v25 addObject:v29];

    v30 = [v24 objectAtIndexedSubscript:v26];
    v31 = +[SKAction runBlock:v30];
    [v25 addObject:v31];

    ++v26;
    *(float *)&double v27 = v28;
  }
  while (v26 != 6);
  id v32 = +[SKAction sequence:](SKAction, "sequence:", v25, v27);
  [(GameScene *)self runAction:v32];

  v33 = self->_backgroundColor;
  v34 = self->_backgroundLitColor;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_576C;
  v57[3] = &unk_C278;
  v35 = v33;
  v58 = v35;
  double v36 = v34;
  double v59 = v36;
  float v60 = self;
  v44 = objc_retainBlock(v57);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_58E4;
  v53[3] = &unk_C278;
  v54 = v36;
  v55 = v35;
  v56 = self;
  v46 = v35;
  v45 = v36;
  v37 = objc_retainBlock(v53);
  v38 = +[SKAction waitForDuration:0.409999996];
  v91[0] = v38;
  v39 = +[SKAction customActionWithDuration:v44 actionBlock:0.819999993];
  v91[1] = v39;
  v40 = +[SKAction waitForDuration:1.0];
  v91[2] = v40;
  v41 = +[SKAction customActionWithDuration:v37 actionBlock:1.73000002];
  v91[3] = v41;
  v42 = +[NSArray arrayWithObjects:v91 count:4];
  v43 = +[SKAction sequence:v42];
  [(GameScene *)self runAction:v43];
}

- (void)launchFireworkAt:(CGPoint)a3 type:(unint64_t)a4 scale:(float)a5 color:(unint64_t)a6
{
  float v6 = a5;
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    if (a4 != 2)
    {
      if (a4 != 1) {
        return;
      }
      if (!self->_type1FireworkEnabled)
      {
        BOOL type2FireworkEnabled = self->_type2FireworkEnabled;
        goto LABEL_12;
      }
      goto LABEL_21;
    }
    if (!self->_type2FireworkEnabled)
    {
      if (!self->_type1FireworkEnabled) {
        return;
      }
      goto LABEL_21;
    }
LABEL_18:
    a5 = v6;
    [(GameScene *)self createFireworkTypeTwoAt:x scale:y color:*(double *)&a5];
    return;
  }
  BOOL type2FireworkEnabled = self->_type2FireworkEnabled;
  if (self->_type1FireworkEnabled && type2FireworkEnabled)
  {
    double v12 = drand48();
    if (!vcvtmd_s64_f64(v12 + v12)) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  if (!self->_type1FireworkEnabled)
  {
LABEL_12:
    if (!type2FireworkEnabled) {
      return;
    }
    goto LABEL_18;
  }
LABEL_21:
  a5 = v6;

  -[GameScene createFireworkTypeOneAt:scale:](self, "createFireworkTypeOneAt:scale:", x, y, *(double *)&a5);
}

- (void)runLightHaloEffectAt:(CGPoint)a3 scale:(float)a4 color:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  id v10 = [(SKSpriteNode *)self->_lightHalo copy];
  objc_msgSend(v10, "setPosition:", x, y);
  [v10 setScale:(float)(self->_backGlowScale * a4)];
  [v10 setAlpha:self->_backGlowAlpha];
  [v10 setColorBlendFactor:1.0];
  if (a5 <= 3) {
    [v10 setColor:*(Class *)((char *)&self->super.super.super.super.super.isa + *(&off_C418)[a5])];
  }
  [(GameScene *)self addChild:v10];
  v11 = +[SKAction fadeOutWithDuration:self->_backGlowDuration];
  v15[0] = v11;
  double v12 = +[SKAction removeFromParent];
  v15[1] = v12;
  v13 = +[NSArray arrayWithObjects:v15 count:2];
  v14 = +[SKAction sequence:v13];
  [v10 runAction:v14];
}

- (void)createFireworkTypeOneAt:(CGPoint)a3 scale:(float)a4
{
  double y = a3.y;
  double x = a3.x;
  -[GameScene runOrbParticleEmitter:scale:color:](self, "runOrbParticleEmitter:scale:color:", self->_whiteColor);
  LODWORD(v8) = 1.0;
  LODWORD(v9) = 1.0;
  *(float *)&double v10 = a4;
  -[GameScene runSparkleEmitter:scale:rangeRatio:particleSizeRatio:color:texture:](self, "runSparkleEmitter:scale:rangeRatio:particleSizeRatio:color:texture:", 0, self->_sparklesType1Texture, x, y, v10, v8, v9);
  *(float *)&double v11 = a4;
  -[GameScene runTrailParticleEmitter:scale:](self, "runTrailParticleEmitter:scale:", x, y, v11);
  *(float *)&double v12 = a4;
  -[GameScene runSmokeEmitter:scale:color:](self, "runSmokeEmitter:scale:color:", self->_type1SmokeColor, x, y, v12);

  *(float *)&double v13 = a4 * 0.5;
  -[GameScene runLightHaloEffectAt:scale:color:](self, "runLightHaloEffectAt:scale:color:", 0, x, y, v13);
}

- (void)createFireworkTypeTwoAt:(CGPoint)a3 scale:(float)a4 color:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  double v9 = &OBJC_IVAR___GameScene__type2FireworkOuterPinkColor;
  double v10 = &OBJC_IVAR___GameScene__type2FireworkInnerBlueColor;
  double v11 = &OBJC_IVAR___GameScene__type2FireworkOuterBlueColor;
  uint64_t v12 = 6;
  uint64_t v13 = 7;
  if (a5 == 3)
  {
    double v11 = &OBJC_IVAR___GameScene__type2FireworkOuterGreenColor;
    double v10 = &OBJC_IVAR___GameScene__type2FireworkInnerGreenColor;
    uint64_t v14 = 3;
  }
  else
  {
    uint64_t v14 = 2;
  }
  if (a5 == 3)
  {
    uint64_t v13 = 9;
    uint64_t v12 = 8;
  }
  if (a5 == 1)
  {
    v15 = &OBJC_IVAR___GameScene__type2FireworkInnerPinkColor;
  }
  else
  {
    double v9 = v11;
    v15 = v10;
  }
  if (a5 == 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v14;
  }
  if (a5 == 1) {
    uint64_t v17 = 5;
  }
  else {
    uint64_t v17 = v13;
  }
  if (a5 == 1) {
    uint64_t v18 = 4;
  }
  else {
    uint64_t v18 = v12;
  }
  id v19 = *(id *)((char *)&self->super.super.super.super.super.isa + *v9);
  id v35 = *(id *)((char *)&self->super.super.super.super.super.isa + *v15);
  *(float *)&double v20 = a4;
  -[GameScene runSmokeEmitter:scale:color:](self, "runSmokeEmitter:scale:color:", v19, x, y, v20);
  LODWORD(v21) = 1066192077;
  LODWORD(v22) = 0.5;
  *(float *)&double v23 = a4;
  -[GameScene runSparkleEmitter:scale:rangeRatio:particleSizeRatio:color:texture:](self, "runSparkleEmitter:scale:rangeRatio:particleSizeRatio:color:texture:", 0, self->_sparklesType2Texture, x, y, v23, v21, v22);
  LODWORD(v24) = 1.5;
  *(float *)&double v25 = a4;
  -[GameScene runEndingSparkleParticleEmitter:scale:radius:color:](self, "runEndingSparkleParticleEmitter:scale:radius:color:", v19, x, y, v25, v24);
  LODWORD(v26) = 0.5;
  *(float *)&double v27 = a4;
  -[GameScene runEndingSparkleParticleEmitter:scale:radius:color:](self, "runEndingSparkleParticleEmitter:scale:radius:color:", v35, x, y, v27, v26);
  LODWORD(v28) = 1.0;
  LODWORD(v29) = 1.5;
  *(float *)&double v30 = a4;
  -[GameScene runSparkleEmitter:scale:rangeRatio:particleSizeRatio:color:texture:](self, "runSparkleEmitter:scale:rangeRatio:particleSizeRatio:color:texture:", v17, self->_sparklesType2Texture, x, y, v30, v28, v29);
  LODWORD(v31) = 1051931443;
  LODWORD(v32) = 1.0;
  *(float *)&double v33 = a4;
  -[GameScene runSparkleEmitter:scale:rangeRatio:particleSizeRatio:color:texture:](self, "runSparkleEmitter:scale:rangeRatio:particleSizeRatio:color:texture:", v18, self->_sparklesType2Texture, x, y, v33, v31, v32);
  *(float *)&double v34 = a4 * 0.5;
  -[GameScene runLightHaloEffectAt:scale:color:](self, "runLightHaloEffectAt:scale:color:", v16, x, y, v34);
}

- (void)runSparkleEmitter:(CGPoint)a3 scale:(float)a4 rangeRatio:(float)a5 particleSizeRatio:(float)a6 color:(unint64_t)a7 texture:(id)a8
{
  double y = a3.y;
  double x = a3.x;
  id v15 = a8;
  id v16 = [(SKEmitterNode *)self->_sparklesParticleEmitter copy];
  objc_msgSend(v16, "setPosition:", x, y);
  [v16 particleScale];
  [v16 setParticleScale:v17 * (float)(a4 * a6)];
  [v16 particleSpeed];
  double v18 = (float)(a4 * a5);
  [v16 setParticleSpeed:v19 * v18];
  [v16 particleSpeedRange];
  [v16 setParticleSpeedRange:v20 * v18];
  [v16 setParticleColorSequence:0];
  [v16 setParticleColorBlendFactor:1.0];
  [v16 setParticleColorBlendFactorRange:0.0];
  [v16 setParticleColorBlendFactorSpeed:0.0];
  [v16 setParticleBlendMode:1];
  if ([(GameScene *)self shouldReduceParticles])
  {
    double v21 = 0.8;
  }
  else
  {
    if (a5 >= 1.0) {
      goto LABEL_6;
    }
    double v21 = 1.2;
  }
  objc_msgSend(v16, "setNumParticlesToEmit:", (unint64_t)(v21 * (double)(unint64_t)objc_msgSend(v16, "numParticlesToEmit")));
LABEL_6:
  switch(a7)
  {
    case 0uLL:
      [v16 setParticleColor:self->_whiteColor];
      break;
    case 4uLL:
      uint64_t v22 = 120;
      goto LABEL_14;
    case 5uLL:
      uint64_t v22 = 128;
      goto LABEL_14;
    case 6uLL:
      uint64_t v22 = 152;
      goto LABEL_14;
    case 7uLL:
      uint64_t v22 = 160;
      goto LABEL_14;
    case 8uLL:
      uint64_t v22 = 184;
      goto LABEL_14;
    case 9uLL:
      uint64_t v22 = 192;
LABEL_14:
      [v16 setParticleColorSequence:*(Class *)((char *)&self->super.super.super.super.super.isa + v22)];
      break;
    default:
      break;
  }
  [v16 setParticleTexture:v15];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_65D0;
  v52[3] = &unk_C2E0;
  id v23 = v16;
  id v53 = v23;
  double v24 = objc_retainBlock(v52);
  id v25 = objc_alloc((Class)SKKeyframeSequence);
  v55[0] = &off_C6A8;
  [v23 particleLifetime];
  double v27 = +[NSNumber numberWithDouble:v26 * 3.0 * 0.25];
  v55[1] = v27;
  [v23 particleLifetime];
  double v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v55[2] = v28;
  double v29 = +[NSArray arrayWithObjects:v55 count:3];
  id v30 = [v25 initWithKeyframeValues:&off_C678 times:v29];

  [v23 setParticleSpeedSequence:v30];
  [v23 particleLifetime];
  double v32 = v31;
  [v23 particleLifetimeRange];
  double v34 = +[SKAction waitForDuration:v32 + v33];
  v54[0] = v34;
  id v35 = +[SKAction runBlock:v24];
  v54[1] = v35;
  double v36 = +[SKAction removeFromParent];
  v54[2] = v36;
  v37 = +[NSArray arrayWithObjects:v54 count:3];
  v38 = +[SKAction sequence:v37];
  [v23 runAction:v38];

  [(GameScene *)self addChild:v23];
  v39 = [v23 subEmitterNode];
  v40 = [v23 subEmitterNode];
  [v40 particleScale];
  [v40 setParticleScale:v41 * 0.5];
  [v40 particleSpeed];
  [v40 setParticleSpeed:v42 * 0.2];
  objc_msgSend(v40, "setNumParticlesToEmit:", (unint64_t)((double)(unint64_t)objc_msgSend(v40, "numParticlesToEmit") * 0.2));
  objc_msgSend(v40, "setParticleBirthRate:", (double)(unint64_t)objc_msgSend(v40, "numParticlesToEmit") * 10.0);
  [v23 particleScale];
  float v44 = v43;
  [v23 particleSpeed];
  float v46 = v45;
  float v47 = (float)(unint64_t)[v23 numParticlesToEmit];
  [v23 particleBirthRate];
  float v49 = v48;
  int v50 = 5;
  do
  {
    v51 = [v23 subEmitterNode];
    float v44 = v44 * 0.995;
    float v46 = v46 * 0.8;
    float v47 = v47 * 0.5;
    float v49 = v49 * 0.4;
    [v51 setParticleScale:v44];
    [v51 setParticleSpeed:v46];
    [v51 setNumParticlesToEmit:(unint64_t)v47];
    [v51 setParticleBirthRate:v49];
    [v23 addChild:v51];

    --v50;
  }
  while (v50);
  [v23 addChild:v39];
  [v23 addChild:v40];
}

- (void)runSmokeEmitter:(CGPoint)a3 scale:(float)a4 color:(id)a5
{
  CGFloat y = a3.y;
  double x = a3.x;
  smokeParticleEmitter = self->_smokeParticleEmitter;
  id v10 = a5;
  id v11 = [(SKEmitterNode *)smokeParticleEmitter copy];
  objc_msgSend(v11, "setPosition:", x, y);
  [v11 setParticleColor:v10];

  [v11 particleLifetime];
  uint64_t v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  double v24 = sub_6838;
  id v25 = &unk_C308;
  *(float *)&CGFloat y = v12 * 0.8;
  int v27 = LODWORD(y);
  id v26 = v11;
  id v13 = v11;
  uint64_t v14 = objc_retainBlock(&v22);
  double v15 = *(float *)&y;
  id v16 = +[SKAction customActionWithDuration:actionBlock:](SKAction, "customActionWithDuration:actionBlock:", v14, v15, v22, v23, v24, v25);
  v28[0] = v16;
  [v13 particleLifetime];
  double v18 = +[SKAction waitForDuration:v17 - v15];
  v28[1] = v18;
  double v19 = +[SKAction removeFromParent];
  v28[2] = v19;
  double v20 = +[NSArray arrayWithObjects:v28 count:3];
  double v21 = +[SKAction sequence:v20];

  [v13 runAction:v21];
  [v13 setScale:a4];
  [(GameScene *)self addChild:v13];
}

- (void)runOrbParticleEmitter:(CGPoint)a3 scale:(float)a4 color:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  orbParticleEmitter = self->_orbParticleEmitter;
  id v10 = a5;
  id v11 = [(SKEmitterNode *)orbParticleEmitter copy];
  id v12 = [(SKEmitterNode *)self->_orbParticleEmitter copy];
  [v11 particleScale];
  float v14 = v13;
  [v11 particleScale];
  float v16 = v15 * 0.01;
  [v11 particleBirthRate];
  float v18 = v17;
  [v11 emissionDistance];
  double v19 = a4;
  float v21 = v20 * v19;
  [v11 setParticleColor:v10];

  uint64_t v22 = [v11 particleColor];
  [v12 setParticleColor:v22];

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_6C70;
  v49[3] = &unk_C330;
  float v52 = v14;
  float v53 = v16;
  id v23 = v11;
  id v50 = v23;
  id v24 = v12;
  id v51 = v24;
  float v54 = v21;
  float v55 = v18;
  float v44 = objc_retainBlock(v49);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_6DA8;
  v46[3] = &unk_C358;
  id v47 = v23;
  id v48 = v24;
  id v25 = v24;
  id v26 = v23;
  double v43 = objc_retainBlock(v46);
  int v27 = +[SKAction customActionWithDuration:v44 actionBlock:1.10000002];
  v57[0] = v27;
  double v28 = +[SKAction runBlock:v43];
  v57[1] = v28;
  [v26 particleLifetime];
  double v30 = v29;
  [v26 particleLifetimeRange];
  double v32 = +[SKAction waitForDuration:v30 + v31];
  v57[2] = v32;
  double v33 = +[SKAction removeFromParent];
  v57[3] = v33;
  double v34 = +[NSArray arrayWithObjects:v57 count:4];
  id v35 = +[SKAction sequence:v34];

  [v26 particleLifetime];
  double v37 = v36 + 1.10000002;
  [v26 particleLifetimeRange];
  v39 = +[SKAction waitForDuration:v37 + v38];
  v56[0] = v39;
  v40 = +[SKAction removeFromParent];
  v56[1] = v40;
  double v41 = +[NSArray arrayWithObjects:v56 count:2];
  double v42 = +[SKAction sequence:v41];

  objc_msgSend(v26, "setPosition:", x, y);
  objc_msgSend(v25, "setPosition:", x, y);
  [v26 setScale:v19];
  [v25 setScale:v19];
  [(GameScene *)self addChild:v26];
  [v26 runAction:v35];
  [(GameScene *)self addChild:v25];
  [v25 runAction:v42];
}

- (void)runEndingSparkleParticleEmitter:(CGPoint)a3 scale:(float)a4 radius:(float)a5 color:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  orbParticleEmitter = self->_orbParticleEmitter;
  id v12 = a6;
  id v13 = [(SKEmitterNode *)orbParticleEmitter copy];
  [v13 emissionDistance];
  float v15 = v14;
  [v13 setParticleColor:v12];

  [v13 setParticleAlpha:1.0];
  [v13 setParticleAlphaRange:0.0];
  [v13 setParticleBirthRate:0.0];
  double v37 = self;
  [v13 setParticleTexture:self->_sparklesType2Texture];
  [v13 setParticleLifetime:0.6];
  [v13 setParticleLifetimeRange:1.0];
  [v13 setParticleSpeed:0.0];
  [v13 setNumParticlesToEmit:0];
  [v13 setYAcceleration:-6.0];
  [v13 particleScaleRange];
  [v13 setParticleScaleRange:v16 * 1.5];
  [v13 particleScale];
  double v17 = a4;
  [v13 setParticleScale:v18 * v17];
  [v13 setYAcceleration:-30.0];
  double v19 = [v13 physicsBody];
  [v19 setAffectedByGravity:1];

  [v13 setEmissionDistance:(float)(v15 * a5)];
  [v13 emissionDistance];
  [v13 setEmissionDistanceRange:v20 + v20];
  if ([(GameScene *)self shouldReduceParticles]) {
    float v21 = 100.0;
  }
  else {
    float v21 = 200.0;
  }
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_71E4;
  v40[3] = &unk_C380;
  id v22 = v13;
  id v41 = v22;
  float v42 = v21;
  double v36 = objc_retainBlock(v40);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_71F4;
  v38[3] = &unk_C2E0;
  id v39 = v22;
  id v23 = v22;
  id v24 = objc_retainBlock(v38);
  id v25 = +[SKAction waitForDuration:1.04999995];
  v43[0] = v25;
  id v26 = +[SKAction runBlock:v36];
  v43[1] = v26;
  int v27 = +[SKAction waitForDuration:1.5];
  v43[2] = v27;
  double v28 = +[SKAction runBlock:v24];
  v43[3] = v28;
  [v23 particleLifetime];
  double v30 = v29;
  [v23 particleLifetimeRange];
  double v32 = +[SKAction waitForDuration:v30 + v31];
  v43[4] = v32;
  double v33 = +[SKAction removeFromParent];
  v43[5] = v33;
  double v34 = +[NSArray arrayWithObjects:v43 count:6];
  id v35 = +[SKAction sequence:v34];

  objc_msgSend(v23, "setPosition:", x, y);
  [v23 setScale:v17];
  [(GameScene *)v37 addChild:v23];
  [v23 runAction:v35];
}

- (void)runTrailParticleEmitter:(CGPoint)a3 scale:(float)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(SKEmitterNode *)self->_trailParticleEmitter copy];
  [v8 setParticleBlendMode:1];
  [v8 setScale:a4];
  [(GameScene *)self addChild:v8];
  int type1FireworkTrailCount = self->_type1FireworkTrailCount;
  if (type1FireworkTrailCount < 1)
  {
    double v26 = 0.0;
  }
  else
  {
    float v10 = (float)type1FireworkTrailCount;
    float v11 = 6.28318531 / (float)type1FireworkTrailCount;
    double v31 = v11;
    float v12 = 0.0;
    int v13 = 1;
    float v14 = 0.0;
    do
    {
      float v15 = (float)(v12 * v11) + (drand48() + -0.5) * v31;
      *(float *)&double v16 = (drand48() * 0.005 + 0.01) * 10.0;
      *(float *)&double v17 = v15;
      -[GameScene launchTrailAt:angle:speed:group:](self, "launchTrailAt:angle:speed:group:", v8, x, y, v17, v16);
      if (v14 < v18) {
        float v14 = v18;
      }
      float v12 = (float)v13++;
    }
    while (v12 < v10);
    int v19 = 1;
    do
    {
      double v20 = drand48();
      float v21 = (v20 + v20) * 3.14159265;
      *(float *)&double v22 = (drand48() * 0.008 + 0.0001) * 10.0;
      *(float *)&double v23 = v21;
      -[GameScene launchTrailAt:angle:speed:group:](self, "launchTrailAt:angle:speed:group:", v8, x, y, v23, v22);
      if (v14 < v24) {
        float v14 = v24;
      }
      float v25 = (float)v19++;
    }
    while (v25 < v10);
    double v26 = v14;
  }
  int v27 = +[SKAction waitForDuration:](SKAction, "waitForDuration:", v26, *(void *)&v31);
  v32[0] = v27;
  double v28 = +[SKAction removeFromParent];
  v32[1] = v28;
  double v29 = +[NSArray arrayWithObjects:v32 count:2];
  double v30 = +[SKAction sequence:v29];
  [v8 runAction:v30];
}

- (float)launchTrailAt:(CGPoint)a3 angle:(float)a4 speed:(float)a5 group:(id)a6
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v10 = a6;
  id v11 = [(SKNode *)self->_trailContainer copy];
  id v51 = v10;
  float v12 = [v10 subEmitterNode];
  [v11 addChild:v12];
  [v51 addChild:v11];
  [v51 xScale];
  double v14 = v13;
  [v51 xScale];
  [v11 setScale:1.0 / (v14 * v15)];
  __float2 v16 = __sincosf_stret(a4);
  objc_msgSend(v12, "setPosition:", x, y);
  [v12 setTargetNode:self];
  double v43 = drand48();
  double v47 = drand48();
  [v12 particleLifetime];
  double v42 = v17;
  [v12 particleScale];
  double v19 = v18;
  [v12 particleScale];
  double v21 = v20;
  [v12 particleBirthRate];
  double v23 = v22;
  [v12 particleBirthRate];
  double v25 = v24;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  BOOL v76 = 0;
  BOOL v76 = drand48() > 0.25;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  char v74 = 0;
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_7A2C;
  v67[3] = &unk_C3A8;
  float v69 = v73;
  id v26 = v11;
  id v68 = v26;
  double cosval = v16.__cosval;
  double sinval = v16.__sinval;
  float v72 = a5;
  float v46 = objc_retainBlock(v67);
  *(float *)&CGFloat y = v47 * 0.2 + 1.28;
  *(float *)&CGFloat x = v19;
  *(float *)&double v19 = v21 * 0.6;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_7A98;
  v58[3] = &unk_C3D0;
  int v62 = LODWORD(y);
  id v28 = v12;
  int v63 = LODWORD(x);
  float v64 = *(float *)&v19;
  float v27 = v23;
  float v65 = v27;
  *(float *)&double v21 = v25 * 0.2;
  int v66 = LODWORD(v21);
  id v59 = v28;
  v61 = v75;
  id v44 = v26;
  id v60 = v44;
  id v50 = objc_retainBlock(v58);
  float v29 = (float)(2.0 - *(float *)&y) * 2.2;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_7C78;
  void v54[3] = &unk_C3F8;
  float v56 = v29;
  id v30 = v28;
  id v55 = v30;
  int v57 = LODWORD(v19);
  id v48 = objc_retainBlock(v54);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_7CA4;
  v52[3] = &unk_C2E0;
  id v45 = v30;
  id v53 = v45;
  double v31 = objc_retainBlock(v52);
  *(float *)&CGFloat x = v43 * 0.005 + v43 * 0.005;
  double v32 = +[SKAction waitForDuration:*(float *)&x];
  v77[0] = v32;
  double v33 = +[SKAction runBlock:v46];
  v77[1] = v33;
  double v34 = +[SKAction customActionWithDuration:v50 actionBlock:*(float *)&y];
  v77[2] = v34;
  id v35 = +[SKAction customActionWithDuration:v48 actionBlock:v29];
  v77[3] = v35;
  double v36 = +[SKAction runBlock:v31];
  v77[4] = v36;
  [v45 particleLifetime];
  double v37 = +[SKAction waitForDuration:](SKAction, "waitForDuration:");
  v77[5] = v37;
  double v38 = +[SKAction removeFromParent];
  v77[6] = v38;
  id v39 = +[NSArray arrayWithObjects:v77 count:7];
  v40 = +[SKAction sequence:v39];
  [v44 runAction:v40];

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);

  return (v42 + (float)((float)(*(float *)&x + *(float *)&y) + v29)) * 1.2;
}

- (BOOL)type1FireworkEnabled
{
  return self->_type1FireworkEnabled;
}

- (void)setType1FireworkEnabled:(BOOL)a3
{
  self->_type1FireworkEnabled = a3;
}

- (BOOL)type2FireworkEnabled
{
  return self->_type2FireworkEnabled;
}

- (void)setType2FireworkEnabled:(BOOL)a3
{
  self->_BOOL type2FireworkEnabled = a3;
}

- (float)globalScale
{
  return self->_globalScale;
}

- (void)setGlobalScale:(float)a3
{
  self->_float globalScale = a3;
}

- (BOOL)shouldReduceParticles
{
  return self->_shouldReduceParticles;
}

- (void)setShouldReduceParticles:(BOOL)a3
{
  self->_shouldReduceParticles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intenseNoiseField, 0);
  objc_storeStrong((id *)&self->_noiseField, 0);
  objc_storeStrong((id *)&self->_dragField, 0);
  objc_storeStrong((id *)&self->_type1FireworkSequence2, 0);
  objc_storeStrong((id *)&self->_type1FireworkSequence1, 0);
  objc_storeStrong((id *)&self->_backgroundLitColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type1SmokeColor, 0);
  objc_storeStrong((id *)&self->_whiteColor, 0);
  objc_storeStrong((id *)&self->_type2FireworkOuterGreenColorSequence, 0);
  objc_storeStrong((id *)&self->_type2FireworkInnerGreenColorSequence, 0);
  objc_storeStrong((id *)&self->_type2FireworkOuterGreenColor, 0);
  objc_storeStrong((id *)&self->_type2FireworkInnerGreenColor, 0);
  objc_storeStrong((id *)&self->_type2FireworkOuterBlueColorSequence, 0);
  objc_storeStrong((id *)&self->_type2FireworkInnerBlueColorSequence, 0);
  objc_storeStrong((id *)&self->_type2FireworkOuterBlueColor, 0);
  objc_storeStrong((id *)&self->_type2FireworkInnerBlueColor, 0);
  objc_storeStrong((id *)&self->_type2FireworkOuterPinkColorSequence, 0);
  objc_storeStrong((id *)&self->_type2FireworkInnerPinkColorSequence, 0);
  objc_storeStrong((id *)&self->_type2FireworkOuterPinkColor, 0);
  objc_storeStrong((id *)&self->_type2FireworkInnerPinkColor, 0);
  objc_storeStrong((id *)&self->_sparklesType2Texture, 0);
  objc_storeStrong((id *)&self->_sparklesType1Texture, 0);
  objc_storeStrong((id *)&self->_backGlowTexture, 0);
  objc_storeStrong((id *)&self->_sparkSoftGlowTexture, 0);
  objc_storeStrong((id *)&self->_sparkTexture, 0);
  objc_storeStrong((id *)&self->_emitterGlowSphereTexture, 0);
  objc_storeStrong((id *)&self->_lightHalo, 0);
  objc_storeStrong((id *)&self->_trailContainer, 0);
  objc_storeStrong((id *)&self->_smokeParticleEmitter, 0);
  objc_storeStrong((id *)&self->_sparklesParticleEmitter, 0);
  objc_storeStrong((id *)&self->_trailParticleEmitter, 0);

  objc_storeStrong((id *)&self->_orbParticleEmitter, 0);
}

@end