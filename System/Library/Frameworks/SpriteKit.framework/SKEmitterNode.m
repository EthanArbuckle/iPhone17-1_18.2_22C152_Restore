@interface SKEmitterNode
+ (BOOL)supportsSecureCoding;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable;
- (BOOL)densityBased;
- (BOOL)isEqualToNode:(id)a3;
- (BOOL)usesPointSprites;
- (BOOL)wantsNewParticles;
- (CGFloat)emissionAngle;
- (CGFloat)emissionAngleRange;
- (CGFloat)particleAlpha;
- (CGFloat)particleAlphaRange;
- (CGFloat)particleAlphaSpeed;
- (CGFloat)particleBirthRate;
- (CGFloat)particleColorAlphaRange;
- (CGFloat)particleColorAlphaSpeed;
- (CGFloat)particleColorBlendFactor;
- (CGFloat)particleColorBlendFactorRange;
- (CGFloat)particleColorBlendFactorSpeed;
- (CGFloat)particleColorBlueRange;
- (CGFloat)particleColorBlueSpeed;
- (CGFloat)particleColorGreenRange;
- (CGFloat)particleColorGreenSpeed;
- (CGFloat)particleColorRedRange;
- (CGFloat)particleColorRedSpeed;
- (CGFloat)particleLifetime;
- (CGFloat)particleLifetimeRange;
- (CGFloat)particleRotation;
- (CGFloat)particleRotationRange;
- (CGFloat)particleRotationSpeed;
- (CGFloat)particleScale;
- (CGFloat)particleScaleRange;
- (CGFloat)particleScaleSpeed;
- (CGFloat)particleSpeed;
- (CGFloat)particleSpeedRange;
- (CGFloat)particleZPosition;
- (CGFloat)particleZPositionRange;
- (CGFloat)particleZPositionSpeed;
- (CGFloat)xAcceleration;
- (CGFloat)yAcceleration;
- (CGPoint)particlePosition;
- (CGSize)particleSize;
- (CGVector)particlePositionRange;
- (NSUInteger)numParticlesToEmit;
- (SKAction)particleAction;
- (SKAttributeValue)valueForAttributeNamed:(NSString *)key;
- (SKBlendMode)particleBlendMode;
- (SKEmitterNode)init;
- (SKEmitterNode)initWithCoder:(id)a3;
- (SKEmitterNode)initWithMinimumParticleCapacity:(unint64_t)a3;
- (SKEmitterNode)initWithMinimumParticleCapacity:(unint64_t)a3 minimumPositionBufferCapacity:(unint64_t)a4;
- (SKKeyframeSequence)particleAlphaSequence;
- (SKKeyframeSequence)particleColorBlendFactorSequence;
- (SKKeyframeSequence)particleColorSequence;
- (SKKeyframeSequence)particleScaleSequence;
- (SKNode)targetNode;
- (SKParticleRenderOrder)particleRenderOrder;
- (SKShader)shader;
- (SKTexture)particleTexture;
- (UIColor)particleColor;
- (double)emissionDistance;
- (double)emissionDistanceRange;
- (double)particleDensity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fieldInfluenceSequence;
- (id)particleRotationSequence;
- (id)particleSpeedSequence;
- (id)physicsWorld;
- (id)subEmitterNode;
- (uint32_t)fieldBitMask;
- (unsigned)activeParticleCount;
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
- (void)advanceSimulationTime:(NSTimeInterval)sec;
- (void)copyParticlePropertiesToNode:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)resetSimulation;
- (void)setDensityBased:(BOOL)a3;
- (void)setEmissionAngle:(CGFloat)emissionAngle;
- (void)setEmissionAngleRange:(CGFloat)emissionAngleRange;
- (void)setEmissionDistance:(double)a3;
- (void)setEmissionDistanceRange:(double)a3;
- (void)setFieldBitMask:(uint32_t)fieldBitMask;
- (void)setFieldInfluenceSequence:(id)a3;
- (void)setNumParticlesToEmit:(NSUInteger)numParticlesToEmit;
- (void)setParticleAction:(SKAction *)particleAction;
- (void)setParticleAlpha:(CGFloat)particleAlpha;
- (void)setParticleAlphaRange:(CGFloat)particleAlphaRange;
- (void)setParticleAlphaSequence:(SKKeyframeSequence *)particleAlphaSequence;
- (void)setParticleAlphaSpeed:(CGFloat)particleAlphaSpeed;
- (void)setParticleBirthRate:(CGFloat)particleBirthRate;
- (void)setParticleBlendMode:(SKBlendMode)particleBlendMode;
- (void)setParticleColor:(UIColor *)particleColor;
- (void)setParticleColorAlphaRange:(CGFloat)particleColorAlphaRange;
- (void)setParticleColorAlphaSpeed:(CGFloat)particleColorAlphaSpeed;
- (void)setParticleColorBlendFactor:(CGFloat)particleColorBlendFactor;
- (void)setParticleColorBlendFactorRange:(CGFloat)particleColorBlendFactorRange;
- (void)setParticleColorBlendFactorSequence:(SKKeyframeSequence *)particleColorBlendFactorSequence;
- (void)setParticleColorBlendFactorSpeed:(CGFloat)particleColorBlendFactorSpeed;
- (void)setParticleColorBlueRange:(CGFloat)particleColorBlueRange;
- (void)setParticleColorBlueSpeed:(CGFloat)particleColorBlueSpeed;
- (void)setParticleColorGreenRange:(CGFloat)particleColorGreenRange;
- (void)setParticleColorGreenSpeed:(CGFloat)particleColorGreenSpeed;
- (void)setParticleColorRedRange:(CGFloat)particleColorRedRange;
- (void)setParticleColorRedSpeed:(CGFloat)particleColorRedSpeed;
- (void)setParticleColorSequence:(SKKeyframeSequence *)particleColorSequence;
- (void)setParticleDensity:(double)a3;
- (void)setParticleLifetime:(CGFloat)particleLifetime;
- (void)setParticleLifetimeRange:(CGFloat)particleLifetimeRange;
- (void)setParticlePosition:(CGPoint)particlePosition;
- (void)setParticlePositionRange:(CGVector)particlePositionRange;
- (void)setParticleRenderOrder:(SKParticleRenderOrder)particleRenderOrder;
- (void)setParticleRotation:(CGFloat)particleRotation;
- (void)setParticleRotationRange:(CGFloat)particleRotationRange;
- (void)setParticleRotationSequence:(id)a3;
- (void)setParticleRotationSpeed:(CGFloat)particleRotationSpeed;
- (void)setParticleScale:(CGFloat)particleScale;
- (void)setParticleScaleRange:(CGFloat)particleScaleRange;
- (void)setParticleScaleSequence:(SKKeyframeSequence *)particleScaleSequence;
- (void)setParticleScaleSpeed:(CGFloat)particleScaleSpeed;
- (void)setParticleSize:(CGSize)particleSize;
- (void)setParticleSpeed:(CGFloat)particleSpeed;
- (void)setParticleSpeedRange:(CGFloat)particleSpeedRange;
- (void)setParticleSpeedSequence:(id)a3;
- (void)setParticleTexture:(SKTexture *)particleTexture;
- (void)setParticleZPosition:(CGFloat)particleZPosition;
- (void)setParticleZPositionRange:(CGFloat)particleZPositionRange;
- (void)setParticleZPositionSpeed:(CGFloat)particleZPositionSpeed;
- (void)setShader:(SKShader *)shader;
- (void)setTargetNode:(SKNode *)targetNode;
- (void)setUsesPointSprites:(BOOL)a3;
- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key;
- (void)setWantsNewParticles:(BOOL)a3;
- (void)setXAcceleration:(CGFloat)xAcceleration;
- (void)setYAcceleration:(CGFloat)yAcceleration;
- (void)setZPosition:(double)a3;
@end

@implementation SKEmitterNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SKEmitterNode;
  [(SKNode *)&v3 _didMakeBackingNode];
  self->_skcEmitterNode = [(SKNode *)self _backingNode];
}

- (id)subEmitterNode
{
  objc_super v3 = +[SKNode node];
  if (v3)
  {
    [(SKEmitterNode *)self copyParticlePropertiesToNode:v3];
    SKCEmitterNode::addSubEmitterNode((void *)self->_skcEmitterNode, v3[19]);
  }

  return v3;
}

- (id)fieldInfluenceSequence
{
  return self->_fieldInfluenceSequence;
}

- (void)setFieldInfluenceSequence:(id)a3
{
  id v4 = a3;
  v5 = (SKCKeyframeSequence *)*((void *)self->_skcEmitterNode + 83);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x21052EA30]();
    *((void *)self->_skcEmitterNode + 83) = 0;
  }
  if (v4)
  {
    [v4 count];
    operator new();
  }
  fieldInfluenceSequence = self->_fieldInfluenceSequence;
  self->_fieldInfluenceSequence = 0;
}

- (id)particleSpeedSequence
{
  return self->_particleSpeedSequence;
}

