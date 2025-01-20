@interface SiriIntentsTemplateModelEnumMapper
+ (id)stringFromComponentLabelStyle:(unint64_t)a3;
+ (id)stringFromImageStyle:(unint64_t)a3;
+ (id)stringFromMapSize:(unint64_t)a3;
+ (id)stringFromTemplateAlignment:(unint64_t)a3;
+ (unint64_t)componentLabelStyleFromString:(id)a3;
+ (unint64_t)imageStyleFromString:(id)a3;
+ (unint64_t)mapSizeFromString:(id)a3;
+ (unint64_t)templateAlignmentFromString:(id)a3;
@end

@implementation SiriIntentsTemplateModelEnumMapper

+ (unint64_t)componentLabelStyleFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAIntentGroupLabelTemplateComponentStyleHeadingValue])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:SAIntentGroupLabelTemplateComponentStyleBodyValue])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:SAIntentGroupLabelTemplateComponentStyleSubheadingValue])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:SAIntentGroupLabelTemplateComponentStyleFootnoteValue])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:SAIntentGroupLabelTemplateComponentStyleCaptionValue])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:SAIntentGroupLabelTemplateComponentStyleLargeValue])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

+ (id)stringFromComponentLabelStyle:(unint64_t)a3
{
  if (a3 <= 5) {
    a1 = *(id *)*(&off_8370 + a3);
  }
  return a1;
}

+ (unint64_t)templateAlignmentFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAIntentGroupAlignmentCenterValue])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:SAIntentGroupAlignmentRightValue])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)stringFromTemplateAlignment:(unint64_t)a3
{
  if (a3 <= 2) {
    a1 = *(id *)*(&off_83A0 + a3);
  }
  return a1;
}

+ (unint64_t)imageStyleFromString:(id)a3
{
  return [a3 isEqualToString:SAIntentGroupImageStyleSmallValue] ^ 1;
}

+ (id)stringFromImageStyle:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    unint64_t v4 = (id *)&SAIntentGroupImageStyleLargeValue;
  }
  else
  {
    unint64_t v4 = (id *)&SAIntentGroupImageStyleSmallValue;
  }
  a1 = *v4;
LABEL_6:
  return a1;
}

+ (unint64_t)mapSizeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAIntentGroupMapSnippetTemplateMapSizeMiniValue]) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = [v3 isEqualToString:SAIntentGroupMapSnippetTemplateMapSizeFullValue];
  }

  return v4;
}

+ (id)stringFromMapSize:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    unint64_t v4 = (id *)&SAIntentGroupMapSnippetTemplateMapSizeFullValue;
  }
  else
  {
    unint64_t v4 = (id *)&SAIntentGroupMapSnippetTemplateMapSizeMiniValue;
  }
  a1 = *v4;
LABEL_6:
  return a1;
}

@end