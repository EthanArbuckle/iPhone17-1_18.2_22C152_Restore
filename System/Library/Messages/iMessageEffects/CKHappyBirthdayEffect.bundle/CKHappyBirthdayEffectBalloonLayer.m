@interface CKHappyBirthdayEffectBalloonLayer
- (CALayer)attachmentLayer;
- (CALayer)balloonLayer;
- (CALayer)stringLayer;
- (CKHappyBirthdayEffectBalloonLayer)init;
- (id)assetWithName:(id)a3;
- (void)setAttachmentLayer:(id)a3;
- (void)setBalloonLayer:(id)a3;
- (void)setStringLayer:(id)a3;
- (void)setupAttachmentLayerWithStringColorIndex:(unint64_t)a3;
- (void)setupBaloonLayerWithColorIndex:(unint64_t)a3;
- (void)setupStringLayerWithStringColorIndex:(unint64_t)a3;
@end

@implementation CKHappyBirthdayEffectBalloonLayer

- (CKHappyBirthdayEffectBalloonLayer)init
{
  v10.receiver = self;
  v10.super_class = (Class)CKHappyBirthdayEffectBalloonLayer;
  v2 = [(CKHappyBirthdayEffectBalloonLayer *)&v10 init];
  if (v2)
  {
    uint64_t v3 = arc4random() % 7;
    unint64_t v4 = qword_CAC8++;
    [(CKHappyBirthdayEffectBalloonLayer *)v2 setupBaloonLayerWithColorIndex:v4 % 5];
    [(CKHappyBirthdayEffectBalloonLayer *)v2 setupStringLayerWithStringColorIndex:v3];
    [(CKHappyBirthdayEffectBalloonLayer *)v2 setupAttachmentLayerWithStringColorIndex:v3];
    v5 = [(CKHappyBirthdayEffectBalloonLayer *)v2 balloonLayer];
    [v5 bounds];
    -[CKHappyBirthdayEffectBalloonLayer setBounds:](v2, "setBounds:");

    v6 = [(CKHappyBirthdayEffectBalloonLayer *)v2 balloonLayer];
    [(CKHappyBirthdayEffectBalloonLayer *)v2 addSublayer:v6];

    v7 = [(CKHappyBirthdayEffectBalloonLayer *)v2 stringLayer];
    [(CKHappyBirthdayEffectBalloonLayer *)v2 addSublayer:v7];

    v8 = [(CKHappyBirthdayEffectBalloonLayer *)v2 attachmentLayer];
    [(CKHappyBirthdayEffectBalloonLayer *)v2 addSublayer:v8];
  }
  return v2;
}

- (id)assetWithName:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = +[UIImage imageNamed:v3 inBundle:v4 compatibleWithTraitCollection:0];

  return v5;
}

- (void)setupBaloonLayerWithColorIndex:(unint64_t)a3
{
  unint64_t v4 = (double *)((char *)&unk_6FC0 + 24 * a3);
  id v5 = +[UIColor colorWithRed:dbl_6F48[3 * a3] green:dbl_6F48[3 * a3 + 1] blue:dbl_6F48[3 * a3 + 2] alpha:1.0];
  id v6 = [v5 CGColor];

  id v7 = +[UIColor colorWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
  id v8 = [v7 CGColor];

  id v12 = +[CALayer layer];
  id v9 = [(CKHappyBirthdayEffectBalloonLayer *)self assetWithName:@"balloonBase"];
  objc_msgSend(v12, "setContents:", objc_msgSend(v9, "CGImage"));

  [v12 setContentsMultiplyColor:v6];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, 303.0, 402.0);
  [v12 setAllowsGroupBlending:0];
  objc_super v10 = +[CALayer layer];
  id v11 = [(CKHappyBirthdayEffectBalloonLayer *)self assetWithName:@"balloonHighlights"];
  objc_msgSend(v10, "setContents:", objc_msgSend(v11, "CGImage"));

  [v10 setContentsMultiplyColor:v8];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, 303.0, 402.0);
  [v10 setCompositingFilter:kCAFilterPlusL];
  [v12 addSublayer:v10];
  [(CKHappyBirthdayEffectBalloonLayer *)self setBalloonLayer:v12];
}