- (void)setParticleSpeedSequence:(id)a3
{
  id v4 = a3;
  v5 = (SKCKeyframeSequence *)*((void *)self->_skcEmitterNode + 84);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x21052EA30]();
    *((void *)self->_skcEmitterNode + 84) = 0;
  }
  if (v4)
  {
    [v4 count];
    operator new();
  }
  particleSpeedSequence = self->_particleSpeedSequence;
  self->_particleSpeedSequence = 0;
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKEmitterNode *)a3;
  if (self == v4)
  {
    BOOL v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      skcEmitterNode = (float *)v5->_skcEmitterNode;
      v162.receiver = self;
      v162.super_class = (Class)SKEmitterNode;
      if (![(SKNode *)&v162 isEqualToNode:v5]
        || ([(SKEmitterNode *)self particleBirthRate],
            double v8 = v7,
            [(SKEmitterNode *)v5 particleBirthRate],
            float v9 = v8,
            *(float *)&double v10 = v10,
            (COERCE_UNSIGNED_INT(v9 - *(float *)&v10) & 0x60000000) != 0)
        || (NSUInteger v11 = [(SKEmitterNode *)self numParticlesToEmit],
            v11 != [(SKEmitterNode *)v5 numParticlesToEmit]))
      {
        BOOL v22 = 0;
        goto LABEL_14;
      }
      v12 = [(SKEmitterNode *)self targetNode];
      v13 = [(SKEmitterNode *)v5 targetNode];
      if (v12 == v13)
      {
        [(SKEmitterNode *)self particleLifetime];
        double v15 = v14;
        [(SKEmitterNode *)v5 particleLifetime];
        float v16 = v15;
        *(float *)&double v17 = v17;
        if ((COERCE_UNSIGNED_INT(v16 - *(float *)&v17) & 0x60000000) == 0)
        {
          [(SKEmitterNode *)self particleLifetimeRange];
          double v19 = v18;
          [(SKEmitterNode *)v5 particleLifetimeRange];
          float v20 = v19;
          *(float *)&double v21 = v21;
          if ((COERCE_UNSIGNED_INT(v20 - *(float *)&v21) & 0x60000000) == 0)
          {
            [(SKEmitterNode *)self particlePosition];
            double v25 = v24;
            double v27 = v26;
            [(SKEmitterNode *)v5 particlePosition];
            BOOL v22 = 0;
            if (v25 != v29 || v27 != v28) {
              goto LABEL_10;
            }
            [(SKEmitterNode *)self particlePositionRange];
            double v31 = v30;
            [(SKEmitterNode *)v5 particlePositionRange];
            float v32 = v31;
            *(float *)&double v33 = v33;
            if ((COERCE_UNSIGNED_INT(v32 - *(float *)&v33) & 0x60000000) == 0)
            {
              [(SKEmitterNode *)self particlePositionRange];
              double v35 = v34;
              [(SKEmitterNode *)v5 particlePositionRange];
              float v36 = v35;
              *(float *)&double v37 = v37;
              if ((COERCE_UNSIGNED_INT(v36 - *(float *)&v37) & 0x60000000) == 0)
              {
                [(SKEmitterNode *)self particleZPosition];
                double v39 = v38;
                [(SKEmitterNode *)v5 particleZPosition];
                float v40 = v39;
                *(float *)&double v41 = v41;
                if ((COERCE_UNSIGNED_INT(v40 - *(float *)&v41) & 0x60000000) == 0
                  && (COERCE_UNSIGNED_INT(*((float *)self->_skcEmitterNode + 189) - skcEmitterNode[189]) & 0x60000000) == 0)
                {
                  [(SKEmitterNode *)self particleSpeed];
                  double v43 = v42;
                  [(SKEmitterNode *)v5 particleSpeed];
                  float v44 = v43;
                  *(float *)&double v45 = v45;
                  if ((COERCE_UNSIGNED_INT(v44 - *(float *)&v45) & 0x60000000) == 0)
                  {
                    [(SKEmitterNode *)self particleSpeedRange];
                    double v47 = v46;
                    [(SKEmitterNode *)v5 particleSpeedRange];
                    float v48 = v47;
                    *(float *)&double v49 = v49;
                    if ((COERCE_UNSIGNED_INT(v48 - *(float *)&v49) & 0x60000000) == 0)
                    {
                      [(SKEmitterNode *)self emissionAngle];
                      double v51 = v50;
                      [(SKEmitterNode *)v5 emissionAngle];
                      float v52 = v51;
                      *(float *)&double v53 = v53;
                      if ((COERCE_UNSIGNED_INT(v52 - *(float *)&v53) & 0x60000000) == 0)
                      {
                        [(SKEmitterNode *)self emissionAngleRange];
                        double v55 = v54;
                        [(SKEmitterNode *)v5 emissionAngleRange];
                        float v56 = v55;
                        *(float *)&double v57 = v57;
                        if ((COERCE_UNSIGNED_INT(v56 - *(float *)&v57) & 0x60000000) == 0)
                        {
                          [(SKEmitterNode *)self xAcceleration];
                          double v59 = v58;
                          [(SKEmitterNode *)v5 xAcceleration];
                          float v60 = v59;
                          *(float *)&double v61 = v61;
                          if ((COERCE_UNSIGNED_INT(v60 - *(float *)&v61) & 0x60000000) == 0)
                          {
                            [(SKEmitterNode *)self yAcceleration];
                            double v63 = v62;
                            [(SKEmitterNode *)v5 yAcceleration];
                            float v64 = v63;
                            *(float *)&double v65 = v65;
                            if ((COERCE_UNSIGNED_INT(v64 - *(float *)&v65) & 0x60000000) == 0)
                            {
                              [(SKEmitterNode *)self particleRotation];
                              double v67 = v66;
                              [(SKEmitterNode *)v5 particleRotation];
                              float v68 = v67;
                              *(float *)&double v69 = v69;
                              if ((COERCE_UNSIGNED_INT(v68 - *(float *)&v69) & 0x60000000) == 0)
                              {
                                [(SKEmitterNode *)self particleRotationRange];
                                double v71 = v70;
                                [(SKEmitterNode *)v5 particleRotationRange];
                                float v72 = v71;
                                *(float *)&double v73 = v73;
                                if ((COERCE_UNSIGNED_INT(v72 - *(float *)&v73) & 0x60000000) == 0)
                                {
                                  [(SKEmitterNode *)self particleRotationSpeed];
                                  double v75 = v74;
                                  [(SKEmitterNode *)v5 particleRotationSpeed];
                                  float v76 = v75;
                                  *(float *)&double v77 = v77;
                                  if ((COERCE_UNSIGNED_INT(v76 - *(float *)&v77) & 0x60000000) == 0)
                                  {
                                    v78 = [(SKEmitterNode *)self particleTexture];
                                    v79 = [v78 imageNameOrPath];
                                    v80 = [(SKEmitterNode *)v5 particleTexture];
                                    v81 = [v80 imageNameOrPath];
                                    if (![v79 isEqualToString:v81]) {
                                      goto LABEL_34;
                                    }
                                    [(SKEmitterNode *)self particleSize];
                                    double v83 = v82;
                                    [(SKEmitterNode *)v5 particleSize];
                                    float v84 = v83;
                                    *(float *)&double v85 = v85;
                                    if ((COERCE_UNSIGNED_INT(v84 - *(float *)&v85) & 0x60000000) != 0
                                      || ([(SKEmitterNode *)self particleSize],
                                          double v87 = v86,
                                          [(SKEmitterNode *)v5 particleSize],
                                          float v88 = v87,
                                          *(float *)&double v89 = v89,
                                          (COERCE_UNSIGNED_INT(v88 - *(float *)&v89) & 0x60000000) != 0))
                                    {
LABEL_34:
                                      BOOL v22 = 0;
                                    }
                                    else
                                    {
                                      v161 = [(SKEmitterNode *)self particleColorSequence];
                                      uint64_t v90 = [v161 hash];
                                      v160 = [(SKEmitterNode *)v5 particleColorSequence];
                                      if (v90 == [v160 hash])
                                      {
                                        v159 = [(SKEmitterNode *)self particleColor];
                                        uint64_t v91 = [v159 hash];
                                        v158 = [(SKEmitterNode *)v5 particleColor];
                                        if (v91 != [v158 hash]) {
                                          goto LABEL_46;
                                        }
                                        [(SKEmitterNode *)self particleColorAlphaRange];
                                        double v93 = v92;
                                        [(SKEmitterNode *)v5 particleColorAlphaRange];
                                        float v94 = v93;
                                        *(float *)&double v95 = v95;
                                        if ((COERCE_UNSIGNED_INT(v94 - *(float *)&v95) & 0x60000000) != 0) {
                                          goto LABEL_46;
                                        }
                                        [(SKEmitterNode *)self particleColorBlueRange];
                                        double v97 = v96;
                                        [(SKEmitterNode *)v5 particleColorBlueRange];
                                        float v98 = v97;
                                        *(float *)&double v99 = v99;
                                        if ((COERCE_UNSIGNED_INT(v98 - *(float *)&v99) & 0x60000000) != 0) {
                                          goto LABEL_46;
                                        }
                                        [(SKEmitterNode *)self particleColorGreenRange];
                                        double v101 = v100;
                                        [(SKEmitterNode *)v5 particleColorGreenRange];
                                        float v102 = v101;
                                        *(float *)&double v103 = v103;
                                        if ((COERCE_UNSIGNED_INT(v102 - *(float *)&v103) & 0x60000000) != 0) {
                                          goto LABEL_46;
                                        }
                                        [(SKEmitterNode *)self particleColorRedRange];
                                        double v105 = v104;
                                        [(SKEmitterNode *)v5 particleColorRedRange];
                                        float v106 = v105;
                                        *(float *)&double v107 = v107;
                                        if ((COERCE_UNSIGNED_INT(v106 - *(float *)&v107) & 0x60000000) != 0) {
                                          goto LABEL_46;
                                        }
                                        [(SKEmitterNode *)self particleColorAlphaSpeed];
                                        double v109 = v108;
                                        [(SKEmitterNode *)v5 particleColorAlphaSpeed];
                                        float v110 = v109;
                                        *(float *)&double v111 = v111;
                                        if ((COERCE_UNSIGNED_INT(v110 - *(float *)&v111) & 0x60000000) != 0) {
                                          goto LABEL_46;
                                        }
                                        [(SKEmitterNode *)self particleColorBlueSpeed];
                                        double v113 = v112;
                                        [(SKEmitterNode *)v5 particleColorBlueSpeed];
                                        float v114 = v113;
                                        *(float *)&double v115 = v115;
                                        if ((COERCE_UNSIGNED_INT(v114 - *(float *)&v115) & 0x60000000) != 0) {
                                          goto LABEL_46;
                                        }
                                        [(SKEmitterNode *)self particleColorGreenSpeed];
                                        double v117 = v116;
                                        [(SKEmitterNode *)v5 particleColorGreenSpeed];
                                        float v118 = v117;
                                        *(float *)&double v119 = v119;
                                        if ((COERCE_UNSIGNED_INT(v118 - *(float *)&v119) & 0x60000000) != 0
                                          || ([(SKEmitterNode *)self particleColorRedSpeed],
                                              double v121 = v120,
                                              [(SKEmitterNode *)v5 particleColorRedSpeed],
                                              float v122 = v121,
                                              *(float *)&double v123 = v123,
                                              (COERCE_UNSIGNED_INT(v122 - *(float *)&v123) & 0x60000000) != 0))
                                        {
LABEL_46:
                                          BOOL v22 = 0;
                                        }
                                        else
                                        {
                                          v157 = [(SKEmitterNode *)self particleColorBlendFactorSequence];
                                          uint64_t v124 = [v157 hash];
                                          v156 = [(SKEmitterNode *)v5 particleColorBlendFactorSequence];
                                          if (v124 != [v156 hash]) {
                                            goto LABEL_61;
                                          }
                                          [(SKEmitterNode *)self particleColorBlendFactor];
                                          double v126 = v125;
                                          [(SKEmitterNode *)v5 particleColorBlendFactor];
                                          float v127 = v126;
                                          *(float *)&double v128 = v128;
                                          if ((COERCE_UNSIGNED_INT(v127 - *(float *)&v128) & 0x60000000) != 0) {
                                            goto LABEL_61;
                                          }
                                          [(SKEmitterNode *)self particleColorBlendFactorRange];
                                          double v130 = v129;
                                          [(SKEmitterNode *)v5 particleColorBlendFactorRange];
                                          float v131 = v130;
                                          *(float *)&double v132 = v132;
                                          if ((COERCE_UNSIGNED_INT(v131 - *(float *)&v132) & 0x60000000) != 0
                                            || ([(SKEmitterNode *)self particleColorBlendFactorSpeed], double v134 = v133, [(SKEmitterNode *)v5 particleColorBlendFactorSpeed], v135 = v134, *(float *)&v136 = v136, (COERCE_UNSIGNED_INT(v135 - *(float *)&v136) & 0x60000000) != 0)|| (v137 = [(SKEmitterNode *)self particleBlendMode], v137 != [(SKEmitterNode *)v5 particleBlendMode]))
                                          {
LABEL_61:
                                            BOOL v22 = 0;
                                          }
                                          else
                                          {
                                            v155 = [(SKEmitterNode *)self particleAlphaSequence];
                                            uint64_t v138 = [v155 hash];
                                            v154 = [(SKEmitterNode *)v5 particleAlphaSequence];
                                            if (v138 != [v154 hash]) {
                                              goto LABEL_59;
                                            }
                                            [(SKEmitterNode *)self particleAlpha];
                                            double v140 = v139;
                                            [(SKEmitterNode *)v5 particleAlpha];
                                            float v141 = v140;
                                            *(float *)&double v142 = v142;
                                            if ((COERCE_UNSIGNED_INT(v141 - *(float *)&v142) & 0x60000000) != 0) {
                                              goto LABEL_59;
                                            }
                                            [(SKEmitterNode *)self particleAlphaRange];
                                            double v144 = v143;
                                            [(SKEmitterNode *)v5 particleAlphaRange];
                                            float v145 = v144;
                                            *(float *)&double v146 = v146;
                                            if ((COERCE_UNSIGNED_INT(v145 - *(float *)&v146) & 0x60000000) != 0
                                              || ([(SKEmitterNode *)self particleAlphaSpeed],
                                                  double v148 = v147,
                                                  [(SKEmitterNode *)v5 particleAlphaSpeed],
                                                  float v149 = v148,
                                                  *(float *)&double v150 = v150,
                                                  (COERCE_UNSIGNED_INT(v149 - *(float *)&v150) & 0x60000000) != 0))
                                            {
LABEL_59:
                                              BOOL v22 = 0;
                                            }
                                            else
                                            {
                                              v153 = [(SKEmitterNode *)self particleSpeedSequence];
                                              uint64_t v151 = [v153 hash];
                                              v152 = [(SKEmitterNode *)v5 particleSpeedSequence];
                                              BOOL v22 = v151 == [v152 hash];
                                            }
                                          }
                                        }
                                      }
                                      else
                                      {
                                        BOOL v22 = 0;
                                      }
                                    }
                                    goto LABEL_10;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      BOOL v22 = 0;
LABEL_10:

LABEL_14:
      goto LABEL_15;
    }
    BOOL v22 = 0;
  }
LABEL_15:

  return v22;
}

- (id)physicsWorld
{
  return 0;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = [(SKNode *)self name];
  v5 = [(SKEmitterNode *)self particleTexture];
  [(SKNode *)self position];
  v6 = NSStringFromCGPoint(v11);
  [(SKNode *)self calculateAccumulatedFrame];
  double v7 = NSStringFromCGRect(v12);
  double v8 = [v3 stringWithFormat:@"<SKEmitterNode> name:'%@' particleTexture:%@ position:%@ accumulatedFrame:%@", v4, v5, v6, v7];

  return v8;
}

- (void)setTargetNode:(SKNode *)targetNode
{
  p_target = &self->_target;
  double v8 = targetNode;
  id v5 = objc_storeWeak((id *)p_target, v8);
  skcEmitterNode = (SKCEmitterNode *)self->_skcEmitterNode;
  id v7 = v5;
  SKCEmitterNode::setTargetNode(skcEmitterNode, v8);
}

- (void)setParticleAlphaSequence:(SKKeyframeSequence *)particleAlphaSequence
{
  id v4 = particleAlphaSequence;
  id v5 = (SKCKeyframeSequence *)*((void *)self->_skcEmitterNode + 80);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x21052EA30]();
    *((void *)self->_skcEmitterNode + 80) = 0;
  }
  if (v4)
  {
    [(SKKeyframeSequence *)v4 count];
    operator new();
  }
  alphaSequence = self->_alphaSequence;
  self->_alphaSequence = 0;
}

- (SKKeyframeSequence)particleAlphaSequence
{
  return self->_alphaSequence;
}

- (void)setParticleColorBlendFactorSequence:(SKKeyframeSequence *)particleColorBlendFactorSequence
{
  id v4 = particleColorBlendFactorSequence;
  id v5 = (SKCKeyframeSequence *)*((void *)self->_skcEmitterNode + 79);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x21052EA30]();
    *((void *)self->_skcEmitterNode + 79) = 0;
  }
  if (v4)
  {
    [(SKKeyframeSequence *)v4 count];
    operator new();
  }
  colorBlendSequence = self->_colorBlendSequence;
  self->_colorBlendSequence = 0;
}

- (SKKeyframeSequence)particleColorBlendFactorSequence
{
  return self->_colorBlendSequence;
}

- (void)setParticleColorSequence:(SKKeyframeSequence *)particleColorSequence
{
  id v4 = particleColorSequence;
  id v5 = (SKCKeyframeSequence *)*((void *)self->_skcEmitterNode + 78);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x21052EA30]();
    *((void *)self->_skcEmitterNode + 78) = 0;
  }
  if (v4)
  {
    [(SKKeyframeSequence *)v4 count];
    operator new();
  }
  colorSequence = self->_colorSequence;
  self->_colorSequence = 0;
}

- (SKKeyframeSequence)particleColorSequence
{
  return self->_colorSequence;
}

- (void)setParticleScaleSequence:(SKKeyframeSequence *)particleScaleSequence
{
  id v4 = particleScaleSequence;
  id v5 = (SKCKeyframeSequence *)*((void *)self->_skcEmitterNode + 82);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x21052EA30]();
    *((void *)self->_skcEmitterNode + 82) = 0;
  }
  if (v4)
  {
    [(SKKeyframeSequence *)v4 count];
    operator new();
  }
  scaleSequence = self->_scaleSequence;
  self->_scaleSequence = 0;
}

- (SKKeyframeSequence)particleScaleSequence
{
  return self->_scaleSequence;
}

- (void)setParticleRotationSequence:(id)a3
{
  id v4 = a3;
  id v5 = (SKCKeyframeSequence *)*((void *)self->_skcEmitterNode + 81);
  if (v5)
  {
    SKCKeyframeSequence::~SKCKeyframeSequence(v5);
    MEMORY[0x21052EA30]();
    *((void *)self->_skcEmitterNode + 81) = 0;
  }
  if (v4)
  {
    [v4 count];
    operator new();
  }
  rotationSequence = self->_rotationSequence;
  self->_rotationSequence = 0;
}

- (unsigned)activeParticleCount
{
  return 0;
}

- (id)particleRotationSequence
{
  return self->_rotationSequence;
}

- (void)setEmissionDistance:(double)a3
{
  float v3 = a3;
  *((float *)self->_skcEmitterNode + 191) = v3;
}

- (double)emissionDistance
{
  return *((float *)self->_skcEmitterNode + 191);
}

- (void)setEmissionDistanceRange:(double)a3
{
  float v3 = a3;
  *((float *)self->_skcEmitterNode + 192) = v3;
}

- (double)emissionDistanceRange
{
  return *((float *)self->_skcEmitterNode + 192);
}

- (void)setWantsNewParticles:(BOOL)a3
{
  skcEmitterNode = self->_skcEmitterNode;
  if (skcEmitterNode[561] != a3)
  {
    skcEmitterNode[561] = a3;
    skcEmitterNode[560] = 1;
  }
}

- (BOOL)wantsNewParticles
{
  return *((unsigned char *)self->_skcEmitterNode + 561);
}

- (void)setDensityBased:(BOOL)a3
{
  skcEmitterNode = (SKCNode *)self->_skcEmitterNode;
  *((unsigned char *)skcEmitterNode + 616) = a3;
  SKCNode::recomputeFlags(skcEmitterNode, 1);
}

- (BOOL)densityBased
{
  return *((unsigned char *)self->_skcEmitterNode + 616);
}

- (void)setUsesPointSprites:(BOOL)a3
{
  *(void *)(*((void *)self->_skcEmitterNode + 74) + 560) = a3;
}

- (BOOL)usesPointSprites
{
  return *(void *)(*((void *)self->_skcEmitterNode + 74) + 560) == 1;
}

- (void)setParticleDensity:(double)a3
{
  *((double *)self->_skcEmitterNode + 76) = a3;
}

- (double)particleDensity
{
  return *((double *)self->_skcEmitterNode + 76);
}

- (SKNode)targetNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (SKNode *)WeakRetained;
}

- (CGFloat)particleZPositionSpeed
{
  return *((float *)self->_skcEmitterNode + 190);
}

- (void)setParticleZPositionSpeed:(CGFloat)particleZPositionSpeed
{
  float v3 = particleZPositionSpeed;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  skcEmitterNode[190] = v3;
  *((unsigned char *)skcEmitterNode + 560) = 1;
}

- (CGSize)particleSize
{
  skcEmitterNode = (double *)self->_skcEmitterNode;
  double v3 = skcEmitterNode[92];
  double v4 = skcEmitterNode[93];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setParticleSize:(CGSize)particleSize
{
  *((CGSize *)self->_skcEmitterNode + 46) = particleSize;
}

- (CGFloat)particleZPosition
{
  return *((float *)self->_skcEmitterNode + 188);
}

- (void)setZPosition:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKEmitterNode;
  [(SKNode *)&v4 setZPosition:a3];
  SKCEmitterNode::computeZPostion((SKCEmitterNode *)self->_skcEmitterNode);
}

- (void)setParticleZPosition:(CGFloat)particleZPosition
{
  float v3 = particleZPosition;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  skcEmitterNode[188] = v3;
  SKCEmitterNode::computeZPostion((SKCEmitterNode *)skcEmitterNode);
}

- (CGFloat)particleZPositionRange
{
  return *((float *)self->_skcEmitterNode + 189);
}

- (void)setParticleZPositionRange:(CGFloat)particleZPositionRange
{
  float v3 = particleZPositionRange;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  skcEmitterNode[189] = v3;
  *((unsigned char *)skcEmitterNode + 560) = 1;
}

- (void)setParticleColor:(UIColor *)particleColor
{
  float v9 = particleColor;
  [(UIColor *)v9 componentRGBA];
  skcEmitterNode = self->_skcEmitterNode;
  skcEmitterNode[196] = v5;
  skcEmitterNode[197] = v6;
  skcEmitterNode[198] = v7;
  skcEmitterNode[199] = v8;
}

- (UIColor)particleColor
{
  skcEmitterNode = self->_skcEmitterNode;
  LODWORD(v2) = skcEmitterNode[196];
  LODWORD(v3) = skcEmitterNode[197];
  LODWORD(v4) = skcEmitterNode[198];
  LODWORD(v5) = skcEmitterNode[199];
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v2, v3, v4, v5);
}

- (void)setParticlePosition:(CGPoint)particlePosition
{
  float x = particlePosition.x;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  float y = particlePosition.y;
  skcEmitterNode[218] = x;
  skcEmitterNode[219] = y;
}

- (CGFloat)particleColorRedRange
{
  return *((float *)self->_skcEmitterNode + 200);
}

- (CGFloat)particleColorGreenRange
{
  return *((float *)self->_skcEmitterNode + 201);
}

- (CGFloat)particleColorBlueRange
{
  return *((float *)self->_skcEmitterNode + 202);
}

- (CGFloat)particleColorAlphaRange
{
  return *((float *)self->_skcEmitterNode + 203);
}

- (CGFloat)particleColorRedSpeed
{
  return *((float *)self->_skcEmitterNode + 204);
}

- (CGFloat)particleColorGreenSpeed
{
  return *((float *)self->_skcEmitterNode + 205);
}

- (CGFloat)particleColorBlueSpeed
{
  return *((float *)self->_skcEmitterNode + 206);
}

- (CGFloat)particleColorAlphaSpeed
{
  return *((float *)self->_skcEmitterNode + 207);
}

- (void)setParticleColorRedRange:(CGFloat)particleColorRedRange
{
  float v3 = particleColorRedRange;
  *((float *)self->_skcEmitterNode + 200) = v3;
}

- (void)setParticleColorGreenRange:(CGFloat)particleColorGreenRange
{
  float v3 = particleColorGreenRange;
  *((float *)self->_skcEmitterNode + 201) = v3;
}

- (void)setParticleColorBlueRange:(CGFloat)particleColorBlueRange
{
  float v3 = particleColorBlueRange;
  *((float *)self->_skcEmitterNode + 202) = v3;
}

- (void)setParticleColorAlphaRange:(CGFloat)particleColorAlphaRange
{
  float v3 = particleColorAlphaRange;
  *((float *)self->_skcEmitterNode + 203) = v3;
}

- (void)setParticleColorRedSpeed:(CGFloat)particleColorRedSpeed
{
  float v3 = particleColorRedSpeed;
  *((float *)self->_skcEmitterNode + 204) = v3;
}

- (void)setParticleColorGreenSpeed:(CGFloat)particleColorGreenSpeed
{
  float v3 = particleColorGreenSpeed;
  *((float *)self->_skcEmitterNode + 205) = v3;
}

- (void)setParticleColorBlueSpeed:(CGFloat)particleColorBlueSpeed
{
  float v3 = particleColorBlueSpeed;
  *((float *)self->_skcEmitterNode + 206) = v3;
}

- (void)setParticleColorAlphaSpeed:(CGFloat)particleColorAlphaSpeed
{
  float v3 = particleColorAlphaSpeed;
  *((float *)self->_skcEmitterNode + 207) = v3;
}

- (CGPoint)particlePosition
{
  skcEmitterNode = (float *)self->_skcEmitterNode;
  double v3 = skcEmitterNode[218];
  double v4 = skcEmitterNode[219];
  result.float y = v4;
  result.float x = v3;
  return result;
}

- (void)setParticlePositionRange:(CGVector)particlePositionRange
{
  dfloat x = particlePositionRange.dx;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  dfloat y = particlePositionRange.dy;
  skcEmitterNode[220] = dx;
  skcEmitterNode[221] = dy;
}

- (CGVector)particlePositionRange
{
  skcEmitterNode = (float *)self->_skcEmitterNode;
  double v3 = skcEmitterNode[220];
  double v4 = skcEmitterNode[221];
  result.dfloat y = v4;
  result.dfloat x = v3;
  return result;
}

- (void)setXAcceleration:(CGFloat)xAcceleration
{
  float v3 = xAcceleration;
  *((float *)self->_skcEmitterNode + 226) = v3;
}

- (CGFloat)xAcceleration
{
  return *((float *)self->_skcEmitterNode + 226);
}

- (void)setYAcceleration:(CGFloat)yAcceleration
{
  float v3 = yAcceleration;
  *((float *)self->_skcEmitterNode + 227) = v3;
}

- (CGFloat)yAcceleration
{
  return *((float *)self->_skcEmitterNode + 227);
}

- (void)setParticleBirthRate:(CGFloat)particleBirthRate
{
  float v4 = particleBirthRate;
  SKCEmitterNode::setBirthRate((SKCEmitterNode *)self->_skcEmitterNode, v4);
  skcEmitterNode = (SKCNode *)self->_skcEmitterNode;

  SKCNode::recomputeFlags(skcEmitterNode, 1);
}

- (CGFloat)particleBirthRate
{
  return *((float *)self->_skcEmitterNode + 228);
}

- (void)setParticleColorBlendFactor:(CGFloat)particleColorBlendFactor
{
  float v3 = particleColorBlendFactor;
  *((float *)self->_skcEmitterNode + 208) = v3;
}

- (CGFloat)particleColorBlendFactor
{
  return *((float *)self->_skcEmitterNode + 208);
}

- (void)setParticleColorBlendFactorRange:(CGFloat)particleColorBlendFactorRange
{
  float v3 = particleColorBlendFactorRange;
  *((float *)self->_skcEmitterNode + 209) = v3;
}

- (CGFloat)particleColorBlendFactorRange
{
  return *((float *)self->_skcEmitterNode + 209);
}

- (void)setParticleColorBlendFactorSpeed:(CGFloat)particleColorBlendFactorSpeed
{
  float v3 = particleColorBlendFactorSpeed;
  *((float *)self->_skcEmitterNode + 210) = v3;
}

- (CGFloat)particleColorBlendFactorSpeed
{
  return *((float *)self->_skcEmitterNode + 210);
}

- (void)setParticleLifetime:(CGFloat)particleLifetime
{
  float v3 = particleLifetime;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  skcEmitterNode[229] = v3;
  *((_DWORD *)skcEmitterNode + 175) = vcvtps_s32_f32((float)((float)(skcEmitterNode[228]* (float)(v3 + (float)(skcEmitterNode[230] * 0.5)))* 1.04)+ 2.0);
}

- (CGFloat)particleLifetime
{
  return *((float *)self->_skcEmitterNode + 229);
}

- (void)setParticleLifetimeRange:(CGFloat)particleLifetimeRange
{
  float v3 = particleLifetimeRange;
  skcEmitterNode = (float *)self->_skcEmitterNode;
  skcEmitterNode[230] = v3;
  *((_DWORD *)skcEmitterNode + 175) = vcvtps_s32_f32((float)((float)(skcEmitterNode[228]* (float)(skcEmitterNode[229] + (float)(v3 * 0.5)))* 1.04)+ 2.0);
}

- (CGFloat)particleLifetimeRange
{
  return *((float *)self->_skcEmitterNode + 230);
}

- (void)setParticleRotation:(CGFloat)particleRotation
{
  float v3 = particleRotation;
  *((float *)self->_skcEmitterNode + 231) = v3;
}

- (CGFloat)particleRotation
{
  return *((float *)self->_skcEmitterNode + 231);
}

- (void)setParticleRotationRange:(CGFloat)particleRotationRange
{
  float v3 = particleRotationRange;
  *((float *)self->_skcEmitterNode + 232) = v3;
}

- (CGFloat)particleRotationRange
{
  return *((float *)self->_skcEmitterNode + 232);
}

- (void)setParticleRotationSpeed:(CGFloat)particleRotationSpeed
{
  float v3 = particleRotationSpeed;
  *((float *)self->_skcEmitterNode + 233) = v3;
}

- (CGFloat)particleRotationSpeed
{
  return *((float *)self->_skcEmitterNode + 233);
}

- (void)setParticleScale:(CGFloat)particleScale
{
  float v3 = particleScale;
  *((float *)self->_skcEmitterNode + 234) = v3;
}

- (CGFloat)particleScale
{
  return *((float *)self->_skcEmitterNode + 234);
}

- (void)setParticleScaleRange:(CGFloat)particleScaleRange
{
  float v3 = particleScaleRange;
  *((float *)self->_skcEmitterNode + 235) = v3;
}

- (CGFloat)particleScaleRange
{
  return *((float *)self->_skcEmitterNode + 235);
}

- (void)setParticleScaleSpeed:(CGFloat)particleScaleSpeed
{
  float v3 = particleScaleSpeed;
  *((float *)self->_skcEmitterNode + 236) = v3;
}

- (CGFloat)particleScaleSpeed
{
  return *((float *)self->_skcEmitterNode + 236);
}

- (void)setParticleAlpha:(CGFloat)particleAlpha
{
  float v3 = particleAlpha;
  *((float *)self->_skcEmitterNode + 237) = v3;
}

- (CGFloat)particleAlpha
{
  return *((float *)self->_skcEmitterNode + 237);
}

- (void)setParticleAlphaRange:(CGFloat)particleAlphaRange
{
  float v3 = particleAlphaRange;
  *((float *)self->_skcEmitterNode + 238) = v3;
}

- (CGFloat)particleAlphaRange
{
  return *((float *)self->_skcEmitterNode + 238);
}

- (void)setParticleAlphaSpeed:(CGFloat)particleAlphaSpeed
{
  float v3 = particleAlphaSpeed;
  *((float *)self->_skcEmitterNode + 239) = v3;
}

- (CGFloat)particleAlphaSpeed
{
  return *((float *)self->_skcEmitterNode + 239);
}

- (void)setParticleSpeed:(CGFloat)particleSpeed
{
  float v3 = particleSpeed;
  *((float *)self->_skcEmitterNode + 222) = v3;
}

- (CGFloat)particleSpeed
{
  return *((float *)self->_skcEmitterNode + 222);
}

- (void)setParticleSpeedRange:(CGFloat)particleSpeedRange
{
  float v3 = particleSpeedRange;
  *((float *)self->_skcEmitterNode + 223) = v3;
}

- (CGFloat)particleSpeedRange
{
  return *((float *)self->_skcEmitterNode + 223);
}

- (void)setEmissionAngle:(CGFloat)emissionAngle
{
  float v3 = emissionAngle;
  *((float *)self->_skcEmitterNode + 224) = v3;
}

- (CGFloat)emissionAngle
{
  return *((float *)self->_skcEmitterNode + 224);
}

- (void)setEmissionAngleRange:(CGFloat)emissionAngleRange
{
  float v3 = emissionAngleRange;
  *((float *)self->_skcEmitterNode + 225) = v3;
}

- (CGFloat)emissionAngleRange
{
  return *((float *)self->_skcEmitterNode + 225);
}

- (void)setParticleTexture:(SKTexture *)particleTexture
{
  int v6 = particleTexture;
  objc_storeStrong((id *)&self->_particleTexture, particleTexture);
  skcEmitterNode = (id *)self->_skcEmitterNode;
  if (skcEmitterNode[120] != v6)
  {
    objc_storeStrong(skcEmitterNode + 120, particleTexture);
    objc_storeStrong((id *)(*((void *)self->_skcEmitterNode + 74) + 568), particleTexture);
  }
}

- (SKTexture)particleTexture
{
  return (SKTexture *)*((id *)self->_skcEmitterNode + 120);
}

- (void)setParticleBlendMode:(SKBlendMode)particleBlendMode
{
  skcEmitterNode = self->_skcEmitterNode;
  if (*((void *)skcEmitterNode + 121) != particleBlendMode) {
    *((void *)skcEmitterNode + 121) = particleBlendMode;
  }
  SKCNode::setBlendMode(*((SKCNode **)skcEmitterNode + 74), particleBlendMode);
}

- (SKBlendMode)particleBlendMode
{
  return *((void *)self->_skcEmitterNode + 121);
}

- (SKAction)particleAction
{
  double v2 = (void *)[*((id *)self->_skcEmitterNode + 72) copy];

  return (SKAction *)v2;
}

- (void)setParticleAction:(SKAction *)particleAction
{
  int v7 = particleAction;
  uint64_t v4 = [(SKAction *)v7 copy];
  skcEmitterNode = self->_skcEmitterNode;
  int v6 = (void *)skcEmitterNode[72];
  skcEmitterNode[72] = v4;

  *((unsigned char *)self->_skcEmitterNode + 560) = 1;
}

- (NSUInteger)numParticlesToEmit
{
  return *((void *)self->_skcEmitterNode + 85);
}

- (void)setNumParticlesToEmit:(NSUInteger)numParticlesToEmit
{
  *((void *)self->_skcEmitterNode + 85) = numParticlesToEmit;
}

- (void)resetSimulation
{
}

- (void)setFieldBitMask:(uint32_t)fieldBitMask
{
  skcEmitterNode = (SKCNode *)self->_skcEmitterNode;
  *((_DWORD *)skcEmitterNode + 244) = fieldBitMask;
  SKCNode::recomputeFlags(skcEmitterNode, 1);
}

- (uint32_t)fieldBitMask
{
  return *((_DWORD *)self->_skcEmitterNode + 244);
}

- (SKEmitterNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKEmitterNode;
  double v2 = [(SKNode *)&v5 init];
  float v3 = v2;
  if (v2)
  {
    [(SKEmitterNode *)v2 commonInit];
    [(SKEmitterNode *)v3 setTargetNode:0];
  }
  return v3;
}

- (SKEmitterNode)initWithMinimumParticleCapacity:(unint64_t)a3
{
  int v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKEmitterNode;
  uint64_t v4 = [(SKNode *)&v8 init];
  objc_super v5 = v4;
  if (v4)
  {
    [(SKEmitterNode *)v4 commonInit];
    [(SKEmitterNode *)v5 setTargetNode:0];
    skcEmitterNode = v5->_skcEmitterNode;
    skcEmitterNode[245] = v3;
    skcEmitterNode[246] = 4 * v3;
  }
  return v5;
}

- (SKEmitterNode)initWithMinimumParticleCapacity:(unint64_t)a3 minimumPositionBufferCapacity:(unint64_t)a4
{
  int v4 = a4;
  int v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKEmitterNode;
  int v6 = [(SKNode *)&v10 init];
  int v7 = v6;
  if (v6)
  {
    [(SKEmitterNode *)v6 commonInit];
    [(SKEmitterNode *)v7 setTargetNode:0];
    skcEmitterNode = v7->_skcEmitterNode;
    skcEmitterNode[245] = v5;
    skcEmitterNode[246] = v4;
  }
  return v7;
}

- (SKEmitterNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)SKEmitterNode;
  int v5 = [(SKNode *)&v76 initWithCoder:v4];
  int v6 = v5;
  if (v5)
  {
    [(SKEmitterNode *)v5 commonInit];
    skcEmitterNode = (float *)v6->_skcEmitterNode;
    [v4 decodeDoubleForKey:@"_startColorMix"];
    *(float *)&double v8 = v8;
    skcEmitterNode[208] = *(float *)&v8;
    [v4 decodeDoubleForKey:@"_startColorBlendVariance"];
    *(float *)&double v9 = v9;
    skcEmitterNode[209] = *(float *)&v9;
    [v4 decodeDoubleForKey:@"_startColorR"];
    double v11 = v10;
    [v4 decodeDoubleForKey:@"_startColorG"];
    double v13 = v12;
    [v4 decodeDoubleForKey:@"_startColorB"];
    double v15 = v14;
    [v4 decodeDoubleForKey:@"_startColorA"];
    float v16 = v11;
    float v17 = v13;
    float v18 = v15;
    skcEmitterNode[196] = v16;
    skcEmitterNode[197] = v17;
    *(float *)&double v19 = v19;
    skcEmitterNode[198] = v18;
    skcEmitterNode[199] = *(float *)&v19;
    [v4 decodeDoubleForKey:@"_startColorVarianceR"];
    double v21 = v20;
    [v4 decodeDoubleForKey:@"_startColorVarianceG"];
    double v23 = v22;
    [v4 decodeDoubleForKey:@"_startColorVarianceB"];
    double v25 = v24;
    [v4 decodeDoubleForKey:@"_startColorVarianceA"];
    float v26 = v21;
    float v27 = v23;
    float v28 = v25;
    *(float *)&double v29 = v29;
    skcEmitterNode[200] = v26;
    skcEmitterNode[201] = v27;
    skcEmitterNode[202] = v28;
    skcEmitterNode[203] = *(float *)&v29;
    double v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_particleTexture"];
    [(SKEmitterNode *)v6 setParticleTexture:v30];

    [v4 decodeCGPointForKey:@"_startPosition"];
    -[SKEmitterNode setParticlePosition:](v6, "setParticlePosition:");
    [v4 decodeCGVectorForKey:@"_startPositionVariance"];
    -[SKEmitterNode setParticlePositionRange:](v6, "setParticlePositionRange:");
    [v4 decodeDoubleForKey:@"_startZPosition"];
    *(float *)&double v31 = v31;
    skcEmitterNode[188] = *(float *)&v31;
    [v4 decodeDoubleForKey:@"_startZPositionVariance"];
    *(float *)&double v32 = v32;
    skcEmitterNode[189] = *(float *)&v32;
    [v4 decodeDoubleForKey:@"_lifetime"];
    *(float *)&double v33 = v33;
    skcEmitterNode[229] = *(float *)&v33;
    [v4 decodeDoubleForKey:@"_lifetimeVariance"];
    *(float *)&double v34 = v34;
    skcEmitterNode[230] = *(float *)&v34;
    [v4 decodeDoubleForKey:@"_startOpacity"];
    *(float *)&double v35 = v35;
    skcEmitterNode[237] = *(float *)&v35;
    [v4 decodeDoubleForKey:@"_startOpacityVariance"];
    *(float *)&double v36 = v36;
    skcEmitterNode[238] = *(float *)&v36;
    -[SKEmitterNode setParticleBlendMode:](v6, "setParticleBlendMode:", (int)[v4 decodeIntForKey:@"_particleBlendMode"]);
    [v4 decodeDoubleForKey:@"_startRotation"];
    *(float *)&double v37 = v37;
    skcEmitterNode[231] = *(float *)&v37;
    [v4 decodeDoubleForKey:@"_startRotationVariance"];
    *(float *)&double v38 = v38;
    skcEmitterNode[232] = *(float *)&v38;
    [v4 decodeCGSizeForKey:@"_startSize"];
    *((void *)skcEmitterNode + 92) = v39;
    *((void *)skcEmitterNode + 93) = v40;
    [v4 decodeDoubleForKey:@"_startScale"];
    *(float *)&double v41 = v41;
    skcEmitterNode[234] = *(float *)&v41;
    [v4 decodeDoubleForKey:@"_startScaleVariance"];
    *(float *)&double v42 = v42;
    skcEmitterNode[235] = *(float *)&v42;
    [v4 decodeCGPointForKey:@"_acceleration"];
    *(float *)&double v43 = v43;
    *(float *)&double v44 = v44;
    skcEmitterNode[226] = *(float *)&v43;
    skcEmitterNode[227] = *(float *)&v44;
    [v4 decodeDoubleForKey:@"_colorSpeedR"];
    double v46 = v45;
    [v4 decodeDoubleForKey:@"_colorSpeedG"];
    double v48 = v47;
    [v4 decodeDoubleForKey:@"_colorSpeedB"];
    double v50 = v49;
    [v4 decodeDoubleForKey:@"_colorSpeedA"];
    float v51 = v46;
    float v52 = v48;
    float v53 = v50;
    skcEmitterNode[204] = v51;
    skcEmitterNode[205] = v52;
    *(float *)&double v54 = v54;
    skcEmitterNode[206] = v53;
    skcEmitterNode[207] = *(float *)&v54;
    [v4 decodeDoubleForKey:@"_colorBlendSpeed"];
    *(float *)&double v55 = v55;
    skcEmitterNode[210] = *(float *)&v55;
    [v4 decodeDoubleForKey:@"_rotationSpeed"];
    *(float *)&double v56 = v56;
    skcEmitterNode[233] = *(float *)&v56;
    [v4 decodeDoubleForKey:@"_scaleSpeed"];
    *(float *)&double v57 = v57;
    skcEmitterNode[236] = *(float *)&v57;
    [v4 decodeDoubleForKey:@"_opacitySpeed"];
    *(float *)&double v58 = v58;
    skcEmitterNode[239] = *(float *)&v58;
    [v4 decodeDoubleForKey:@"_startSpeed"];
    *(float *)&double v59 = v59;
    skcEmitterNode[222] = *(float *)&v59;
    [v4 decodeDoubleForKey:@"_startSpeedVariance"];
    *(float *)&double v60 = v60;
    skcEmitterNode[223] = *(float *)&v60;
    [v4 decodeDoubleForKey:@"_emissionAngle"];
    *(float *)&double v61 = v61;
    skcEmitterNode[224] = *(float *)&v61;
    [v4 decodeDoubleForKey:@"_emissionAngleVariance"];
    *(float *)&double v62 = v62;
    skcEmitterNode[225] = *(float *)&v62;
    [v4 decodeDoubleForKey:@"_zPositionSpeed"];
    *(float *)&double v63 = v63;
    skcEmitterNode[190] = *(float *)&v63;
    float v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_target"];
    [(SKEmitterNode *)v6 setTargetNode:v64];

    [v4 decodeDoubleForKey:@"_birthrate"];
    -[SKEmitterNode setParticleBirthRate:](v6, "setParticleBirthRate:");
    double v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_particleAction"];
    [(SKEmitterNode *)v6 setParticleAction:v65];

    double v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_numParticlesToEmit"];
    -[SKEmitterNode setNumParticlesToEmit:](v6, "setNumParticlesToEmit:", [v66 unsignedIntegerValue]);

    [v4 decodeDoubleForKey:@"_emissionDistance"];
    -[SKEmitterNode setEmissionDistance:](v6, "setEmissionDistance:");
    [v4 decodeDoubleForKey:@"_emissionDistanceRange"];
    -[SKEmitterNode setEmissionDistanceRange:](v6, "setEmissionDistanceRange:");
    -[SKEmitterNode setFieldBitMask:](v6, "setFieldBitMask:", [v4 decodeInt32ForKey:@"_fieldBitMask"]);
    double v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_particleAlphaSequence"];
    [(SKEmitterNode *)v6 setParticleAlphaSequence:v67];

    float v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_particleColorSequence"];
    [(SKEmitterNode *)v6 setParticleColorSequence:v68];

    double v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_particleColorBlendFactorSequence"];
    [(SKEmitterNode *)v6 setParticleColorBlendFactorSequence:v69];

    double v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_particleScaleSequence"];
    [(SKEmitterNode *)v6 setParticleScaleSequence:v70];

    double v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_particleRotationSequence"];
    [(SKEmitterNode *)v6 setParticleRotationSequence:v71];

    float v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fieldInfluenceSequence"];
    [(SKEmitterNode *)v6 setFieldInfluenceSequence:v72];

    double v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_particleSpeedSequence"];
    [(SKEmitterNode *)v6 setParticleSpeedSequence:v73];

    double v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_shader"];
    [(SKEmitterNode *)v6 setShader:v74];

    *((unsigned char *)skcEmitterNode + 560) = 1;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKEmitterNode;
  [(SKNode *)&v17 encodeWithCoder:v4];
  skcEmitterNode = (float *)self->_skcEmitterNode;
  int v6 = [(SKEmitterNode *)self particleAction];
  [v4 encodeObject:v6 forKey:@"_particleAction"];

  [v4 encodeDouble:@"_startColorMix" forKey:skcEmitterNode[208]];
  [v4 encodeDouble:@"_startColorBlendVariance" forKey:skcEmitterNode[209]];
  [v4 encodeDouble:@"_startColorR" forKey:skcEmitterNode[196]];
  [v4 encodeDouble:@"_startColorG" forKey:skcEmitterNode[197]];
  [v4 encodeDouble:@"_startColorB" forKey:skcEmitterNode[198]];
  [v4 encodeDouble:@"_startColorA" forKey:skcEmitterNode[199]];
  [v4 encodeDouble:@"_startColorVarianceR" forKey:skcEmitterNode[200]];
  [v4 encodeDouble:@"_startColorVarianceG" forKey:skcEmitterNode[201]];
  [v4 encodeDouble:@"_startColorVarianceB" forKey:skcEmitterNode[202]];
  [v4 encodeDouble:@"_startColorVarianceA" forKey:skcEmitterNode[203]];
  [v4 encodeDouble:@"_birthrate" forKey:skcEmitterNode[228]];
  [v4 encodeObject:*((void *)skcEmitterNode + 120) forKey:@"_particleTexture"];
  [(SKEmitterNode *)self particlePosition];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_startPosition");
  [(SKEmitterNode *)self particlePositionRange];
  objc_msgSend(v4, "encodeCGVector:forKey:", @"_startPositionVariance");
  [v4 encodeDouble:@"_startZPosition" forKey:skcEmitterNode[188]];
  [v4 encodeDouble:@"_startZPositionVariance" forKey:skcEmitterNode[189]];
  [v4 encodeDouble:@"_lifetime" forKey:skcEmitterNode[229]];
  [v4 encodeDouble:@"_lifetimeVariance" forKey:skcEmitterNode[230]];
  [v4 encodeDouble:@"_startOpacity" forKey:skcEmitterNode[237]];
  [v4 encodeDouble:@"_startOpacityVariance" forKey:skcEmitterNode[238]];
  [v4 encodeInteger:*((void *)skcEmitterNode + 121) forKey:@"_particleBlendMode"];
  [v4 encodeDouble:@"_startRotation" forKey:skcEmitterNode[231]];
  [v4 encodeDouble:@"_startRotationVariance" forKey:skcEmitterNode[232]];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"_startSize", *((double *)skcEmitterNode + 92), *((double *)skcEmitterNode + 93));
  [v4 encodeDouble:@"_startScale" forKey:skcEmitterNode[234]];
  [v4 encodeDouble:@"_startScaleVariance" forKey:skcEmitterNode[235]];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_acceleration", skcEmitterNode[226], skcEmitterNode[227]);
  [v4 encodeDouble:@"_colorSpeedR" forKey:skcEmitterNode[204]];
  [v4 encodeDouble:@"_colorSpeedG" forKey:skcEmitterNode[205]];
  [v4 encodeDouble:@"_colorSpeedB" forKey:skcEmitterNode[206]];
  [v4 encodeDouble:@"_colorSpeedA" forKey:skcEmitterNode[207]];
  [v4 encodeDouble:@"_colorBlendSpeed" forKey:skcEmitterNode[210]];
  [v4 encodeDouble:@"_rotationSpeed" forKey:skcEmitterNode[233]];
  [v4 encodeDouble:@"_scaleSpeed" forKey:skcEmitterNode[236]];
  [v4 encodeDouble:@"_opacitySpeed" forKey:skcEmitterNode[239]];
  [v4 encodeDouble:@"_startSpeed" forKey:skcEmitterNode[222]];
  [v4 encodeDouble:@"_startSpeedVariance" forKey:skcEmitterNode[223]];
  [v4 encodeDouble:@"_emissionAngle" forKey:skcEmitterNode[224]];
  [v4 encodeDouble:@"_emissionAngleVariance" forKey:skcEmitterNode[225]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  [v4 encodeObject:WeakRetained forKey:@"_target"];

  double v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SKEmitterNode numParticlesToEmit](self, "numParticlesToEmit"));
  [v4 encodeObject:v8 forKey:@"_numParticlesToEmit"];

  [v4 encodeDouble:@"_zPositionSpeed" forKey:skcEmitterNode[190]];
  [(SKEmitterNode *)self emissionDistance];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_emissionDistance");
  [(SKEmitterNode *)self emissionDistanceRange];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_emissionDistanceRange");
  objc_msgSend(v4, "encodeInt32:forKey:", -[SKEmitterNode fieldBitMask](self, "fieldBitMask"), @"_fieldBitMask");
  double v9 = [(SKEmitterNode *)self particleAlphaSequence];
  [v4 encodeObject:v9 forKey:@"_particleAlphaSequence"];

  double v10 = [(SKEmitterNode *)self particleColorSequence];
  [v4 encodeObject:v10 forKey:@"_particleColorSequence"];

  double v11 = [(SKEmitterNode *)self particleColorBlendFactorSequence];
  [v4 encodeObject:v11 forKey:@"_particleColorBlendFactorSequence"];

  double v12 = [(SKEmitterNode *)self particleScaleSequence];
  [v4 encodeObject:v12 forKey:@"_particleScaleSequence"];

  double v13 = [(SKEmitterNode *)self particleRotationSequence];
  [v4 encodeObject:v13 forKey:@"_particleRotationSequence"];

  double v14 = [(SKEmitterNode *)self fieldInfluenceSequence];
  [v4 encodeObject:v14 forKey:@"_fieldInfluenceSequence"];

  double v15 = [(SKEmitterNode *)self particleSpeedSequence];
  [v4 encodeObject:v15 forKey:@"_particleSpeedSequence"];

  float v16 = [(SKEmitterNode *)self shader];
  [v4 encodeObject:v16 forKey:@"_shader"];
}

- (void)copyParticlePropertiesToNode:(id)a3
{
  float v27 = a3;
  uint64_t v4 = v27[19];
  int v5 = [(SKEmitterNode *)self particleColor];
  [v27 setParticleColor:v5];

  [(SKEmitterNode *)self particleColorRedRange];
  objc_msgSend(v27, "setParticleColorRedRange:");
  [(SKEmitterNode *)self particleColorGreenRange];
  objc_msgSend(v27, "setParticleColorGreenRange:");
  [(SKEmitterNode *)self particleColorBlueRange];
  objc_msgSend(v27, "setParticleColorBlueRange:");
  [(SKEmitterNode *)self particleColorAlphaRange];
  objc_msgSend(v27, "setParticleColorAlphaRange:");
  [(SKEmitterNode *)self particleColorRedSpeed];
  objc_msgSend(v27, "setParticleColorRedSpeed:");
  [(SKEmitterNode *)self particleColorGreenSpeed];
  objc_msgSend(v27, "setParticleColorGreenSpeed:");
  [(SKEmitterNode *)self particleColorBlueSpeed];
  objc_msgSend(v27, "setParticleColorBlueSpeed:");
  [(SKEmitterNode *)self particleColorAlphaSpeed];
  objc_msgSend(v27, "setParticleColorAlphaSpeed:");
  [(SKEmitterNode *)self particleColorBlendFactor];
  objc_msgSend(v27, "setParticleColorBlendFactor:");
  [(SKEmitterNode *)self particleColorBlendFactorRange];
  objc_msgSend(v27, "setParticleColorBlendFactorRange:");
  [(SKEmitterNode *)self particleColorBlendFactorSpeed];
  objc_msgSend(v27, "setParticleColorBlendFactorSpeed:");
  [(SKEmitterNode *)self particlePosition];
  objc_msgSend(v27, "setParticlePosition:");
  [(SKEmitterNode *)self particlePositionRange];
  objc_msgSend(v27, "setParticlePositionRange:");
  [(SKEmitterNode *)self xAcceleration];
  objc_msgSend(v27, "setXAcceleration:");
  [(SKEmitterNode *)self yAcceleration];
  objc_msgSend(v27, "setYAcceleration:");
  [(SKEmitterNode *)self particleLifetime];
  objc_msgSend(v27, "setParticleLifetime:");
  [(SKEmitterNode *)self particleLifetimeRange];
  objc_msgSend(v27, "setParticleLifetimeRange:");
  [(SKEmitterNode *)self particleRotation];
  objc_msgSend(v27, "setParticleRotation:");
  [(SKEmitterNode *)self particleRotationRange];
  objc_msgSend(v27, "setParticleRotationRange:");
  [(SKEmitterNode *)self particleRotationSpeed];
  objc_msgSend(v27, "setParticleRotationSpeed:");
  [(SKEmitterNode *)self particleScale];
  objc_msgSend(v27, "setParticleScale:");
  [(SKEmitterNode *)self particleScaleRange];
  objc_msgSend(v27, "setParticleScaleRange:");
  [(SKEmitterNode *)self particleScaleSpeed];
  objc_msgSend(v27, "setParticleScaleSpeed:");
  [(SKEmitterNode *)self particleAlpha];
  objc_msgSend(v27, "setParticleAlpha:");
  [(SKEmitterNode *)self particleAlphaRange];
  objc_msgSend(v27, "setParticleAlphaRange:");
  [(SKEmitterNode *)self particleAlphaSpeed];
  objc_msgSend(v27, "setParticleAlphaSpeed:");
  int v6 = [(SKEmitterNode *)self particleTexture];
  [v27 setParticleTexture:v6];

  objc_msgSend(v27, "setParticleBlendMode:", -[SKEmitterNode particleBlendMode](self, "particleBlendMode"));
  [(SKEmitterNode *)self particleSpeed];
  objc_msgSend(v27, "setParticleSpeed:");
  [(SKEmitterNode *)self particleSpeedRange];
  objc_msgSend(v27, "setParticleSpeedRange:");
  [(SKEmitterNode *)self emissionAngle];
  objc_msgSend(v27, "setEmissionAngle:");
  [(SKEmitterNode *)self emissionAngleRange];
  objc_msgSend(v27, "setEmissionAngleRange:");
  int v7 = [(SKEmitterNode *)self targetNode];
  [v27 setTargetNode:v7];

  [(SKEmitterNode *)self particleZPosition];
  objc_msgSend(v27, "setParticleZPosition:");
  skcEmitterNode = self->_skcEmitterNode;
  *(_DWORD *)(v4 + 756) = skcEmitterNode[189];
  *(_DWORD *)(v4 + 760) = skcEmitterNode[190];
  double v9 = [(SKEmitterNode *)self particleAction];
  [v27 setParticleAction:v9];

  objc_msgSend(v27, "setNumParticlesToEmit:", -[SKEmitterNode numParticlesToEmit](self, "numParticlesToEmit"));
  objc_msgSend(v27, "setFieldBitMask:", -[SKEmitterNode fieldBitMask](self, "fieldBitMask"));
  double v10 = [(SKNode *)self _info];
  double v11 = (void *)[v10 mutableCopy];
  objc_msgSend(v27, "set_info:", v11);

  double v12 = [(SKEmitterNode *)self shader];
  [v27 setShader:v12];

  objc_msgSend(v27, "setDensityBased:", -[SKEmitterNode densityBased](self, "densityBased"));
  [(SKEmitterNode *)self particleDensity];
  objc_msgSend(v27, "setParticleDensity:");
  [(SKEmitterNode *)self particleSize];
  objc_msgSend(v27, "setParticleSize:");
  objc_msgSend(v27, "setWantsNewParticles:", -[SKEmitterNode wantsNewParticles](self, "wantsNewParticles"));
  double v13 = [(SKEmitterNode *)self particleAlphaSequence];
  double v14 = (void *)[v13 copy];
  [v27 setParticleAlphaSequence:v14];

  double v15 = [(SKEmitterNode *)self particleScaleSequence];
  float v16 = (void *)[v15 copy];
  [v27 setParticleScaleSequence:v16];

  objc_super v17 = [(SKEmitterNode *)self particleRotationSequence];
  float v18 = (void *)[v17 copy];
  [v27 setParticleRotationSequence:v18];

  double v19 = [(SKEmitterNode *)self particleColorBlendFactorSequence];
  double v20 = (void *)[v19 copy];
  [v27 setParticleColorBlendFactorSequence:v20];

  double v21 = [(SKEmitterNode *)self particleColorSequence];
  double v22 = (void *)[v21 copy];
  [v27 setParticleColorSequence:v22];

  double v23 = [(SKEmitterNode *)self fieldInfluenceSequence];
  double v24 = (void *)[v23 copy];
  [v27 setFieldInfluenceSequence:v24];

  double v25 = [(SKEmitterNode *)self particleSpeedSequence];
  float v26 = (void *)[v25 copy];
  [v27 setParticleSpeedSequence:v26];

  [(SKEmitterNode *)self emissionDistance];
  objc_msgSend(v27, "setEmissionDistance:");
  [(SKEmitterNode *)self emissionDistanceRange];
  objc_msgSend(v27, "setEmissionDistanceRange:");
  [(SKEmitterNode *)self particleBirthRate];
  objc_msgSend(v27, "setParticleBirthRate:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKEmitterNode;
  uint64_t v4 = [(SKNode *)&v8 copyWithZone:a3];
  [(SKEmitterNode *)self copyParticlePropertiesToNode:v4];
  uint64_t v5 = v4[19];
  skcEmitterNode = self->_skcEmitterNode;
  *(_DWORD *)(v5 + 980) = skcEmitterNode[245];
  *(_DWORD *)(v5 + 984) = skcEmitterNode[246];
  objc_msgSend(v4, "setUsesPointSprites:", -[SKEmitterNode usesPointSprites](self, "usesPointSprites"));
  return v4;
}

- (void)advanceSimulationTime:(NSTimeInterval)sec
{
  skcEmitterNode = (float *)self->_skcEmitterNode;
  float v4 = skcEmitterNode[230];
  if ((float)(skcEmitterNode[229] + v4) < sec) {
    sec = (float)(skcEmitterNode[229] + v4);
  }
  if (sec > 0.0)
  {
    float v5 = sec;
    SKCEmitterNode::advanceSimulationTime((SKCEmitterNode *)skcEmitterNode, v5);
  }
}

- (void)setShader:(SKShader *)shader
{
  float v5 = shader;
  objc_storeStrong((id *)(*((void *)self->_skcEmitterNode + 74) + 576), shader);
  SKCNode::setDirty(*((SKCNode **)self->_skcEmitterNode + 74));
  SKCNode::recomputeFlags(*((SKCNode **)self->_skcEmitterNode + 74), 1);
  [(SKShader *)v5 _addTargetNode:self];
}

- (SKShader)shader
{
  return (SKShader *)*(id *)(*((void *)self->_skcEmitterNode + 74) + 576);
}

- (void)dealloc
{
  if (self->_skcEmitterNode)
  {
    int v3 = [(SKEmitterNode *)self targetNode];
    if (v3) {
      SKCEmitterNode::clearTargetNode((SKCEmitterNode *)self->_skcEmitterNode);
    }
    SKCEmitterNode::removeSubEmitterNodes((SKCEmitterNode *)self->_skcEmitterNode);
    skcEmitterNode = (SKCEmitterNode *)self->_skcEmitterNode;
    float v5 = (SKCEmitterNode *)*((void *)skcEmitterNode + 124);
    if (v5) {
      SKCEmitterNode::removeSubEmitterNode(v5, skcEmitterNode);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SKEmitterNode;
  [(SKNode *)&v6 dealloc];
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  v5.receiver = self;
  v5.super_class = (Class)SKEmitterNode;
  int v3 = [(SKNode *)&v5 valueForAttributeNamed:key];

  return (SKAttributeValue *)v3;
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  v4.receiver = self;
  v4.super_class = (Class)SKEmitterNode;
  [(SKNode *)&v4 setValue:value forAttributeNamed:key];
}

+ (id)debugHierarchyPropertyDescriptions
{
  v15[6] = *MEMORY[0x263EF8340];
  double v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  int v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"particleColor");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"color");
  v15[0] = Mutable;
  objc_super v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"particleTexture");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGImage");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v5, @"propertyFormat", @"public.data");
  v15[1] = v5;
  objc_super v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"shader");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v6, @"propertyFormat", @"objectInfo");
  v15[2] = v6;
  int v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v7, @"propertyName", @"targetNode");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v7, @"propertyFormat", @"objectInfo");
  v15[3] = v7;
  objc_super v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v8, @"propertyName", @"particleBlendMode");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"SKBlendMode");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v8, @"propertyFormat", @"uinteger");
  v15[4] = v8;
  double v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v9, @"propertyName", @"visualRepresentation");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"CGImage");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v9, @"propertyFormat", @"public.data");
  uint64_t v14 = 8;
  CFNumberRef v10 = CFNumberCreate(0, kCFNumberCFIndexType, &v14);
  CFDictionaryAddValue(v9, @"visibility", v10);
  CFRelease(v10);
  uint64_t v14 = 1;
  CFNumberRef v11 = CFNumberCreate(0, kCFNumberCFIndexType, &v14);
  CFDictionaryAddValue(v9, @"propertyOptions", v11);
  CFRelease(v11);
  v15[5] = v9;
  double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:6];

  return v12;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  id v9 = a3;
  id v53 = a4;
  if ([v9 isEqualToString:@"particleTexture"])
  {
    Mutable = [v53 particleTexture];

    if (Mutable)
    {
      CFNumberRef v10 = [v53 particleTexture];
      CFNumberRef v11 = (CGImage *)[v10 CGImage];

      if (v11)
      {
        int valuePtr = 1065353216;
        Mutable = (id *)CFDataCreateMutable(0, 0);
        uint64_t v12 = *MEMORY[0x263F01AE0];
        double v13 = CGImageDestinationCreateWithData((CFMutableDataRef)Mutable, (CFStringRef)*MEMORY[0x263F01AE0], 1uLL, 0);
        CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFNumberRef v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberFloatType, &valuePtr);
        keys[0] = *(void **)MEMORY[0x263F0EFE8];
        values[0] = v15;
        CFDictionaryRef v16 = CFDictionaryCreate(v14, (const void **)keys, (const void **)values, 1, 0, 0);
        CGImageDestinationAddImage(v13, v11, v16);
        CGImageDestinationFinalize(v13);
        CFRelease(v16);
        CFRelease(v15);
        CFRelease(v13);
        double v57 = @"propertyFormat";
        uint64_t v58 = v12;
        *a5 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      }
      else
      {
        Mutable = 0;
      }
      CGImageRelease(v11);
    }
    goto LABEL_67;
  }
  if (![v9 isEqualToString:@"particleColor"])
  {
    if ([v9 isEqualToString:@"visualRepresentation"])
    {
      Mutable = [v53 createDebugHierarchyVisualRepresentation];
      double v55 = @"propertyFormat";
      uint64_t v56 = *MEMORY[0x263F01AE0];
      *a5 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      goto LABEL_67;
    }
    id v25 = v53;
    float v26 = (NSString *)v9;
    if ([(NSString *)v26 length])
    {
      NSSelectorFromString(v26);
      if (objc_opt_respondsToSelector())
      {
        float v27 = v26;
        if (v27)
        {
LABEL_20:
          Mutable = [v25 valueForKey:v27];
LABEL_66:

          goto LABEL_67;
        }
      }
      else
      {
        if ([(NSString *)v26 length] < 2)
        {
          uint64_t v39 = [(NSString *)v26 uppercaseString];
        }
        else
        {
          double v36 = [(NSString *)v26 substringToIndex:1];
          double v37 = [v36 uppercaseString];
          double v38 = [(NSString *)v26 substringFromIndex:1];
          uint64_t v39 = [v37 stringByAppendingString:v38];
        }
        uint64_t v40 = [@"is" stringByAppendingString:v39];
        NSSelectorFromString(v40);
        if (objc_opt_respondsToSelector()) {
          float v27 = v40;
        }
        else {
          float v27 = 0;
        }

        if (v27) {
          goto LABEL_20;
        }
      }
    }
    if (Mutable)
    {
      id v41 = v25;
      double v42 = v26;
      if (v41)
      {
        double v43 = [NSString stringWithFormat:@"%@", v41];
      }
      else
      {
        double v43 = &stru_26BEEFD10;
      }
      if (v42) {
        double v44 = v42;
      }
      else {
        double v44 = &stru_26BEEFD10;
      }
      double v45 = v44;
      values[0] = @"propertyName";
      values[1] = @"objectDescription";
      keys[0] = v45;
      keys[1] = v43;
      values[2] = @"errorDescription";
      keys[2] = &stru_26BEEFD10;
      double v46 = [NSDictionary dictionaryWithObjects:keys forKeys:values count:3];
      double v47 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v46];

      id v48 = v47;
      __CFDictionary *Mutable = v48;

      float v27 = 0;
      Mutable = 0;
    }
    else
    {
      float v27 = 0;
    }
    goto LABEL_66;
  }
  id v17 = [v53 particleColor];
  float v18 = (CGColor *)[v17 CGColor];
  if (v18)
  {
    Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
    space = CGColorGetColorSpace(v18);
    CFStringRef value = CGColorSpaceCopyName(space);
    size_t NumberOfComponents = CGColorGetNumberOfComponents(v18);
    uint64_t v20 = NumberOfComponents << 32;
    CFIndex v21 = (int)NumberOfComponents;
    if (NumberOfComponents << 32)
    {
      double v22 = CFStringCreateMutable(0, 0);
      id v50 = v17;
      CFIndex v23 = v21 - 1;
      if ((unint64_t)v21 <= 1) {
        uint64_t v24 = 1;
      }
      else {
        uint64_t v24 = v21;
      }
      do
      {
        CFStringAppend(v22, @"CGf");
        if (v23) {
          CFStringAppend(v22, @", ");
        }
        --v23;
        --v24;
      }
      while (v24);
      id v17 = v50;
    }
    else
    {
      double v22 = &stru_26BEEFD10;
    }
    Components = CGColorGetComponents(v18);
    double v29 = (const void **)malloc_type_malloc(v20 >> 29, 0x6004044C4A2DFuLL);
    double v30 = v29;
    if (v20 >= 1)
    {
      if (v21 <= 1) {
        uint64_t v31 = 1;
      }
      else {
        uint64_t v31 = v21;
      }
      double v32 = (CFNumberRef *)v29;
      do
      {
        *v32++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
        --v31;
      }
      while (v31);
    }
    CFArrayRef v33 = CFArrayCreate(0, v30, v21, MEMORY[0x263EFFF70]);
    if (v20 >= 1)
    {
      if (v21 <= 1) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = v21;
      }
      double v35 = v30;
      do
      {
        CFRelease(*v35++);
        --v34;
      }
      while (v34);
    }
    free(v30);
    CGColorSpaceGetModel(space);
    if (v33) {
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValues", v33);
    }
    if (v22) {
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValuesFormat", v22);
    }
    if (value) {
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"colorSpaceName", value);
    }
    if (v33) {
      CFRelease(v33);
    }
    if (value) {
      CFRelease(value);
    }
    if (v22) {
      CFRelease(v22);
    }
  }
  else
  {
    Mutable = 0;
  }

LABEL_67:

  return Mutable;
}

- (SKParticleRenderOrder)particleRenderOrder
{
  return self->_particleRenderOrder;
}

- (void)setParticleRenderOrder:(SKParticleRenderOrder)particleRenderOrder
{
  self->_particleRenderOrder = particleRenderOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_particleSpeedSequence, 0);
  objc_storeStrong((id *)&self->_fieldInfluenceSequence, 0);
  objc_storeStrong((id *)&self->_rotationSequence, 0);
  objc_storeStrong((id *)&self->_scaleSequence, 0);
  objc_storeStrong((id *)&self->_alphaSequence, 0);
  objc_storeStrong((id *)&self->_colorBlendSequence, 0);
  objc_storeStrong((id *)&self->_colorSequence, 0);
  objc_destroyWeak((id *)&self->_target);

  objc_storeStrong((id *)&self->_particleTexture, 0);
}

@end