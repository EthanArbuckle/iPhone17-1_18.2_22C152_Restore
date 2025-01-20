@interface MUPlaceFooterAtributionViewModel
+ (id)_attributionViewModelForProviderName:(id)a3 attributionURLs:(id)a4;
+ (id)interactableVendorAttributionFormatString;
+ (id)nonInteractableVendorAttributionFormatString;
+ (id)transitAttributionFormatString;
+ (id)viewModelForGeoMapItemAttribution:(id)a3;
+ (id)viewModelForMapItem:(id)a3 transitLine:(id)a4;
+ (id)viewModelForMapItemAttribution:(id)a3;
- (BOOL)isInteractable;
- (MUPlaceFooterAtributionViewModel)initWithFormatString:(id)a3 providerNames:(id)a4 isInteractable:(BOOL)a5;
- (NSArray)providerNames;
- (NSString)formatString;
- (id)attributedText;
- (void)setProviderNames:(id)a3;
@end

@implementation MUPlaceFooterAtributionViewModel

+ (id)nonInteractableVendorAttributionFormatString
{
  return _MULocalizedStringFromThisBundle(@"From [Placecard footer]");
}

+ (id)interactableVendorAttributionFormatString
{
  return _MULocalizedStringFromThisBundle(@"More on [Placecard footer]");
}

+ (id)transitAttributionFormatString
{
  return _MULocalizedStringFromThisBundle(@"Transit information provided by [Placecard transit footer]");
}

+ (id)viewModelForMapItemAttribution:(id)a3
{
  id v4 = a3;
  v5 = [v4 providerName];
  v6 = [v4 attributionURLs];

  v7 = [a1 _attributionViewModelForProviderName:v5 attributionURLs:v6];

  return v7;
}

+ (id)viewModelForGeoMapItemAttribution:(id)a3
{
  id v4 = a3;
  v5 = [v4 providerName];
  v6 = [v4 attributionURLs];

  v7 = [a1 _attributionViewModelForProviderName:v5 attributionURLs:v6];

  return v7;
}

+ (id)_attributionViewModelForProviderName:(id)a3 attributionURLs:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    uint64_t v7 = [v6 count];
    if (v7) {
      +[MUPlaceFooterAtributionViewModel interactableVendorAttributionFormatString];
    }
    else {
    v9 = +[MUPlaceFooterAtributionViewModel nonInteractableVendorAttributionFormatString];
    }
    v10 = [MUPlaceFooterAtributionViewModel alloc];
    v13[0] = v5;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v8 = [(MUPlaceFooterAtributionViewModel *)v10 initWithFormatString:v9 providerNames:v11 isInteractable:v7 != 0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)viewModelForMapItem:(id)a3 transitLine:(id)a4
{
  id v5 = a4;
  id v6 = [a3 _transitAttribution];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 attribution];
  }
  v9 = v8;

  v10 = [v9 _providerNames];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [MUPlaceFooterAtributionViewModel alloc];
    v13 = +[MUPlaceFooterAtributionViewModel transitAttributionFormatString];
    v14 = [v9 _providerNames];
    v15 = [(MUPlaceFooterAtributionViewModel *)v12 initWithFormatString:v13 providerNames:v14 isInteractable:1];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (MUPlaceFooterAtributionViewModel)initWithFormatString:(id)a3 providerNames:(id)a4 isInteractable:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MUPlaceFooterAtributionViewModel;
  uint64_t v11 = [(MUPlaceFooterAtributionViewModel *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_formatString, a3);
    objc_storeStrong((id *)&v12->_providerNames, a4);
    v12->_interactable = a5;
  }

  return v12;
}

- (id)attributedText
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_providerNames count])
  {
    formatString = self->_formatString;
    uint64_t v22 = *MEMORY[0x1E4FB0700];
    uint64_t v4 = v22;
    id v5 = (void *)MEMORY[0x1E4FB1618];
    id v6 = formatString;
    uint64_t v7 = [v5 secondaryLabelColor];
    v24[0] = v7;
    uint64_t v23 = *MEMORY[0x1E4FB06F8];
    uint64_t v8 = v23;
    uint64_t v9 = *MEMORY[0x1E4FB28F0];
    id v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    v24[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v22 count:2];

    v12 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:self->_providerNames];
    v20[0] = v4;
    v13 = +[MUInfoCardStyle tintColor];
    uint64_t v14 = *MEMORY[0x1E4FB0720];
    v21[0] = v13;
    v21[1] = &stru_1EE3BF360;
    v20[1] = v14;
    v20[2] = v8;
    v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v9];
    v21[2] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

    if (self->_interactable) {
      v17 = v16;
    }
    else {
      v17 = v11;
    }
    v18 = MUHighlightedAttributionString(v6, v11, v12, v17);
  }
  else
  {
    v18 = objc_opt_new();
  }
  return v18;
}

- (NSArray)providerNames
{
  return self->_providerNames;
}

- (void)setProviderNames:(id)a3
{
}

- (NSString)formatString
{
  return self->_formatString;
}

- (BOOL)isInteractable
{
  return self->_interactable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_storeStrong((id *)&self->_providerNames, 0);
}

@end