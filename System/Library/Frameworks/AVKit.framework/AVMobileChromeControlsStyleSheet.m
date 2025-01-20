@interface AVMobileChromeControlsStyleSheet
- (AVMobileChromeControlsStyleSheet)initWithTraitCollection:(id)a3 shouldUseCompactFullScreenSize:(BOOL)a4;
- (CGSize)audioRoutePickerFullScreenSize;
- (CGSize)defaultItemFullScreenSize;
- (CGSize)defaultItemInlineSize;
- (CGSize)minimumScrubberSize;
- (CGSize)routePickerButtonFullScreenSize;
- (CGSize)routePickerButtonInlineSize;
- (CGSize)volumeButtonFullScreenSize;
- (CGSize)volumeButtonInlineSize;
- (NSDirectionalEdgeInsets)doubleRowLayoutMargins;
- (NSDirectionalEdgeInsets)doubleRowLayoutMarginsWhenShowingScrubInstructions;
- (NSDirectionalEdgeInsets)doublerowLayoutMarginsWhenShowingCustomContentInfo;
- (UIEdgeInsets)embeddedInlineInsets;
- (UIEdgeInsets)landscapeFullscreenInsets;
- (UIEdgeInsets)portraitFullscreenInsets;
- (UIFont)infoLabelFont;
- (UIFont)scrubberInfoLabelFont;
- (UIFont)scrubberTimeLabelFont;
- (double)additionalInlinePaddingForDodgingSafeArea;
- (double)liveBroadcastLabelTopToBackdropTopDistance;
- (double)maximumMultiRowTransportControlsWidth;
- (double)maximumProminentPlayButtonDimension;
- (double)maximumTransportControlsWidth;
- (double)minimumProminentPlayButtonDimension;
- (double)minimumSingleButtonTransportControlsWidth;
- (double)minimumTransportControlsWidth;
- (double)spacingBetweenScrubInstructionsAndScrubber;
- (double)standardInteritemPadding;
- (double)standardPaddingFullScreen;
- (double)standardPaddingInline;
- (double)volumeSliderCompactFullScreenWidth;
- (double)volumeSliderInlineWidth;
- (double)volumeSliderPadding;
- (double)volumeSliderRegularFullScreenWidth;
- (void)_loadFontsIfNeeded;
@end

@implementation AVMobileChromeControlsStyleSheet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubberTimeLabelFont, 0);
  objc_storeStrong((id *)&self->_scrubberInfoLabelFont, 0);

  objc_storeStrong((id *)&self->_infoLabelFont, 0);
}

- (double)liveBroadcastLabelTopToBackdropTopDistance
{
  return self->_liveBroadcastLabelTopToBackdropTopDistance;
}

- (double)spacingBetweenScrubInstructionsAndScrubber
{
  return self->_spacingBetweenScrubInstructionsAndScrubber;
}

