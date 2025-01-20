@interface AKSpeechBubbleAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
- (AKSpeechBubbleAnnotation)initWithCoder:(id)a3;
- (double)pointyBitBaseWidthAngle;
- (id)displayName;
- (id)keysForValuesToObserveForAdornments;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (void)encodeWithCoder:(id)a3;
- (void)setPointyBitBaseWidthAngle:(double)a3;
@end

@implementation AKSpeechBubbleAnnotation

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"pointyBitPoint"] & 1) == 0
    && ![v4 isEqualToString:@"pointyBitBaseWidthAngle"]
    || (+[AKController akBundle],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 localizedStringForKey:@"Speech Bubble Tail" value:&stru_26EA57918 table:@"AnnotationStrings"], v6 = objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKSpeechBubbleAnnotation;
    v6 = objc_msgSendSuper2(&v8, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
  }

  return v6;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Speech Bubble" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKSpeechBubbleAnnotation;
  v3 = [(AKThoughtBubbleAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75B48];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKSpeechBubbleAnnotation;
  v3 = [(AKThoughtBubbleAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75B60];

  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKSpeechBubbleAnnotation;
  v3 = [(AKThoughtBubbleAnnotation *)&v6 keysForValuesToObserveForAdornments];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75B78];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKSpeechBubbleAnnotation;
  id v4 = a3;
  [(AKThoughtBubbleAnnotation *)&v5 encodeWithCoder:v4];
  [(AKSpeechBubbleAnnotation *)self pointyBitBaseWidthAngle];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointyBitBaseWidthAngle");
}

- (AKSpeechBubbleAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKSpeechBubbleAnnotation;
  objc_super v5 = [(AKThoughtBubbleAnnotation *)&v8 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    [(AKSpeechBubbleAnnotation *)v5 setPointyBitBaseWidthAngle:20.0];
    if ([v4 containsValueForKey:@"pointyBitBaseWidthAngle"])
    {
      [v4 decodeDoubleForKey:@"pointyBitBaseWidthAngle"];
      -[AKSpeechBubbleAnnotation setPointyBitBaseWidthAngle:](v6, "setPointyBitBaseWidthAngle:");
    }
  }

  return v6;
}

- (double)pointyBitBaseWidthAngle
{
  return self->_pointyBitBaseWidthAngle;
}

- (void)setPointyBitBaseWidthAngle:(double)a3
{
  self->_pointyBitBaseWidthAngle = a3;
}

@end