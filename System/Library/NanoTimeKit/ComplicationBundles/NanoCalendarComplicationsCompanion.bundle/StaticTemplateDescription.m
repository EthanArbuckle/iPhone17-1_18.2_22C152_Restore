@interface StaticTemplateDescription
- (CLKFullColorImageProvider)graphicExtraLargeTop;
- (CLKImageProvider)circularMediumImage;
- (CLKImageProvider)circularSmallImage;
- (CLKImageProvider)extraLargeTop;
- (CLKImageProvider)modularSmallTop;
- (CLKImageProvider)utilityImageProvider;
- (CLKTextProvider)graphicStackTimeText;
- (CLKTextProvider)modularLargeFirst;
- (CLKTextProvider)modularLargeHeader;
- (CLKTextProvider)modularLargeSecond;
- (CLKTextProvider)modularSmallBottom;
- (CLKTextProvider)signatureBezel;
- (CLKTextProvider)signatureCornerTextProvider;
- (CLKTextProvider)utilityLarge;
- (CLKTextProvider)utilitySmall;
- (void)setCircularMediumImage:(id)a3;
- (void)setCircularSmallImage:(id)a3;
- (void)setExtraLargeTop:(id)a3;
- (void)setGraphicExtraLargeTop:(id)a3;
- (void)setGraphicStackTimeText:(id)a3;
- (void)setModularLargeFirst:(id)a3;
- (void)setModularLargeHeader:(id)a3;
- (void)setModularLargeSecond:(id)a3;
- (void)setModularSmallBottom:(id)a3;
- (void)setModularSmallTop:(id)a3;
- (void)setSignatureBezel:(id)a3;
- (void)setSignatureCornerTextProvider:(id)a3;
- (void)setUtilityImageProvider:(id)a3;
- (void)setUtilityLarge:(id)a3;
- (void)setUtilitySmall:(id)a3;
@end

@implementation StaticTemplateDescription

- (CLKImageProvider)modularSmallTop
{
  return self->_modularSmallTop;
}

- (void)setModularSmallTop:(id)a3
{
}

- (CLKTextProvider)modularSmallBottom
{
  return self->_modularSmallBottom;
}

- (void)setModularSmallBottom:(id)a3
{
}

- (CLKTextProvider)utilityLarge
{
  return self->_utilityLarge;
}

- (void)setUtilityLarge:(id)a3
{
}

- (CLKTextProvider)utilitySmall
{
  return self->_utilitySmall;
}

- (void)setUtilitySmall:(id)a3
{
}

- (CLKImageProvider)utilityImageProvider
{
  return self->_utilityImageProvider;
}

- (void)setUtilityImageProvider:(id)a3
{
}

- (CLKTextProvider)modularLargeHeader
{
  return self->_modularLargeHeader;
}

- (void)setModularLargeHeader:(id)a3
{
}

- (CLKTextProvider)modularLargeFirst
{
  return self->_modularLargeFirst;
}

- (void)setModularLargeFirst:(id)a3
{
}

- (CLKTextProvider)modularLargeSecond
{
  return self->_modularLargeSecond;
}

- (void)setModularLargeSecond:(id)a3
{
}

- (CLKImageProvider)circularSmallImage
{
  return self->_circularSmallImage;
}

- (void)setCircularSmallImage:(id)a3
{
}

- (CLKImageProvider)circularMediumImage
{
  return self->_circularMediumImage;
}

- (void)setCircularMediumImage:(id)a3
{
}

- (CLKImageProvider)extraLargeTop
{
  return self->_extraLargeTop;
}

- (void)setExtraLargeTop:(id)a3
{
}

- (CLKTextProvider)graphicStackTimeText
{
  return self->_graphicStackTimeText;
}

- (void)setGraphicStackTimeText:(id)a3
{
}

- (CLKFullColorImageProvider)graphicExtraLargeTop
{
  return self->_graphicExtraLargeTop;
}

- (void)setGraphicExtraLargeTop:(id)a3
{
}

- (CLKTextProvider)signatureBezel
{
  return self->_signatureBezel;
}

- (void)setSignatureBezel:(id)a3
{
}

- (CLKTextProvider)signatureCornerTextProvider
{
  return self->_signatureCornerTextProvider;
}

- (void)setSignatureCornerTextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureCornerTextProvider, 0);
  objc_storeStrong((id *)&self->_signatureBezel, 0);
  objc_storeStrong((id *)&self->_graphicExtraLargeTop, 0);
  objc_storeStrong((id *)&self->_graphicStackTimeText, 0);
  objc_storeStrong((id *)&self->_extraLargeTop, 0);
  objc_storeStrong((id *)&self->_circularMediumImage, 0);
  objc_storeStrong((id *)&self->_circularSmallImage, 0);
  objc_storeStrong((id *)&self->_modularLargeSecond, 0);
  objc_storeStrong((id *)&self->_modularLargeFirst, 0);
  objc_storeStrong((id *)&self->_modularLargeHeader, 0);
  objc_storeStrong((id *)&self->_utilityImageProvider, 0);
  objc_storeStrong((id *)&self->_utilitySmall, 0);
  objc_storeStrong((id *)&self->_utilityLarge, 0);
  objc_storeStrong((id *)&self->_modularSmallBottom, 0);

  objc_storeStrong((id *)&self->_modularSmallTop, 0);
}

@end