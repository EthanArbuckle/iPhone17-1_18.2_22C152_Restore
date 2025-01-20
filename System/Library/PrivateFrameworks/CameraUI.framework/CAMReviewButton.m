@interface CAMReviewButton
+ (id)_sharedNumberOfCapturesFormatter;
- (CAMReviewButton)initWithCoder:(id)a3;
- (CAMReviewButton)initWithFrame:(CGRect)a3;
- (id)_localizedTitleForNumberOfCaptures;
- (unint64_t)_numberOfCaptures;
- (void)_commonCAMReviewButtonInitialization;
- (void)_setNumberOfCaptures:(unint64_t)a3;
@end

@implementation CAMReviewButton

- (void)_commonCAMReviewButtonInitialization
{
  v17[2] = *MEMORY[0x263EF8340];
  self->__numberOfCaptures = 0;
  v3 = [(CAMReviewButton *)self _localizedTitleForNumberOfCaptures];
  v4 = [MEMORY[0x263F825C8] whiteColor];
  [(CAMReviewButton *)self setTitleColor:v4 forState:0];
  [(CAMReviewButton *)self setExclusiveTouch:1];
  v5 = [(CAMReviewButton *)self titleLabel];
  v6 = (void *)MEMORY[0x263F81708];
  v7 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
  v8 = [v6 fontWithDescriptor:v7 size:18.0];
  [v5 setFont:v8];

  v9 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v10 = objc_msgSend(v9, "cam_initialLayoutStyle");

  if (v10 == 1)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F81660]);
    v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    [v11 setShadowColor:v12];

    objc_msgSend(v11, "setShadowOffset:", 0.0, 0.0);
    [v11 setShadowBlurRadius:3.0];
    uint64_t v13 = *MEMORY[0x263F81500];
    v16[0] = *MEMORY[0x263F81560];
    v16[1] = v13;
    v17[0] = v11;
    v17[1] = v4;
    v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v3 attributes:v14];
    [(CAMReviewButton *)self setAttributedTitle:v15 forState:0];
  }
  else
  {
    [(CAMReviewButton *)self setTitle:v3 forState:0];
  }
}

- (CAMReviewButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMReviewButton;
  v3 = -[CAMReviewButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMReviewButton *)v3 _commonCAMReviewButtonInitialization];
    v5 = v4;
  }

  return v4;
}

- (CAMReviewButton)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMReviewButton;
  v3 = [(CAMReviewButton *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(CAMReviewButton *)v3 _commonCAMReviewButtonInitialization];
    v5 = v4;
  }

  return v4;
}

+ (id)_sharedNumberOfCapturesFormatter
{
  if (_sharedNumberOfCapturesFormatter_onceToken != -1) {
    dispatch_once(&_sharedNumberOfCapturesFormatter_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)_sharedNumberOfCapturesFormatter_sharedCountFormatter;
  return v2;
}

uint64_t __51__CAMReviewButton__sharedNumberOfCapturesFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)_sharedNumberOfCapturesFormatter_sharedCountFormatter;
  _sharedNumberOfCapturesFormatter_sharedCountFormatter = (uint64_t)v0;

  [(id)_sharedNumberOfCapturesFormatter_sharedCountFormatter setGeneratesDecimalNumbers:1];
  v2 = (void *)_sharedNumberOfCapturesFormatter_sharedCountFormatter;
  return [v2 setNumberStyle:1];
}

- (id)_localizedTitleForNumberOfCaptures
{
  v3 = CAMLocalizedFrameworkString(@"API_CANCEL_TITLE", @"Title for the Cancel button, which dismisses the view controller");
  unint64_t v4 = [(CAMReviewButton *)self _numberOfCaptures];
  if (v4)
  {
    unint64_t v5 = v4;
    v6 = +[CAMReviewButton _sharedNumberOfCapturesFormatter];
    objc_super v7 = [NSNumber numberWithUnsignedInteger:v5];
    v8 = [v6 stringFromNumber:v7];

    v9 = CAMLocalizedFrameworkString(@"API_REVIEW_NUMBER", @"Title for the Review button, which presents the review view controller");
    uint64_t v10 = [NSString stringWithValidatedFormat:v9, @"%@", 0, v8 validFormatSpecifiers error];
    id v11 = CAMLocalizedFrameworkString(@"API_REVIEW_TITLE", @"Title for the Review button, which presents the review view controller");
    v12 = CAMLocalizedFrameworkString(@"API_REVIEW_TITLE_FORMAT", @"Format for the Review button title, which presents the review view controller");
    uint64_t v13 = [NSString stringWithValidatedFormat:v12, @"%@%@", 0, v11, v10 validFormatSpecifiers error];

    v3 = (void *)v13;
  }
  return v3;
}

- (unint64_t)_numberOfCaptures
{
  return self->__numberOfCaptures;
}

- (void)_setNumberOfCaptures:(unint64_t)a3
{
  self->__numberOfCaptures = a3;
}

@end