@interface GAXUIIncomingCallAlertStyleProvider
+ (id)styleProviderWithIncomingCallType:(int)a3;
- (CGSize)alertBackgroundSizeForType:(unint64_t)a3;
- (UIEdgeInsets)alertContentEdgeInsetsForType:(unint64_t)a3;
- (UIEdgeInsets)alertIconImageEdgeInsetsForType:(unint64_t)a3;
- (double)alertSubtitleTextVerticalSpacingHeightWithTextForType:(unint64_t)a3;
- (id)alertSubtitleTextFontForType:(unint64_t)a3;
- (id)alertTextFontForType:(unint64_t)a3;
- (int)incomingCallType;
- (void)setIncomingCallType:(int)a3;
@end

@implementation GAXUIIncomingCallAlertStyleProvider

+ (id)styleProviderWithIncomingCallType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___GAXUIIncomingCallAlertStyleProvider;
  v4 = objc_msgSendSuper2(&v6, "styleProvider");
  [v4 setIncomingCallType:v3];

  return v4;
}

- (CGSize)alertBackgroundSizeForType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GAXUIIncomingCallAlertStyleProvider;
  [(GAXUIIncomingCallAlertStyleProvider *)&v5 alertBackgroundSizeForType:a3];
  double v4 = 40.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)alertContentEdgeInsetsForType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GAXUIIncomingCallAlertStyleProvider;
  [(GAXUIIncomingCallAlertStyleProvider *)&v8 alertContentEdgeInsetsForType:a3];
  double v7 = v6 + -1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v7;
  return result;
}

- (id)alertTextFontForType:(unint64_t)a3
{
  return +[UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0];
}

- (id)alertSubtitleTextFontForType:(unint64_t)a3
{
  return +[UIFont fontWithName:@"HelveticaNeue" size:12.0];
}

- (double)alertSubtitleTextVerticalSpacingHeightWithTextForType:(unint64_t)a3
{
  return 0.0;
}

- (UIEdgeInsets)alertIconImageEdgeInsetsForType:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GAXUIIncomingCallAlertStyleProvider;
  [(GAXUIIncomingCallAlertStyleProvider *)&v16 alertIconImageEdgeInsetsForType:a3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(GAXUIIncomingCallAlertStyleProvider *)self incomingCallType] == 1) {
    double v12 = v11 + -1.0;
  }
  else {
    double v12 = v11;
  }
  double v13 = v5;
  double v14 = v7;
  double v15 = v9;
  result.right = v12;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (int)incomingCallType
{
  return self->_incomingCallType;
}

- (void)setIncomingCallType:(int)a3
{
  self->_incomingCallType = a3;
}

@end