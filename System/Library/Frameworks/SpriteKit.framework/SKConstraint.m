@interface SKConstraint
+ (BOOL)supportsSecureCoding;
+ (SKConstraint)distance:(SKRange *)range toNode:(SKNode *)node;
+ (SKConstraint)distance:(SKRange *)range toPoint:(CGPoint)point;
+ (SKConstraint)distance:(SKRange *)range toPoint:(CGPoint)point inNode:(SKNode *)node;
+ (SKConstraint)orientToNode:(SKNode *)node offset:(SKRange *)radians;
+ (SKConstraint)orientToPoint:(CGPoint)point inNode:(SKNode *)node offset:(SKRange *)radians;
+ (SKConstraint)orientToPoint:(CGPoint)point offset:(SKRange *)radians;
+ (SKConstraint)positionX:(SKRange *)range;
+ (SKConstraint)positionX:(SKRange *)xRange Y:(SKRange *)yRange;
+ (SKConstraint)positionY:(SKRange *)range;
+ (SKConstraint)zRotation:(SKRange *)zRange;
+ (id)height:(id)a3;
+ (id)scale:(id)a3;
+ (id)scaleX:(id)a3;
+ (id)scaleX:(id)a3 scaleY:(id)a4;
+ (id)scaleY:(id)a3;
+ (id)width:(id)a3;
+ (id)width:(id)a3 height:(id)a4;
- (BOOL)enabled;
- (BOOL)isEqualToConstraint:(id)a3;
- (SKConstraint)init;
- (SKConstraint)initWithCoder:(id)a3;
- (SKNode)referenceNode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setReferenceNode:(SKNode *)referenceNode;
@end

@implementation SKConstraint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKConstraint)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKConstraint;
  v2 = [(SKConstraint *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SKConstraint *)v2 setEnabled:1];
    [(SKConstraint *)v3 setReferenceNode:0];
  }
  return v3;
}

