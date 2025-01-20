@interface LPConcretePresentationPropertiesParameters
- (BOOL)inComposeContext;
- (BOOL)inSenderContext;
- (BOOL)usesComputedPresentationProperties;
- (LPCaptionButtonPresentationProperties)captionButton;
- (LPCaptionButtonPresentationProperties)captionTextButton;
- (LPConcretePresentationPropertiesParameters)initWithUsesComputedPresentationProperties:(BOOL)a3 inComposeContext:(BOOL)a4 inSenderContext:(BOOL)a5 effectiveSizeClass:(unint64_t)a6 overrideSubtitleButtonColor:(id)a7 overrideActionButtonColor:(id)a8 overrideSubtitle:(id)a9 captionButton:(id)a10 captionTextButton:(id)a11;
- (NSAttributedString)overrideSubtitle;
- (UIColor)overrideActionButtonColor;
- (UIColor)overrideSubtitleButtonColor;
- (unint64_t)effectiveSizeClass;
@end

@implementation LPConcretePresentationPropertiesParameters

- (LPConcretePresentationPropertiesParameters)initWithUsesComputedPresentationProperties:(BOOL)a3 inComposeContext:(BOOL)a4 inSenderContext:(BOOL)a5 effectiveSizeClass:(unint64_t)a6 overrideSubtitleButtonColor:(id)a7 overrideActionButtonColor:(id)a8 overrideSubtitle:(id)a9 captionButton:(id)a10 captionTextButton:(id)a11
{
  id v26 = a7;
  id v25 = a8;
  id v24 = a9;
  id v23 = a10;
  id v17 = a11;
  v27.receiver = self;
  v27.super_class = (Class)LPConcretePresentationPropertiesParameters;
  v18 = [(LPConcretePresentationPropertiesParameters *)&v27 init];
  v19 = v18;
  if (v18)
  {
    v18->_usesComputedPresentationProperties = a3;
    v18->_inComposeContext = a4;
    v18->_inSenderContext = a5;
    v18->_effectiveSizeClass = a6;
    objc_storeStrong((id *)&v18->_overrideSubtitleButtonColor, a7);
    objc_storeStrong((id *)&v19->_overrideActionButtonColor, a8);
    objc_storeStrong((id *)&v19->_overrideSubtitle, a9);
    objc_storeStrong((id *)&v19->_captionButton, a10);
    objc_storeStrong((id *)&v19->_captionTextButton, a11);
    v20 = v19;
  }

  return v19;
}

- (BOOL)usesComputedPresentationProperties
{
  return self->_usesComputedPresentationProperties;
}

- (BOOL)inComposeContext
{
  return self->_inComposeContext;
}

- (BOOL)inSenderContext
{
  return self->_inSenderContext;
}

- (unint64_t)effectiveSizeClass
{
  return self->_effectiveSizeClass;
}

- (UIColor)overrideSubtitleButtonColor
{
  return self->_overrideSubtitleButtonColor;
}

- (UIColor)overrideActionButtonColor
{
  return self->_overrideActionButtonColor;
}

- (NSAttributedString)overrideSubtitle
{
  return self->_overrideSubtitle;
}

- (LPCaptionButtonPresentationProperties)captionButton
{
  return self->_captionButton;
}

- (LPCaptionButtonPresentationProperties)captionTextButton
{
  return self->_captionTextButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionTextButton, 0);
  objc_storeStrong((id *)&self->_captionButton, 0);
  objc_storeStrong((id *)&self->_overrideSubtitle, 0);
  objc_storeStrong((id *)&self->_overrideActionButtonColor, 0);

  objc_storeStrong((id *)&self->_overrideSubtitleButtonColor, 0);
}

@end