- (NSDirectionalEdgeInsets)doublerowLayoutMarginsWhenShowingCustomContentInfo
{
  double top = self->_doublerowLayoutMarginsWhenShowingCustomContentInfo.top;
  double leading = self->_doublerowLayoutMarginsWhenShowingCustomContentInfo.leading;
  double bottom = self->_doublerowLayoutMarginsWhenShowingCustomContentInfo.bottom;
  double trailing = self->_doublerowLayoutMarginsWhenShowingCustomContentInfo.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSDirectionalEdgeInsets)doubleRowLayoutMarginsWhenShowingScrubInstructions
{
  double top = self->_doubleRowLayoutMarginsWhenShowingScrubInstructions.top;
  double leading = self->_doubleRowLayoutMarginsWhenShowingScrubInstructions.leading;
  double bottom = self->_doubleRowLayoutMarginsWhenShowingScrubInstructions.bottom;
  double trailing = self->_doubleRowLayoutMarginsWhenShowingScrubInstructions.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSDirectionalEdgeInsets)doubleRowLayoutMargins
{
  double top = self->_doubleRowLayoutMargins.top;
  double leading = self->_doubleRowLayoutMargins.leading;
  double bottom = self->_doubleRowLayoutMargins.bottom;
  double trailing = self->_doubleRowLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (CGSize)minimumScrubberSize
{
  double width = self->_minimumScrubberSize.width;
  double height = self->_minimumScrubberSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)minimumSingleButtonTransportControlsWidth
{
  return self->_minimumSingleButtonTransportControlsWidth;
}

- (double)minimumTransportControlsWidth
{
  return self->_minimumTransportControlsWidth;
}

- (double)maximumMultiRowTransportControlsWidth
{
  return self->_maximumMultiRowTransportControlsWidth;
}

- (double)maximumTransportControlsWidth
{
  return self->_maximumTransportControlsWidth;
}

- (double)maximumProminentPlayButtonDimension
{
  return self->_maximumProminentPlayButtonDimension;
}

- (double)minimumProminentPlayButtonDimension
{
  return self->_minimumProminentPlayButtonDimension;
}

- (CGSize)volumeButtonFullScreenSize
{
  double width = self->_volumeButtonFullScreenSize.width;
  double height = self->_volumeButtonFullScreenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)volumeButtonInlineSize
{
  double width = self->_volumeButtonInlineSize.width;
  double height = self->_volumeButtonInlineSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)volumeSliderPadding
{
  return self->_volumeSliderPadding;
}

- (double)volumeSliderRegularFullScreenWidth
{
  return self->_volumeSliderRegularFullScreenWidth;
}

- (double)volumeSliderCompactFullScreenWidth
{
  return self->_volumeSliderCompactFullScreenWidth;
}

- (double)volumeSliderInlineWidth
{
  return self->_volumeSliderInlineWidth;
}

- (CGSize)audioRoutePickerFullScreenSize
{
  double width = self->_audioRoutePickerFullScreenSize.width;
  double height = self->_audioRoutePickerFullScreenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)routePickerButtonFullScreenSize
{
  double width = self->_routePickerButtonFullScreenSize.width;
  double height = self->_routePickerButtonFullScreenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)routePickerButtonInlineSize
{
  double width = self->_routePickerButtonInlineSize.width;
  double height = self->_routePickerButtonInlineSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)additionalInlinePaddingForDodgingSafeArea
{
  return self->_additionalInlinePaddingForDodgingSafeArea;
}

- (double)standardInteritemPadding
{
  return self->_standardInteritemPadding;
}

- (CGSize)defaultItemFullScreenSize
{
  double width = self->_defaultItemFullScreenSize.width;
  double height = self->_defaultItemFullScreenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)defaultItemInlineSize
{
  double width = self->_defaultItemInlineSize.width;
  double height = self->_defaultItemInlineSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)standardPaddingInline
{
  return self->_standardPaddingInline;
}

- (double)standardPaddingFullScreen
{
  return self->_standardPaddingFullScreen;
}

- (UIEdgeInsets)embeddedInlineInsets
{
  double top = self->_embeddedInlineInsets.top;
  double left = self->_embeddedInlineInsets.left;
  double bottom = self->_embeddedInlineInsets.bottom;
  double right = self->_embeddedInlineInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)portraitFullscreenInsets
{
  double top = self->_fullscreenInsets.top;
  double left = self->_fullscreenInsets.left;
  double bottom = self->_fullscreenInsets.bottom;
  double right = self->_fullscreenInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)landscapeFullscreenInsets
{
  double top = self->_fullscreenInsets.top;
  double left = self->_fullscreenInsets.left;
  double bottom = self->_fullscreenInsets.bottom;
  double right = self->_fullscreenInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIFont)infoLabelFont
{
  -[AVMobileChromeControlsStyleSheet _loadFontsIfNeeded](self);
  infoLabelFont = self->_infoLabelFont;

  return infoLabelFont;
}

- (void)_loadFontsIfNeeded
{
  v32[1] = *MEMORY[0x1E4F143B8];
  if (a1 && !a1[19])
  {
    v2 = [a1 traitCollection];
    uint64_t v3 = [v2 userInterfaceIdiom];

    v4 = (id *)MEMORY[0x1E4FB28D0];
    if (v3 != 5) {
      v4 = (id *)MEMORY[0x1E4FB28E0];
    }
    v5 = (void *)MEMORY[0x1E4FB08E0];
    id v6 = *v4;
    v7 = [a1 traitCollection];
    v8 = [v5 preferredFontForTextStyle:v6 compatibleWithTraitCollection:v7];
    [v8 pointSize];
    double v10 = v9;

    v11 = [MEMORY[0x1E4FB08E0] monospacedDigitSystemFontOfSize:v10 weight:*MEMORY[0x1E4FB09D8]];
    uint64_t v12 = *MEMORY[0x1E4FB0960];
    v30[0] = *MEMORY[0x1E4FB0968];
    v30[1] = v12;
    v31[0] = &unk_1F0949F50;
    v31[1] = &unk_1F0949F68;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    v32[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];

    v15 = [v11 fontDescriptor];
    v16 = objc_msgSend(NSNumber, "numberWithDouble:", v10, *MEMORY[0x1E4FB0910], *MEMORY[0x1E4FB0920], v14);
    v29[1] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:2];
    v18 = [v15 fontDescriptorByAddingAttributes:v17];

    v19 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v20 = *MEMORY[0x1E4FB28F0];
    v21 = [a1 traitCollection];
    uint64_t v22 = [v19 preferredFontForTextStyle:v20 compatibleWithTraitCollection:v21];
    v23 = (void *)a1[18];
    a1[18] = v22;

    uint64_t v24 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v10];
    v25 = (void *)a1[19];
    a1[19] = v24;

    uint64_t v26 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v18 size:v10];
    v27 = (void *)a1[20];
    a1[20] = v26;
  }
}