- (SKConstraint)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKConstraint;
  objc_super v5 = [(SKConstraint *)&v8 init];
  if (v5)
  {
    -[SKConstraint setEnabled:](v5, "setEnabled:", [v4 decodeBoolForKey:@"_enabled"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_referenceNode"];
    [(SKConstraint *)v5 setReferenceNode:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[SKConstraint enabled](self, "enabled"), @"_enabled");
  id v4 = [(SKConstraint *)self referenceNode];
  [v5 encodeObject:v4 forKey:@"_referenceNode"];
}

- (BOOL)isEqualToConstraint:(id)a3
{
  id v4 = (SKConstraint *)a3;
  if (v4 == self) {
    goto LABEL_21;
  }
  BOOL v5 = [(SKConstraint *)self enabled];
  if (v5 == [(SKConstraint *)v4 enabled])
  {
    v6 = [(SKConstraint *)self referenceNode];
    if (v6)
    {
    }
    else
    {
      v7 = [(SKConstraint *)v4 referenceNode];

      if (!v7)
      {
LABEL_7:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v11 = [(SKConstraint *)self isEqualToSizeConstraint:v4];
LABEL_20:
          BOOL v12 = v11;
          goto LABEL_22;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v11 = [(SKConstraint *)self isEqualToScaleConstraint:v4];
          goto LABEL_20;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v11 = [(SKConstraint *)self isEqualToPositionConstraint:v4];
          goto LABEL_20;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v11 = [(SKConstraint *)self isEqualToRotationConstraint:v4];
          goto LABEL_20;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v11 = [(SKConstraint *)self isEqualToOrientationConstraint:v4];
          goto LABEL_20;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v11 = [(SKConstraint *)self isEqualToDistanceConstraint:v4];
          goto LABEL_20;
        }
LABEL_21:
        BOOL v12 = 1;
        goto LABEL_22;
      }
    }
    objc_super v8 = [(SKConstraint *)self referenceNode];
    v9 = [(SKConstraint *)v4 referenceNode];
    char v10 = [v8 isEqualToNode:v9];

    if (v10) {
      goto LABEL_7;
    }
  }
  BOOL v12 = 0;
LABEL_22:

  return v12;
}

+ (SKConstraint)positionX:(SKRange *)range
{
  v3 = +[SKPositionConstraint constraintWithXRange:range];

  return (SKConstraint *)v3;
}

+ (SKConstraint)positionY:(SKRange *)range
{
  v3 = +[SKPositionConstraint constraintWithYRange:range];

  return (SKConstraint *)v3;
}

+ (SKConstraint)positionX:(SKRange *)xRange Y:(SKRange *)yRange
{
  id v4 = +[SKPositionConstraint constraintWithXRange:xRange YRange:yRange];

  return (SKConstraint *)v4;
}

+ (SKConstraint)distance:(SKRange *)range toNode:(SKNode *)node
{
  id v4 = +[SKDistanceConstraint constraintWithNode:node distanceRange:range];

  return (SKConstraint *)v4;
}

+ (SKConstraint)distance:(SKRange *)range toPoint:(CGPoint)point
{
  id v4 = +[SKDistanceConstraint constraintWithPoint:distanceRange:](SKDistanceConstraint, "constraintWithPoint:distanceRange:", range, point.x, point.y);

  return (SKConstraint *)v4;
}

+ (SKConstraint)distance:(SKRange *)range toPoint:(CGPoint)point inNode:(SKNode *)node
{
  BOOL v5 = +[SKDistanceConstraint constraintWithPoint:inNode:distanceRange:](SKDistanceConstraint, "constraintWithPoint:inNode:distanceRange:", node, range, point.x, point.y);

  return (SKConstraint *)v5;
}

+ (SKConstraint)zRotation:(SKRange *)zRange
{
  v3 = +[SKRotationConstraint constraintWithZRotationRange:zRange];

  return (SKConstraint *)v3;
}

+ (SKConstraint)orientToPoint:(CGPoint)point inNode:(SKNode *)node offset:(SKRange *)radians
{
  BOOL v5 = +[SKOrientationConstraint constraintOrientingToPoint:inNode:offset:](SKOrientationConstraint, "constraintOrientingToPoint:inNode:offset:", node, radians, point.x, point.y);

  return (SKConstraint *)v5;
}

+ (SKConstraint)orientToNode:(SKNode *)node offset:(SKRange *)radians
{
  id v4 = +[SKOrientationConstraint constraintOrientingToNode:node offset:radians];

  return (SKConstraint *)v4;
}

+ (SKConstraint)orientToPoint:(CGPoint)point offset:(SKRange *)radians
{
  id v4 = +[SKOrientationConstraint constraintOrientingToPoint:offset:](SKOrientationConstraint, "constraintOrientingToPoint:offset:", radians, point.x, point.y);

  return (SKConstraint *)v4;
}

+ (id)width:(id)a3
{
  v3 = +[SKSizeConstraint constraintWithWidthRange:a3];

  return v3;
}

+ (id)height:(id)a3
{
  v3 = +[SKSizeConstraint constraintWithHeightRange:a3];

  return v3;
}

+ (id)width:(id)a3 height:(id)a4
{
  id v4 = +[SKSizeConstraint constraintWithWidthRange:a3 heightRange:a4];

  return v4;
}

+ (id)scale:(id)a3
{
  v3 = +[SKScaleConstraint constraintWithScaleRange:a3];

  return v3;
}

+ (id)scaleX:(id)a3
{
  v3 = +[SKScaleConstraint constraintWithXRange:a3];

  return v3;
}

+ (id)scaleY:(id)a3
{
  v3 = +[SKScaleConstraint constraintWithYRange:a3];

  return v3;
}

+ (id)scaleX:(id)a3 scaleY:(id)a4
{
  id v4 = +[SKScaleConstraint constraintWithXRange:a3 YRange:a4];

  return v4;
}

- (id)description
{
  v2 = NSString;
  BOOL v3 = [(SKConstraint *)self enabled];
  id v4 = @"NO";
  if (v3) {
    id v4 = @"YES";
  }
  return (id)[v2 stringWithFormat:@"<SKConstraint> enabled: %@", v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setEnabled:", -[SKConstraint enabled](self, "enabled"));
  BOOL v5 = [(SKConstraint *)self referenceNode];
  [v4 setReferenceNode:v5];

  return v4;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  self->_enabled = enabled;
}

- (SKNode)referenceNode
{
  return self->_referenceNode;
}

- (void)setReferenceNode:(SKNode *)referenceNode
{
}

- (void).cxx_destruct
{
}

@end