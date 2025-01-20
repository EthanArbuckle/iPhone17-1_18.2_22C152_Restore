@interface CKTranscriptMultilineLabelCell
+ (id)createStampLabelView;
+ (id)reuseIdentifier;
@end

@implementation CKTranscriptMultilineLabelCell

+ (id)createStampLabelView
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKTranscriptMultilineLabelCell;
  v2 = objc_msgSendSuper2(&v4, sel_createStampLabelView);
  [v2 setNumberOfLines:0];

  return v2;
}

+ (id)reuseIdentifier
{
  return @"TMS";
}

@end