- (UIFont)scrubberTimeLabelFont
{
  -[AVMobileChromeControlsStyleSheet _loadFontsIfNeeded](self);
  scrubberTimeLabelFont = self->_scrubberTimeLabelFont;

  return scrubberTimeLabelFont;
}

- (UIFont)scrubberInfoLabelFont
{
  -[AVMobileChromeControlsStyleSheet _loadFontsIfNeeded](self);
  scrubberInfoLabelFont = self->_scrubberInfoLabelFont;

  return scrubberInfoLabelFont;
}

- (AVMobileChromeControlsStyleSheet)initWithTraitCollection:(id)a3 shouldUseCompactFullScreenSize:(BOOL)a4
{
  unsigned int v4 = a4;
  v33.receiver = self;
  v33.super_class = (Class)AVMobileChromeControlsStyleSheet;
  v5 = [(AVMobileControlsStyleSheet *)&v33 initWithTraitCollection:a3];
  id v6 = v5;
  if (v5)
  {
    v7 = [(AVMobileControlsStyleSheet *)v5 traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];

    double v9 = [(AVMobileControlsStyleSheet *)v6 traitCollection];
    uint64_t v10 = [v9 userInterfaceIdiom];

    v11 = [(AVMobileControlsStyleSheet *)v6 traitCollection];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v8 == 5) {
      double v14 = 0.77;
    }
    else {
      double v14 = 1.0;
    }
    long long v15 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v6->_fullscreenInsets.double top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v6->_fullscreenInsets.double bottom = v15;
    if (!v12 || v10 == 1)
    {
      double v16 = 24.0;
      double v17 = 27.0;
      if (v12) {
        double v17 = 32.0;
      }
      else {
        double v16 = 27.0;
      }
      v6->_fullscreenInsets.double top = v17;
      v6->_fullscreenInsets.double left = v16;
      v6->_fullscreenInsets.double bottom = v17;
      v6->_fullscreenInsets.double right = v16;
    }
    double v18 = 6.0;
    v6->_shouldUseCompactFullScreenSize = v4;
    float64x2_t v32 = vmulq_n_f64((float64x2_t)xmmword_1B0721260, v14);
    v6->_defaultItemInlineSize = (CGSize)v32;
    int32x2_t v19 = vdup_n_s32(v4);
    v20.i64[0] = v19.u32[0];
    v20.i64[1] = v19.u32[1];
    v6->_defaultItemFullScreenSize = (CGSize)vmulq_n_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v20, 0x3FuLL)), (int8x16_t)xmmword_1B0721280, (int8x16_t)xmmword_1B0721270), v14);
    if (v8 == 5) {
      double v18 = 20.0;
    }
    if (v10 == 1) {
      double v18 = 8.0;
    }
    v6->_standardPaddingFullScreen = v18;
    if (v8 == 5) {
      double v18 = 8.0;
    }
    v6->_double standardPaddingInline = v18;
    v6->_standardInteritemPadding = v14 * 11.0;
    v6->_additionalInlinePaddingForDodgingSafeArea = v14 * 20.0;
    double standardPaddingInline = v6->_standardPaddingInline;
    v6->_embeddedInlineInsets.double top = standardPaddingInline;
    v6->_embeddedInlineInsets.double left = standardPaddingInline;
    v6->_embeddedInlineInsets.double bottom = standardPaddingInline;
    v6->_embeddedInlineInsets.double right = standardPaddingInline;
    v6->_routePickerButtonInlineSize.double width = v14 * 18.0;
    v6->_routePickerButtonInlineSize.double height = v14 * 18.0;
    v6->_routePickerButtonFullScreenSize.double width = v14 * 19.0;
    v6->_routePickerButtonFullScreenSize.double height = v14 * 19.0;
    v6->_audioRoutePickerFullScreenSize.double width = v14 * 20.0;
    v6->_audioRoutePickerFullScreenSize.double height = v14 * 20.0;
    v6->_volumeSliderInlinedouble Width = v14 * 88.0;
    double v22 = v14 * 100.0;
    v6->_volumeSliderCompactFullScreendouble Width = v14 * 100.0;
    v6->_volumeSliderRegularFullScreendouble Width = v14 * 128.0;
    v6->_volumeSliderPadding = v14 * 14.0;
    v6->_volumeButtonInlineSize.double width = v14 * 18.0;
    v6->_volumeButtonInlineSize.double height = v14 * 18.0;
    v6->_volumeButtonFullScreenSize.double width = v14 * 19.0;
    v6->_volumeButtonFullScreenSize.double height = v14 * 19.0;
    v6->_minimumProminentPlayButtonDimension = 31.0;
    v6->_maximumProminentPlayButtonDimension = 60.0;
    v23 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", *(void *)&v14, v13);
    [v23 bounds];
    double Width = CGRectGetWidth(v34);
    [v23 bounds];
    double Height = CGRectGetHeight(v35);
    if (Width >= Height) {
      double v26 = Height;
    }
    else {
      double v26 = Width;
    }
    [v23 bounds];
    double v27 = CGRectGetWidth(v36);
    [v23 bounds];
    double v28 = CGRectGetHeight(v37);
    if (v27 >= v28) {
      double v28 = v27;
    }
    if (v8 == 5 || v10 == 1) {
      double v28 = v26;
    }
    v6->_maximumTransportControlsdouble Width = v31 * v28;
    v6->_maximumMultiRowTransportControlsdouble Width = 402.0;
    v6->_minimumTransportControlsdouble Width = v31 * 210.0;
    v6->_minimumSingleButtonTransportControlsdouble Width = v32.f64[0];
    v6->_minimumScrubberSize.double width = v22;
    v6->_minimumScrubberSize.double height = v31 * 9.0;
    *(_OWORD *)&v6->_doubleRowLayoutMargins.double top = xmmword_1B0721290;
    *(_OWORD *)&v6->_doubleRowLayoutMargins.double bottom = xmmword_1B07212A0;
    *(_OWORD *)&v6->_doubleRowLayoutMarginsWhenShowingScrubInstructions.double top = xmmword_1B07212B0;
    *(_OWORD *)&v6->_doubleRowLayoutMarginsWhenShowingScrubInstructions.double bottom = xmmword_1B07212A0;
    *(_OWORD *)&v6->_doublerowLayoutMarginsWhenShowingCustomContentInfo.double top = xmmword_1B07212C0;
    *(_OWORD *)&v6->_doublerowLayoutMarginsWhenShowingCustomContentInfo.double bottom = xmmword_1B07212A0;
    v6->_spacingBetweenScrubInstructionsAndScrubber = 10.0;
    v6->_liveBroadcastLabelTopToBackdropTopDistance = v31 * 15.0;
  }
  return v6;
}

@end