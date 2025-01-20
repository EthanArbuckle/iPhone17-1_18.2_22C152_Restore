@interface LPLinkRendererSizeClassParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)alignButtonWithCaptionTextLeadingEdge;
- (BOOL)alignTextAndMediaHorizontalEdges;
- (BOOL)disableTextWrapping;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsSpaceAffordanceForDeleteButton;
- (BOOL)neverShowIcon;
- (BOOL)neverShowText;
- (BOOL)onlyShowIcon;
- (BOOL)preserveIconAspectRatioAndAlignmentWhenScaling;
- (BOOL)useDominantColorForText;
- (LPLinkRendererSizeClassParameters)initWithCoder:(id)a3;
- (double)mediaFixedAspectRatio;
- (double)minimumIconCornerRadius;
- (double)minimumMediaCornerRadius;
- (id)_cacheKey;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignButtonWithCaptionTextLeadingEdge:(BOOL)a3;
- (void)setAlignTextAndMediaHorizontalEdges:(BOOL)a3;
- (void)setDisableTextWrapping:(BOOL)a3;
- (void)setMediaFixedAspectRatio:(double)a3;
- (void)setMinimumIconCornerRadius:(double)a3;
- (void)setMinimumMediaCornerRadius:(double)a3;
- (void)setNeedsSpaceAffordanceForDeleteButton:(BOOL)a3;
- (void)setNeverShowIcon:(BOOL)a3;
- (void)setNeverShowText:(BOOL)a3;
- (void)setOnlyShowIcon:(BOOL)a3;
- (void)setPreserveIconAspectRatioAndAlignmentWhenScaling:(BOOL)a3;
- (void)setUseDominantColorForText:(BOOL)a3;
@end

@implementation LPLinkRendererSizeClassParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPLinkRendererSizeClassParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LPLinkRendererSizeClassParameters;
  v5 = [(LPLinkRendererSizeClassParameters *)&v11 init];
  if (v5)
  {
    v5->_alignButtonWithCaptionTextLeadingEdge = [v4 decodeBoolForKey:@"alignButtonWithCaptionTextLeadingEdge"];
    v5->_preserveIconAspectRatioAndAlignmentWhenScaling = [v4 decodeBoolForKey:@"preserveIconAspectRatioAndAlignmentWhenScaling"];
    v5->_onlyShowIcon = [v4 decodeBoolForKey:@"onlyShowIcon"];
    v5->_neverShowIcon = [v4 decodeBoolForKey:@"neverShowIcon"];
    v5->_neverShowText = [v4 decodeBoolForKey:@"neverShowText"];
    v5->_disableTextWrapping = [v4 decodeBoolForKey:@"disableTextWrapping"];
    v5->_useDominantColorForText = [v4 decodeBoolForKey:@"useDominantColorForText"];
    [v4 decodeDoubleForKey:@"minimumMediaCornerRadius"];
    v5->_minimumMediaCornerRadius = v6;
    [v4 decodeDoubleForKey:@"minimumIconCornerRadius"];
    v5->_minimumIconCornerRadius = v7;
    v5->_alignTextAndMediaHorizontalEdges = [v4 decodeBoolForKey:@"alignTextAndMediaHorizontalEdges"];
    [v4 decodeDoubleForKey:@"mediaFixedAspectRatio"];
    v5->_mediaFixedAspectRatio = v8;
    v5->_needsSpaceAffordanceForDeleteButton = [v4 decodeBoolForKey:@"needsSpaceAffordanceForDeleteButton"];
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_alignButtonWithCaptionTextLeadingEdge forKey:@"alignButtonWithCaptionTextLeadingEdge"];
  [v4 encodeBool:self->_preserveIconAspectRatioAndAlignmentWhenScaling forKey:@"preserveIconAspectRatioAndAlignmentWhenScaling"];
  [v4 encodeBool:self->_onlyShowIcon forKey:@"onlyShowIcon"];
  [v4 encodeBool:self->_neverShowIcon forKey:@"neverShowIcon"];
  [v4 encodeBool:self->_neverShowText forKey:@"neverShowText"];
  [v4 encodeBool:self->_disableTextWrapping forKey:@"disableTextWrapping"];
  [v4 encodeBool:self->_useDominantColorForText forKey:@"useDominantColorForText"];
  [v4 encodeDouble:@"minimumMediaCornerRadius" forKey:self->_minimumMediaCornerRadius];
  [v4 encodeDouble:@"minimumIconCornerRadius" forKey:self->_minimumIconCornerRadius];
  [v4 encodeBool:self->_alignTextAndMediaHorizontalEdges forKey:@"alignTextAndMediaHorizontalEdges"];
  [v4 encodeDouble:@"mediaFixedAspectRatio" forKey:self->_mediaFixedAspectRatio];
  [v4 encodeBool:self->_needsSpaceAffordanceForDeleteButton forKey:@"needsSpaceAffordanceForDeleteButton"];
}

