@interface UIHoverStyle(DOCExtensions)
+ (id)_doc_roundedRectWithCornerRadius:()DOCExtensions cornerRadiusIsStretchy:insets:;
+ (id)doc_capsuleWithInsets:()DOCExtensions;
+ (id)doc_circleWithInsets:()DOCExtensions;
+ (uint64_t)doc_capsuleWithInset:()DOCExtensions;
+ (uint64_t)doc_circleWithInset:()DOCExtensions;
+ (uint64_t)doc_roundedRectWithConstantCornerRadius:()DOCExtensions inset:;
+ (uint64_t)doc_roundedRectWithConstantCornerRadius:()DOCExtensions insets:;
+ (uint64_t)doc_roundedRectWithStretchyCornerRadius:()DOCExtensions inset:;
+ (uint64_t)doc_roundedRectWithStretchyCornerRadius:()DOCExtensions insets:;
@end

@implementation UIHoverStyle(DOCExtensions)

+ (uint64_t)doc_roundedRectWithConstantCornerRadius:()DOCExtensions inset:
{
  return objc_msgSend(a1, "_doc_roundedRectWithCornerRadius:cornerRadiusIsStretchy:insets:", 0, a3, a4, a4, a4, a4);
}

+ (uint64_t)doc_roundedRectWithStretchyCornerRadius:()DOCExtensions inset:
{
  return objc_msgSend(a1, "_doc_roundedRectWithCornerRadius:cornerRadiusIsStretchy:insets:", 1, a3, a4, a4, a4, a4);
}

+ (uint64_t)doc_roundedRectWithConstantCornerRadius:()DOCExtensions insets:
{
  return objc_msgSend(a1, "_doc_roundedRectWithCornerRadius:cornerRadiusIsStretchy:insets:", 0);
}

+ (uint64_t)doc_roundedRectWithStretchyCornerRadius:()DOCExtensions insets:
{
  return objc_msgSend(a1, "_doc_roundedRectWithCornerRadius:cornerRadiusIsStretchy:insets:", 1);
}

+ (id)_doc_roundedRectWithCornerRadius:()DOCExtensions cornerRadiusIsStretchy:insets:
{
  if (a8)
  {
    v12 = [MEMORY[0x263F1C978] rectShapeWithCornerRadius:a1];
    -[DOCFixedRadiusRoundedRectShapeProvider shapeByApplyingInsets:](v12, "shapeByApplyingInsets:", a2, a3, a4, a5);
  }
  else
  {
    v12 = -[DOCFixedRadiusRoundedRectShapeProvider initWithCornerRadius:insets:]([DOCFixedRadiusRoundedRectShapeProvider alloc], "initWithCornerRadius:insets:", a1, a2, a3, a4, a5);
    [MEMORY[0x263F1C978] shapeWithProvider:v12];
  v13 = };

  v14 = (void *)MEMORY[0x263F1C6A8];
  v15 = [MEMORY[0x263F1C698] effect];
  v16 = [v14 styleWithEffect:v15 shape:v13];

  return v16;
}

+ (uint64_t)doc_capsuleWithInset:()DOCExtensions
{
  return objc_msgSend(a1, "doc_capsuleWithInsets:", a3, a3, a3, a3);
}

+ (id)doc_capsuleWithInsets:()DOCExtensions
{
  v8 = [MEMORY[0x263F1C978] capsuleShape];
  v9 = objc_msgSend(v8, "shapeByApplyingInsets:", a1, a2, a3, a4);

  v10 = (void *)MEMORY[0x263F1C6A8];
  v11 = [MEMORY[0x263F1C698] effect];
  v12 = [v10 styleWithEffect:v11 shape:v9];

  return v12;
}

+ (uint64_t)doc_circleWithInset:()DOCExtensions
{
  return objc_msgSend(a1, "doc_circleWithInsets:", a3, a3, a3, a3);
}

+ (id)doc_circleWithInsets:()DOCExtensions
{
  v8 = [MEMORY[0x263F1C978] circleShape];
  v9 = objc_msgSend(v8, "shapeByApplyingInsets:", a1, a2, a3, a4);

  v10 = (void *)MEMORY[0x263F1C6A8];
  v11 = [MEMORY[0x263F1C698] effect];
  v12 = [v10 styleWithEffect:v11 shape:v9];

  return v12;
}

@end