- (void)setupStringLayerWithStringColorIndex:(unint64_t)a3
{
  unint64_t v4 = +[NSMutableArray array];
  id v5 = +[NSMutableArray array];
  id v6 = (char *)&unk_7070 + 8 * a3;
  uint64_t v7 = 7;
  id v8 = (char *)&unk_7038 + 8 * a3;
  do
  {
    id v9 = +[NSNumber numberWithDouble:*(double *)&v8[-56 * (a3 / 7)]];
    [v4 addObject:v9];

    id v10 = +[UIColor colorWithWhite:*(double *)&v6[-56 * (a3 / 7)] alpha:1.0];
    objc_msgSend(v5, "addObject:", objc_msgSend(v10, "CGColor"));

    v6 += 8;
    ++a3;
    v8 += 8;
    --v7;
  }
  while (v7);
  id v11 = +[CAEmitterBehavior behaviorWithType:kCAEmitterBehaviorValueOverLife];
  [v11 setValue:@"scale" forKey:@"keyPath"];
  [v11 setValue:v4 forKey:@"values"];
  id v12 = +[CAEmitterBehavior behaviorWithType:kCAEmitterBehaviorColorOverLife];
  [v12 setValue:v5 forKey:@"colors"];
  v13 = +[CAEmitterCell emitterCell];
  LODWORD(v14) = 1130102784;
  [v13 setBirthRate:v14];
  double v15 = drand48() * 0.4 + 0.8;
  *(float *)&double v15 = v15;
  [v13 setLifetime:v15];
  id v16 = +[UIColor colorWithWhite:0.75 alpha:1.0];
  objc_msgSend(v13, "setColor:", objc_msgSend(v16, "CGColor"));

  [v13 setEmissionLongitude:1.57079633];
  [v13 setName:@"string"];
  [v13 setScale:0.2];
  [v13 setVelocity:500.0];
  id v17 = [(CKHappyBirthdayEffectBalloonLayer *)self assetWithName:@"balloonString"];
  objc_msgSend(v13, "setContents:", objc_msgSend(v17, "CGImage"));

  v30[0] = v11;
  v30[1] = v12;
  v18 = +[NSArray arrayWithObjects:v30 count:2];
  [v13 setEmitterBehaviors:v18];

  [v13 setParticleType:kCAEmitterCellPoint];
  v19 = +[CAEmitterLayer layer];
  [v19 setUpdateInterval:0.0166666667];
  [v19 setBeginTime:CACurrentMediaTime() + -60.0];
  objc_msgSend(v19, "setPosition:", 157.0, 384.0);
  v29 = v13;
  v20 = +[NSArray arrayWithObjects:&v29 count:1];
  [v19 setEmitterCells:v20];

  v21 = +[CABasicAnimation animationWithKeyPath:@"emitterCells.string.xAcceleration"];
  [v21 setFrameInterval:0.0166666667];
  v22 = +[NSNumber numberWithDouble:-80.0 - drand48() * 40.0];
  [v21 setFromValue:v22];

  v23 = +[NSNumber numberWithDouble:drand48() * 40.0 + 80.0];
  [v21 setToValue:v23];

  [v21 setAutoreverses:1];
  LODWORD(v24) = 2139095040;
  [v21 setRepeatCount:v24];
  [v21 setDuration:1.1];
  double v25 = drand48();
  [v21 duration];
  [v21 setTimeOffset:v25 * v26];
  v27 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v21 setTimingFunction:v27];

  [v19 addAnimation:v21 forKey:@"wiggle"];
  [(CKHappyBirthdayEffectBalloonLayer *)self setStringLayer:v19];
}

- (void)setupAttachmentLayerWithStringColorIndex:(unint64_t)a3
{
  id v7 = +[CALayer layer];
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, 10.0, 7.0);
  objc_msgSend(v7, "setPosition:", 156.0, 384.0);
  objc_msgSend(v7, "setContentsRect:", 0.25, 0.2, 0.5, 0.6);
  id v5 = [(CKHappyBirthdayEffectBalloonLayer *)self assetWithName:@"balloonString"];
  objc_msgSend(v7, "setContents:", objc_msgSend(v5, "CGImage"));

  id v6 = +[UIColor colorWithWhite:dbl_7070[a3] * 0.6 alpha:1.0];
  objc_msgSend(v7, "setContentsMultiplyColor:", objc_msgSend(v6, "CGColor"));

  [(CKHappyBirthdayEffectBalloonLayer *)self setAttachmentLayer:v7];
}

- (CALayer)balloonLayer
{
  return self->_balloonLayer;
}

- (void)setBalloonLayer:(id)a3
{
}

- (CALayer)attachmentLayer
{
  return self->_attachmentLayer;
}

- (void)setAttachmentLayer:(id)a3
{
}

- (CALayer)stringLayer
{
  return self->_stringLayer;
}

- (void)setStringLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringLayer, 0);
  objc_storeStrong((id *)&self->_attachmentLayer, 0);

  objc_storeStrong((id *)&self->_balloonLayer, 0);
}

@end