- (BOOL)alignButtonWithCaptionTextLeadingEdge
{
  return self->_alignButtonWithCaptionTextLeadingEdge;
}

- (void)setAlignButtonWithCaptionTextLeadingEdge:(BOOL)a3
{
  self->_alignButtonWithCaptionTextLeadingEdge = a3;
}

- (BOOL)preserveIconAspectRatioAndAlignmentWhenScaling
{
  return self->_preserveIconAspectRatioAndAlignmentWhenScaling;
}

- (void)setPreserveIconAspectRatioAndAlignmentWhenScaling:(BOOL)a3
{
  self->_preserveIconAspectRatioAndAlignmentWhenScaling = a3;
}

- (BOOL)onlyShowIcon
{
  return self->_onlyShowIcon;
}

- (void)setOnlyShowIcon:(BOOL)a3
{
  self->_onlyShowIcon = a3;
}

- (BOOL)neverShowIcon
{
  return self->_neverShowIcon;
}

- (void)setNeverShowIcon:(BOOL)a3
{
  self->_neverShowIcon = a3;
}

- (BOOL)neverShowText
{
  return self->_neverShowText;
}

- (void)setNeverShowText:(BOOL)a3
{
  self->_neverShowText = a3;
}

- (BOOL)disableTextWrapping
{
  return self->_disableTextWrapping;
}

- (void)setDisableTextWrapping:(BOOL)a3
{
  self->_disableTextWrapping = a3;
}

- (BOOL)useDominantColorForText
{
  return self->_useDominantColorForText;
}

- (void)setUseDominantColorForText:(BOOL)a3
{
  self->_useDominantColorForText = a3;
}

- (double)minimumMediaCornerRadius
{
  return self->_minimumMediaCornerRadius;
}

- (void)setMinimumMediaCornerRadius:(double)a3
{
  self->_minimumMediaCornerRadius = a3;
}

- (double)minimumIconCornerRadius
{
  return self->_minimumIconCornerRadius;
}

- (void)setMinimumIconCornerRadius:(double)a3
{
  self->_minimumIconCornerRadius = a3;
}

- (BOOL)alignTextAndMediaHorizontalEdges
{
  return self->_alignTextAndMediaHorizontalEdges;
}

- (void)setAlignTextAndMediaHorizontalEdges:(BOOL)a3
{
  self->_alignTextAndMediaHorizontalEdges = a3;
}

- (double)mediaFixedAspectRatio
{
  return self->_mediaFixedAspectRatio;
}

- (void)setMediaFixedAspectRatio:(double)a3
{
  self->_mediaFixedAspectRatio = a3;
}

- (BOOL)needsSpaceAffordanceForDeleteButton
{
  return self->_needsSpaceAffordanceForDeleteButton;
}

- (void)setNeedsSpaceAffordanceForDeleteButton:(BOOL)a3
{
  self->_needsSpaceAffordanceForDeleteButton = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPLinkRendererSizeClassParameters;
  if ([(LPLinkRendererSizeClassParameters *)&v8 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = (double *)v4;
      BOOL v5 = *((unsigned __int8 *)v6 + 8) == self->_alignButtonWithCaptionTextLeadingEdge
        && *((unsigned __int8 *)v6 + 9) == self->_preserveIconAspectRatioAndAlignmentWhenScaling
        && *((unsigned __int8 *)v6 + 10) == self->_onlyShowIcon
        && *((unsigned __int8 *)v6 + 11) == self->_neverShowIcon
        && *((unsigned __int8 *)v6 + 12) == self->_neverShowText
        && *((unsigned __int8 *)v6 + 13) == self->_disableTextWrapping
        && *((unsigned __int8 *)v6 + 14) == self->_useDominantColorForText
        && v6[3] == self->_minimumMediaCornerRadius
        && v6[4] == self->_minimumIconCornerRadius
        && *((unsigned __int8 *)v6 + 15) == self->_alignTextAndMediaHorizontalEdges
        && v6[5] == self->_mediaFixedAspectRatio
        && *((unsigned __int8 *)v6 + 16) == self->_needsSpaceAffordanceForDeleteButton;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPLinkRendererSizeClassParameters allocWithZone:a3];
  if (v4)
  {
    [(LPLinkRendererSizeClassParameters *)v4 setAlignButtonWithCaptionTextLeadingEdge:[(LPLinkRendererSizeClassParameters *)self alignButtonWithCaptionTextLeadingEdge]];
    [(LPLinkRendererSizeClassParameters *)v4 setPreserveIconAspectRatioAndAlignmentWhenScaling:[(LPLinkRendererSizeClassParameters *)self preserveIconAspectRatioAndAlignmentWhenScaling]];
    [(LPLinkRendererSizeClassParameters *)v4 setOnlyShowIcon:[(LPLinkRendererSizeClassParameters *)self onlyShowIcon]];
    [(LPLinkRendererSizeClassParameters *)v4 setNeverShowIcon:[(LPLinkRendererSizeClassParameters *)self neverShowIcon]];
    [(LPLinkRendererSizeClassParameters *)v4 setNeverShowText:[(LPLinkRendererSizeClassParameters *)self neverShowText]];
    [(LPLinkRendererSizeClassParameters *)v4 setDisableTextWrapping:[(LPLinkRendererSizeClassParameters *)self disableTextWrapping]];
    [(LPLinkRendererSizeClassParameters *)v4 setUseDominantColorForText:[(LPLinkRendererSizeClassParameters *)self useDominantColorForText]];
    [(LPLinkRendererSizeClassParameters *)self minimumMediaCornerRadius];
    -[LPLinkRendererSizeClassParameters setMinimumMediaCornerRadius:](v4, "setMinimumMediaCornerRadius:");
    [(LPLinkRendererSizeClassParameters *)self minimumIconCornerRadius];
    -[LPLinkRendererSizeClassParameters setMinimumIconCornerRadius:](v4, "setMinimumIconCornerRadius:");
    [(LPLinkRendererSizeClassParameters *)v4 setAlignTextAndMediaHorizontalEdges:[(LPLinkRendererSizeClassParameters *)self alignTextAndMediaHorizontalEdges]];
    [(LPLinkRendererSizeClassParameters *)self mediaFixedAspectRatio];
    -[LPLinkRendererSizeClassParameters setMediaFixedAspectRatio:](v4, "setMediaFixedAspectRatio:");
    [(LPLinkRendererSizeClassParameters *)v4 setNeedsSpaceAffordanceForDeleteButton:[(LPLinkRendererSizeClassParameters *)self needsSpaceAffordanceForDeleteButton]];
    BOOL v5 = v4;
  }

  return v4;
}

- (id)_cacheKey
{
  v3 = NSString;
  BOOL v4 = [(LPLinkRendererSizeClassParameters *)self alignButtonWithCaptionTextLeadingEdge];
  BOOL v5 = [(LPLinkRendererSizeClassParameters *)self preserveIconAspectRatioAndAlignmentWhenScaling];
  BOOL v6 = [(LPLinkRendererSizeClassParameters *)self onlyShowIcon];
  BOOL v7 = [(LPLinkRendererSizeClassParameters *)self disableTextWrapping];
  [(LPLinkRendererSizeClassParameters *)self minimumMediaCornerRadius];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%d%d%d%d%d%d%d", v4, v5, v6, v7, (int)v8, -[LPLinkRendererSizeClassParameters alignTextAndMediaHorizontalEdges](self, "alignTextAndMediaHorizontalEdges"), -[LPLinkRendererSizeClassParameters needsSpaceAffordanceForDeleteButton](self, "needsSpaceAffordanceForDeleteButton"));
}

@end