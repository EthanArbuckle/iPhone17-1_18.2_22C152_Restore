@interface AMSPaymentSheetRequest
+ (BOOL)supportsSecureCoding;
+ (id)attributedStringByRemovingPlaceholderTagsFromAttributedString:(id)a3;
+ (id)paymentSheetRequestFromDictionary:(id)a3 account:(id)a4;
- (ACAccount)account;
- (AMSBiometricsSignatureRequest)biometricsRequest;
- (AMSCardSingleSelection)selectedCard;
- (AMSPaymentSheetPerformanceMetrics)performanceMetrics;
- (AMSPaymentSheetRequest)init;
- (AMSPaymentSheetRequest)initWithCoder:(id)a3;
- (BOOL)_shouldDrawGrayBorderForMaskedImageWithDesignVersion:(id)a3;
- (BOOL)disablePasscodeFallback;
- (BOOL)drawBackground;
- (BOOL)drawBottomDivider;
- (BOOL)isApplePayClassic;
- (BOOL)isDelegateAuthentication;
- (BOOL)isDesignVersionEqual:(id)a3;
- (BOOL)isDesignVersionEqualOrGreaterThan:(id)a3;
- (BOOL)isDesignVersionLessThan:(id)a3;
- (BOOL)requiresAuthorization;
- (BOOL)requiresDelegateAuthentication;
- (BOOL)shouldUppercaseText;
- (CGImage)_createDefaultImageWithImageRef:(CGImage *)a3 size:(CGSize)a4 borderPath:(CGPath *)a5;
- (CGImage)_createImageForAssetConfiguration:(id)a3 outAssetScale:(float *)a4;
- (CGImage)_createImageMaskRefWithSize:(CGSize)a3 andPath:(CGPath *)a4;
- (CGImage)_createImageRefForAssetURL:(id)a3 size:(CGSize)a4 assetType:(int64_t)a5 outAssetScale:(float *)a6;
- (CGImage)_createImageRefForImageRef:(CGImage *)a3 withAdornmentStyle:(int64_t)a4 andDesignVersion:(id)a5;
- (CGImage)_createImageRefForImageSource:(CGImageSource *)a3 screenScale:(float)a4 outAssetScale:(float *)a5;
- (CGImage)_createImageRefForImageURL:(id)a3 outAssetScale:(float *)a4;
- (CGImage)_createImageRefForPDFURL:(id)a3 size:(CGSize)a4 outAssetScale:(float *)a5;
- (CGImage)_createImageRefWithURL:(id)a3 designVersion:(id)a4 adornmentStyle:(int64_t)a5 bag:(id)a6;
- (CGImage)_createMaskedImageRefForImageRef:(CGImage *)a3 withPathRef:(CGPath *)a4 adornmentStyle:(int64_t)a5 andDesignVersion:(id)a6;
- (CGImage)_createRGBImageRefForGreyScaleImageRef:(CGImage *)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (CGImage)_createRatingImageWithStringValue:(id)a3 assetScale:(float *)a4;
- (CGPath)_createBorderPathForAdornmentStyle:(int64_t)a3 iconWidth:(double)a4 iconHeight:(double)a5;
- (CGRect)_rectWithAspectRatio:(CGSize)a3 insideRect:(CGRect)a4;
- (NSArray)attributedList;
- (NSArray)flexList;
- (NSArray)inlineImages;
- (NSArray)preSheetDialog;
- (NSArray)priceSectionItems;
- (NSArray)salableInfo;
- (NSArray)secondaryFlexList;
- (NSArray)secondarySalableInfo;
- (NSArray)styles;
- (NSAttributedString)salableInfoLabel;
- (NSAttributedString)secondarySalableInfoLabel;
- (NSDictionary)merchantSession;
- (NSDictionary)responseDictionary;
- (NSNumber)designVersion;
- (NSNumber)price;
- (NSString)accountHeader;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)delegateAuthenticateChallenge;
- (NSString)displayPrice;
- (NSString)explanation;
- (NSString)logKey;
- (NSString)message;
- (NSString)paymentSession;
- (NSString)paymentSummary;
- (NSString)ratingHeader;
- (NSString)ratingValue;
- (NSString)storeName;
- (NSString)title;
- (NSString)userAgent;
- (NSURL)salableIconURL;
- (NSURL)secondarySalableIconURL;
- (id)_amsContentItemsForFlexibleList:(id)a3 assetCache:(id)a4 designVersion:(id)a5 bag:(id)a6;
- (id)_attachInlineImagesToAttributedString:(id)a3 designVersion:(id)a4 bag:(id)a5;
- (id)_attachLeadingItem:(id)a3 attributedString:(id)a4 designVersion:(id)a5;
- (id)_contentItemsForFlexibleList:(id)a3 assetCache:(id)a4 designVersion:(id)a5 bag:(id)a6;
- (id)_replaceImagePlaceholderTag:(id)a3 withAttributes:(id)a4 foregroundColor:(int64_t)a5 forAttributedString:(id)a6;
- (id)_replaceImagePlaceholderTag:(id)a3 withImageData:(id)a4 scale:(float)a5 tint:(BOOL)a6 forAttributedString:(id)a7;
- (id)_summaryItemsForAttributedList:(id)a3 assetCache:(id)a4 bag:(id)a5;
- (id)ams_amsContentItemForSalableInfoLabel:(id)a3 salableIconURL:(id)a4 salableIcon:(int64_t)a5 assetCache:(id)a6 designVersion:(id)a7 bag:(id)a8;
- (id)ams_contentItemForSalableInfoLabel:(id)a3 salableIconURL:(id)a4 salableIcon:(int64_t)a5 assetCache:(id)a6 designVersion:(id)a7 bag:(id)a8;
- (id)ams_createAMSContentItem:(id)a3 label:(id)a4 image:(CGImage *)a5 accessibilityIdentifier:(id)a6 padding:(id)a7;
- (id)ams_createAMSContentItemForRating;
- (id)ams_createAMSContentItemForSalableInfoWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5;
- (id)ams_createAMSContentItemsForFlexibleListWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5;
- (id)ams_createAMSContentItemsForPreScreenDialogWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5;
- (id)ams_createContentItemForAccount;
- (id)ams_createContentItemForDeviceName:(id)a3;
- (id)ams_createContentItemForRating;
- (id)ams_createContentItemForSalableInfoWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5;
- (id)ams_createContentItemsForFlexibleListWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5;
- (id)ams_createContentItemsForPreScreenDialogWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5;
- (id)ams_createSecondaryContentItemForSalableInfoWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5;
- (id)ams_createSecondaryContentItemsForFlexibleListWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5;
- (id)ams_createSummaryItems;
- (id)ams_createSummaryItemsForAttributedListWithAssetCache:(id)a3 bag:(id)a4;
- (int64_t)_imageTypeForURL:(id)a3;
- (int64_t)confirmationTitle;
- (int64_t)payee;
- (int64_t)salableIcon;
- (int64_t)secondarySalableIcon;
- (int64_t)titleType;
- (unint64_t)ams_confirmationStyle;
- (unint64_t)ams_paymentRequestorType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAccountHeader:(id)a3;
- (void)setApplePayClassic:(BOOL)a3;
- (void)setAttributedList:(id)a3;
- (void)setBiometricsRequest:(id)a3;
- (void)setConfirmationTitle:(int64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDelegateAuthenticateChallenge:(id)a3;
- (void)setDesignVersion:(id)a3;
- (void)setDisablePasscodeFallback:(BOOL)a3;
- (void)setDisplayPrice:(id)a3;
- (void)setDrawBackground:(BOOL)a3;
- (void)setDrawBottomDivider:(BOOL)a3;
- (void)setExplanation:(id)a3;
- (void)setFlexList:(id)a3;
- (void)setInlineImages:(id)a3;
- (void)setIsDelegateAuthentication:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setMerchantSession:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPayee:(int64_t)a3;
- (void)setPaymentSession:(id)a3;
- (void)setPaymentSummary:(id)a3;
- (void)setPerformanceMetrics:(id)a3;
- (void)setPreSheetDialog:(id)a3;
- (void)setPrice:(id)a3;
- (void)setPriceSectionItems:(id)a3;
- (void)setRatingHeader:(id)a3;
- (void)setRatingValue:(id)a3;
- (void)setRequiresAuthorization:(BOOL)a3;
- (void)setResponseDictionary:(id)a3;
- (void)setSalableIcon:(int64_t)a3;
- (void)setSalableIconURL:(id)a3;
- (void)setSalableInfo:(id)a3;
- (void)setSalableInfoLabel:(id)a3;
- (void)setSecondaryFlexList:(id)a3;
- (void)setSecondarySalableIcon:(int64_t)a3;
- (void)setSecondarySalableIconURL:(id)a3;
- (void)setSecondarySalableInfo:(id)a3;
- (void)setSecondarySalableInfoLabel:(id)a3;
- (void)setSelectedCard:(id)a3;
- (void)setShouldUppercaseText:(BOOL)a3;
- (void)setStoreName:(id)a3;
- (void)setStyles:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleType:(int64_t)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation AMSPaymentSheetRequest

- (unint64_t)ams_confirmationStyle
{
  int64_t v2 = [(AMSPaymentSheetRequest *)self confirmationTitle];
  if ((unint64_t)(v2 - 1) > 5) {
    return 0;
  }
  else {
    return qword_18DDF4CC0[v2 - 1];
  }
}

- (unint64_t)ams_paymentRequestorType
{
  int64_t v2 = [(AMSPaymentSheetRequest *)self payee];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18DDF4CF0[v2 - 1];
  }
}

- (id)ams_createSummaryItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(AMSPaymentSheetRequest *)self paymentSummary];

  if (v4)
  {
    uint64_t v5 = [(AMSPaymentSheetRequest *)self paymentSummary];
LABEL_3:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  v7 = [(AMSPaymentSheetRequest *)self storeName];

  if (!v7)
  {
    uint64_t v5 = AMSLocalizedString(@"CONFIRMATION_TITLE_PAY", 0);
    goto LABEL_3;
  }
  v8 = NSString;
  v9 = AMSLocalizedString(@"CONFIRMATION_TITLE_PAY", 0);
  v10 = [(AMSPaymentSheetRequest *)self storeName];
  v6 = [v8 stringWithFormat:@"%@ %@", v9, v10];

LABEL_6:
  if ([(AMSPaymentSheetRequest *)self shouldUppercaseText])
  {
    uint64_t v11 = [v6 localizedUppercaseString];

    v6 = (void *)v11;
  }
  v12 = [(AMSPaymentSheetRequest *)self priceSectionItems];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__AMSPaymentSheetRequest_PassKit__ams_createSummaryItems__block_invoke;
  v25[3] = &unk_1E55A50E8;
  id v13 = v3;
  id v26 = v13;
  [v12 enumerateObjectsUsingBlock:v25];
  uint64_t v14 = [(AMSPaymentSheetRequest *)self price];
  v15 = (void *)v14;
  v16 = &unk_1EDD01618;
  if (v14) {
    v16 = (void *)v14;
  }
  id v17 = v16;

  id PKPaymentSummaryItemClass = getPKPaymentSummaryItemClass();
  v19 = (void *)MEMORY[0x1E4F28C28];
  [v17 decimalValue];

  v20 = [v19 decimalNumberWithDecimal:v24];
  v21 = [PKPaymentSummaryItemClass summaryItemWithLabel:v6 amount:v20];

  [v13 addObject:v21];
  if ([v13 count]) {
    v22 = (void *)[v13 copy];
  }
  else {
    v22 = 0;
  }

  return v22;
}

void __57__AMSPaymentSheetRequest_PassKit__ams_createSummaryItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id PKPaymentSummaryItemClass = getPKPaymentSummaryItemClass();
  uint64_t v5 = [v3 label];
  v6 = [MEMORY[0x1E4F28C28] zero];
  id v8 = [PKPaymentSummaryItemClass summaryItemWithLabel:v5 amount:v6];

  v7 = [v3 price];

  [v8 setLocalizedAmount:v7];
  [v8 setUseDarkColor:1];
  [*(id *)(a1 + 32) addObject:v8];
}

- (id)ams_createSummaryItemsForAttributedListWithAssetCache:(id)a3 bag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMSPaymentSheetRequest *)self attributedList];
  v9 = [(AMSPaymentSheetRequest *)self _summaryItemsForAttributedList:v8 assetCache:v7 bag:v6];

  return v9;
}

- (id)ams_createContentItemForAccount
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSPaymentSheetRequest *)self accountHeader];
  if (v3)
  {
    v4 = [(AMSPaymentSheetRequest *)self account];
    uint64_t v5 = [v4 username];

    id v6 = objc_msgSend(@"%%appleId%%", "ams_replaceAccountPatternWithUsername:", v5);
    if (v6)
    {
      id v7 = objc_alloc_init((Class)getPKPaymentContentItemClass());
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3];
      [v7 setTitle:v8];

      v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
      [v7 setLabel:v9];
    }
    else
    {
      v10 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_opt_class();
        id v13 = v12;
        uint64_t v14 = [(AMSPaymentSheetRequest *)self logKey];
        int v16 = 138543618;
        id v17 = v12;
        __int16 v18 = 2114;
        v19 = v14;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain or format account name", (uint8_t *)&v16, 0x16u);
      }
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)ams_createContentItemForDeviceName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)getPKPaymentContentItemClass());
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3];

  [v4 setTitle:v5];
  [v4 setCentered:1];
  return v4;
}

- (id)ams_createAMSContentItemsForFlexibleListWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(AMSPaymentSheetRequest *)self flexList];
  v12 = [(AMSPaymentSheetRequest *)self _amsContentItemsForFlexibleList:v11 assetCache:v10 designVersion:v9 bag:v8];

  return v12;
}

- (id)ams_createContentItemsForFlexibleListWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(AMSPaymentSheetRequest *)self flexList];
  v12 = [(AMSPaymentSheetRequest *)self _contentItemsForFlexibleList:v11 assetCache:v10 designVersion:v9 bag:v8];

  return v12;
}

- (id)ams_createAMSContentItemsForPreScreenDialogWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(AMSPaymentSheetRequest *)self preSheetDialog];
  v12 = [(AMSPaymentSheetRequest *)self _amsContentItemsForFlexibleList:v11 assetCache:v10 designVersion:v9 bag:v8];

  return v12;
}

- (id)ams_createContentItemsForPreScreenDialogWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(AMSPaymentSheetRequest *)self preSheetDialog];
  v12 = [(AMSPaymentSheetRequest *)self _contentItemsForFlexibleList:v11 assetCache:v10 designVersion:v9 bag:v8];

  return v12;
}

- (id)ams_createAMSContentItemForRating
{
  id v3 = [(AMSPaymentSheetRequest *)self ratingHeader];
  uint64_t v4 = [(AMSPaymentSheetRequest *)self ratingValue];
  uint64_t v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
    id v6 = [(AMSPaymentSheetRequest *)self ams_createAMSContentItem:v7 label:v8 image:0 accessibilityIdentifier:0 padding:0];
  }
  return v6;
}

- (id)ams_createContentItemForRating
{
  id v3 = [(AMSPaymentSheetRequest *)self ratingHeader];
  uint64_t v4 = [(AMSPaymentSheetRequest *)self ratingValue];
  uint64_t v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    id v6 = objc_alloc_init((Class)getPKPaymentContentItemClass());
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3];
    [v6 setTitle:v7];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
    [v6 setLabel:v8];
  }
  return v6;
}

- (id)ams_createSecondaryContentItemsForFlexibleListWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(AMSPaymentSheetRequest *)self secondaryFlexList];
  v12 = [(AMSPaymentSheetRequest *)self _amsContentItemsForFlexibleList:v11 assetCache:v10 designVersion:v9 bag:v8];

  return v12;
}

- (id)ams_amsContentItemForSalableInfoLabel:(id)a3 salableIconURL:(id)a4 salableIcon:(int64_t)a5 assetCache:(id)a6 designVersion:(id)a7 bag:(id)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v14)
  {
    if (v15)
    {
      if ([(AMSPaymentSheetRequest *)self payee] == 3 && a5 == 0) {
        int64_t v20 = 4;
      }
      else {
        int64_t v20 = a5;
      }
      v21 = [(AMSPaymentSheetRequest *)self _createImageRefWithURL:v15 designVersion:v17 adornmentStyle:v20 bag:v18];
      if (v21) {
        goto LABEL_16;
      }
      v22 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v22)
      {
        v22 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_opt_class();
        id v31 = v24;
        v25 = [(AMSPaymentSheetRequest *)self logKey];
        *(_DWORD *)buf = 138543618;
        v33 = v24;
        __int16 v34 = 2114;
        v35 = v25;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load salable icon image", buf, 0x16u);
      }
    }
    v21 = 0;
LABEL_16:
    id v26 = [(AMSPaymentSheetRequest *)self _attachInlineImagesToAttributedString:v14 designVersion:v17 bag:v18];

    v27 = [(id)objc_opt_class() attributedStringByRemovingPlaceholderTagsFromAttributedString:v26];

    v28 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EDCA7308];
    v29 = [(AMSPaymentSheetRequest *)self ams_createAMSContentItem:v28 label:v27 image:v21 accessibilityIdentifier:0 padding:0];

    goto LABEL_18;
  }
  v29 = 0;
LABEL_18:

  return v29;
}

- (id)ams_contentItemForSalableInfoLabel:(id)a3 salableIconURL:(id)a4 salableIcon:(int64_t)a5 assetCache:(id)a6 designVersion:(id)a7 bag:(id)a8
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  if (v13)
  {
    id v17 = objc_alloc_init((Class)getPKPaymentContentItemClass());
    if (v14)
    {
      if ([(AMSPaymentSheetRequest *)self payee] == 3 && a5 == 0) {
        int64_t v19 = 4;
      }
      else {
        int64_t v19 = a5;
      }
      int64_t v20 = [(AMSPaymentSheetRequest *)self _createImageRefWithURL:v14 designVersion:v15 adornmentStyle:v19 bag:v16];
      if (v20)
      {
        v21 = v20;
        [v17 setImage:v20];
        CGImageRelease(v21);
      }
      else
      {
        v23 = +[AMSLogConfig sharedPurchaseConfig];
        if (!v23)
        {
          v23 = +[AMSLogConfig sharedConfig];
        }
        v24 = [v23 OSLogObject];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = objc_opt_class();
          id v33 = v25;
          id v26 = [(AMSPaymentSheetRequest *)self logKey];
          *(_DWORD *)buf = 138543618;
          v35 = v25;
          __int16 v36 = 2114;
          v37 = v26;
          _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load salable icon image", buf, 0x16u);
        }
      }
    }
    v27 = [(AMSPaymentSheetRequest *)self _attachInlineImagesToAttributedString:v13 designVersion:v15 bag:v16];

    v28 = [(id)objc_opt_class() attributedStringByRemovingPlaceholderTagsFromAttributedString:v27];

    v29 = [(AMSPaymentSheetRequest *)self account];
    v30 = [v29 username];
    v22 = objc_msgSend(v28, "ams_replaceAccountPatternWithUsername:", v30);

    id v31 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EDCA7308];
    [v17 setTitle:v31];

    [v17 setLabel:v22];
  }
  else
  {
    id v17 = 0;
    v22 = 0;
  }

  return v17;
}

- (id)ams_createAMSContentItemForSalableInfoWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(AMSPaymentSheetRequest *)self salableInfoLabel];
  v12 = [(AMSPaymentSheetRequest *)self salableIconURL];
  id v13 = [(AMSPaymentSheetRequest *)self ams_amsContentItemForSalableInfoLabel:v11 salableIconURL:v12 salableIcon:[(AMSPaymentSheetRequest *)self salableIcon] assetCache:v10 designVersion:v9 bag:v8];

  return v13;
}

- (id)ams_createSecondaryContentItemForSalableInfoWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(AMSPaymentSheetRequest *)self secondarySalableInfoLabel];
  v12 = [(AMSPaymentSheetRequest *)self secondarySalableIconURL];
  id v13 = [(AMSPaymentSheetRequest *)self ams_amsContentItemForSalableInfoLabel:v11 salableIconURL:v12 salableIcon:[(AMSPaymentSheetRequest *)self secondarySalableIcon] assetCache:v10 designVersion:v9 bag:v8];

  return v13;
}

- (id)ams_createContentItemForSalableInfoWithAssetCache:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(AMSPaymentSheetRequest *)self salableInfoLabel];
  v12 = [(AMSPaymentSheetRequest *)self salableIconURL];
  id v13 = [(AMSPaymentSheetRequest *)self ams_contentItemForSalableInfoLabel:v11 salableIconURL:v12 salableIcon:[(AMSPaymentSheetRequest *)self salableIcon] assetCache:v10 designVersion:v9 bag:v8];

  return v13;
}

+ (id)attributedStringByRemovingPlaceholderTagsFromAttributedString:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__AMSPaymentSheetRequest_PassKit__attributedStringByRemovingPlaceholderTagsFromAttributedString___block_invoke;
  aBlock[3] = &unk_1E55A3CA8;
  id v9 = v3;
  id v4 = v3;
  uint64_t v5 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  v5[2](v5, @"%%image_");
  v5[2](v5, @"%%IMAGE_");
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v4];

  return v6;
}

void __97__AMSPaymentSheetRequest_PassKit__attributedStringByRemovingPlaceholderTagsFromAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) mutableString];
  uint64_t v4 = [v3 rangeOfString:v9];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v6 = v4;
    do
    {
      uint64_t v7 = objc_msgSend(v3, "rangeOfString:options:range:", @"%%", 0, v6 + 1, objc_msgSend(v3, "length") + ~v6);
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", v6, v8 - v6 + v7, &stru_1EDCA7308);
      uint64_t v5 = [*(id *)(a1 + 32) mutableString];

      uint64_t v6 = [v5 rangeOfString:v9];
      id v3 = v5;
    }
    while (v6 != 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (id)_attachInlineImagesToAttributedString:(id)a3 designVersion:(id)a4 bag:(id)a5
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v136 = a3;
  id v130 = a4;
  id v131 = a5;
  v137 = self;
  uint64_t v8 = [(AMSPaymentSheetRequest *)self inlineImages];
  uint64_t v9 = [v8 count];

  uint64_t v135 = v9;
  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = off_1E559C000;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v125 = (void *)*MEMORY[0x1E4F44460];
    while (1)
    {
      v12 = NSString;
      id v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10];
      id v14 = [v12 stringWithFormat:@"%@", v13];

      id v15 = [(AMSPaymentSheetRequest *)v137 inlineImages];
      id v16 = [v15 objectAtIndexedSubscript:v10];

      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v138 = 0;
      if ([v16 isServerSupplied]) {
        break;
      }
      uint64_t v40 = [v16 imageType];
      if (!v40)
      {
        v56 = [(__objc2_class *)v11[17] sharedPurchaseConfig];
        if (!v56)
        {
          v56 = [(__objc2_class *)v11[17] sharedConfig];
        }
        v57 = [v56 OSLogObject];
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v58 = objc_opt_class();
          v59 = v14;
          id v60 = v58;
          v61 = [(AMSPaymentSheetRequest *)v137 logKey];
          *(_DWORD *)buf = 138543618;
          v140 = v58;
          __int16 v141 = 2114;
          v142 = v61;
          _os_log_impl(&dword_18D554000, v57, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch rating image for unknown rating image type", buf, 0x16u);

          uint64_t v11 = off_1E559C000;
          id v14 = v59;
        }

        goto LABEL_36;
      }
      uint64_t v41 = v40;
      if (v40 == 2)
      {
        BOOL v42 = [(AMSPaymentSheetRequest *)v137 isDesignVersionEqualOrGreaterThan:0x1EDD01660];
        int64_t v20 = [v16 value];
        uint64_t v43 = [(__objc2_class *)v11[17] sharedPurchaseConfig];
        v44 = (void *)v43;
        if (v42)
        {
          if (!v43)
          {
            v44 = [(__objc2_class *)v11[17] sharedConfig];
          }
          v45 = [v44 OSLogObject];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = objc_opt_class();
            id v47 = v17;
            v48 = v16;
            v49 = v14;
            id v50 = v46;
            v51 = [(AMSPaymentSheetRequest *)v137 logKey];
            *(_DWORD *)buf = 138543874;
            v140 = v46;
            __int16 v141 = 2114;
            v142 = v51;
            __int16 v143 = 2114;
            v144 = v20;
            _os_log_impl(&dword_18D554000, v45, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Generating text encapsulation inline image with rating value: %{public}@", buf, 0x20u);

            uint64_t v11 = off_1E559C000;
            id v14 = v49;
            id v16 = v48;
            id v17 = v47;
          }

          [v17 setObject:v20 forKeyedSubscript:@"AMSPaymentSheetContentItemTextEncapsulation"];
          uint64_t v52 = 2;
          goto LABEL_38;
        }
        if (!v43)
        {
          v44 = [(__objc2_class *)v11[17] sharedConfig];
        }
        v73 = [v44 OSLogObject];
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          v74 = objc_opt_class();
          id v75 = v17;
          v76 = v16;
          v77 = v14;
          id v78 = v74;
          v79 = [(AMSPaymentSheetRequest *)v137 logKey];
          *(_DWORD *)buf = 138543874;
          v140 = v74;
          __int16 v141 = 2114;
          v142 = v79;
          __int16 v143 = 2114;
          v144 = v20;
          _os_log_impl(&dword_18D554000, v73, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Generating client-supplied inline image with rating value: %{public}@", buf, 0x20u);

          uint64_t v11 = off_1E559C000;
          id v14 = v77;
          id v16 = v76;
          id v17 = v75;
        }

        uint64_t v30 = [(AMSPaymentSheetRequest *)v137 _createRatingImageWithStringValue:v20 assetScale:&v138];
        goto LABEL_9;
      }
      v129 = v14;
      BOOL v64 = [(AMSPaymentSheetRequest *)v137 isDesignVersionEqualOrGreaterThan:0x1EDD01660];
      BOOL v65 = [(AMSPaymentSheetRequest *)v137 isDesignVersionEqualOrGreaterThan:0x1EDD01660];
      if (v41 == 8 && v64)
      {
        v66 = [v16 value];
        v67 = +[AMSPaymentSheetInlineImage textEncapsulationForServerValue:v66];

        v68 = [(__objc2_class *)v11[17] sharedPurchaseConfig];
        if (!v68)
        {
          v68 = [(__objc2_class *)v11[17] sharedConfig];
        }
        v69 = [v68 OSLogObject];
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          v70 = objc_opt_class();
          id v71 = v70;
          v72 = [(AMSPaymentSheetRequest *)v137 logKey];
          *(_DWORD *)buf = 138543874;
          v140 = v70;
          __int16 v141 = 2114;
          v142 = v72;
          __int16 v143 = 2114;
          v144 = v67;
          _os_log_impl(&dword_18D554000, v69, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Generating text encapsulation inline image with rating value: %{public}@", buf, 0x20u);

          uint64_t v11 = off_1E559C000;
        }

        [v17 setObject:v67 forKeyedSubscript:@"AMSPaymentSheetContentItemTextEncapsulation"];
        uint64_t v52 = 1;
        id v14 = v129;
        goto LABEL_38;
      }
      char v80 = !v65;
      if ((unint64_t)(v41 - 3) > 1) {
        char v80 = 1;
      }
      if ((v80 & 1) == 0)
      {
        v56 = [v16 value];
        v81 = [(__objc2_class *)v11[17] sharedPurchaseConfig];
        if (!v81)
        {
          v81 = [(__objc2_class *)v11[17] sharedConfig];
        }
        v82 = [v81 OSLogObject];
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          id v83 = v17;
          v84 = objc_opt_class();
          id v85 = v84;
          [(AMSPaymentSheetRequest *)v137 logKey];
          v87 = v86 = v16;
          *(_DWORD *)buf = 138543874;
          v140 = v84;
          __int16 v141 = 2114;
          v142 = v87;
          __int16 v143 = 2114;
          v144 = v56;
          _os_log_impl(&dword_18D554000, v82, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Will render inline image remotely with rating value: %{public}@", buf, 0x20u);

          id v16 = v86;
          id v17 = v83;

          uint64_t v11 = off_1E559C000;
        }

        if (v41 == 3)
        {
          v94 = [v16 region];

          id v14 = v129;
          if (v94)
          {
            id v95 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            v96 = [v16 region];
            [v95 setObject:v96 forKey:@"AMSPaymentContentItemCountryKey"];

            [v95 setObject:v56 forKey:@"AMSPaymentContentItemRatingKey"];
            v97 = (void *)[v95 copy];
            [v17 setObject:v97 forKeyedSubscript:@"AMSPaymentSheetContentItemRegionalRating"];
          }
        }
        else
        {
          id v14 = v129;
          if (v41 == 4) {
            [v17 setObject:v56 forKeyedSubscript:@"AMSPaymentSheetContentItemMPAARating"];
          }
        }
LABEL_36:

        goto LABEL_37;
      }
      int64_t v20 = [v16 localAssetConfiguration];
      if (v41 == 9)
      {
        id v88 = [v16 value];
        [v17 setObject:v88 forKeyedSubscript:@"AMSPaymentSheetContentItemInlineImage"];
        id v31 = 0;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v88 = v20;
          v89 = [(__objc2_class *)v11[17] sharedPurchaseConfig];
          if (!v89)
          {
            v89 = [(__objc2_class *)v11[17] sharedConfig];
          }
          v90 = [v89 OSLogObject];
          if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
          {
            v121 = v90;
            v91 = objc_opt_class();
            id v119 = v91;
            v123 = [(AMSPaymentSheetRequest *)v137 logKey];
            v118 = [MEMORY[0x1E4F28ED0] numberWithInteger:v41];
            v92 = [v88 filename];
            v133 = v16;
            v93 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v88, "type"));
            *(_DWORD *)buf = 138544386;
            v140 = v91;
            v90 = v121;
            __int16 v141 = 2114;
            v142 = v123;
            __int16 v143 = 2114;
            v144 = v118;
            __int16 v145 = 2114;
            v146 = v92;
            __int16 v147 = 2114;
            v148 = v93;
            _os_log_impl(&dword_18D554000, v121, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching client-supplied inline image with image type: %{public}@, name: %{public}@, asset type: %{public}@", buf, 0x34u);

            id v16 = v133;
            uint64_t v11 = off_1E559C000;
          }
          id v31 = [(AMSPaymentSheetRequest *)v137 _createImageForAssetConfiguration:v88 outAssetScale:&v138];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v88 = v20;
            v98 = [(__objc2_class *)v11[17] sharedPurchaseConfig];
            if (!v98)
            {
              v98 = [(__objc2_class *)v11[17] sharedConfig];
            }
            v99 = [v98 OSLogObject];
            if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
            {
              v122 = objc_opt_class();
              id v124 = v122;
              v120 = [(AMSPaymentSheetRequest *)v137 logKey];
              v100 = [v88 name];
              [v88 accessibilityText];
              v101 = v134 = v16;
              v102 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v88, "scale"));
              *(_DWORD *)buf = 138544386;
              v140 = v122;
              __int16 v141 = 2114;
              v142 = v120;
              __int16 v143 = 2114;
              v144 = v100;
              __int16 v145 = 2114;
              v146 = v101;
              __int16 v147 = 2114;
              v148 = v102;
              _os_log_impl(&dword_18D554000, v99, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Using client-supplied inline symbol image with name: %{public}@, accessibility text: %{public}@, scale: %{public}@", buf, 0x34u);

              id v14 = v129;
              id v16 = v134;

              uint64_t v11 = off_1E559C000;
            }

            v103 = [v88 name];
            [v17 setObject:v103 forKeyedSubscript:@"AMSPaymentSheetContentItemSymbolImageName"];

            v104 = [v88 accessibilityText];
            [v17 setObject:v104 forKeyedSubscript:@"AMSPaymentSheetContentItemSymbolImageAccessibilityText"];

            v105 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v88, "scale"));
            [v17 setObject:v105 forKeyedSubscript:@"AMSPaymentSheetContentItemSymbolImageScale"];
          }
          else
          {
            id v88 = [(__objc2_class *)v11[17] sharedPurchaseConfig];
            if (!v88)
            {
              id v88 = [(__objc2_class *)v11[17] sharedConfig];
            }
            v106 = [v88 OSLogObject];
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              v107 = objc_opt_class();
              id v108 = v107;
              v109 = [(AMSPaymentSheetRequest *)v137 logKey];
              v110 = (objc_class *)objc_opt_class();
              NSStringFromClass(v110);
              uint64_t v111 = v10;
              v112 = v20;
              id v113 = v17;
              v115 = v114 = v16;
              *(_DWORD *)buf = 138543874;
              v140 = v107;
              __int16 v141 = 2114;
              v142 = v109;
              __int16 v143 = 2114;
              v144 = v115;
              _os_log_impl(&dword_18D554000, v106, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch rating image for unknown local image asset type: %{public}@", buf, 0x20u);

              uint64_t v11 = off_1E559C000;
              id v16 = v114;
              id v17 = v113;
              int64_t v20 = v112;
              uint64_t v10 = v111;

              id v14 = v129;
            }
          }
          id v31 = 0;
        }
      }

LABEL_10:
      if (v31)
      {
        Mutable = CFDataCreateMutable(allocator, 0);
        id v33 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)[v125 identifier], 1uLL, 0);
        CGImageDestinationAddImage(v33, v31, 0);
        v132 = v16;
        if (CGImageDestinationFinalize(v33))
        {
          int v34 = v138;
          uint64_t v35 = [v16 tint];
          __int16 v36 = v14;
          v37 = v14;
          LODWORD(v38) = v34;
          v39 = v136;
          id v136 = [(AMSPaymentSheetRequest *)v137 _replaceImagePlaceholderTag:v37 withImageData:Mutable scale:v35 tint:v136 forAttributedString:v38];
        }
        else
        {
          __int16 v36 = v14;
          v39 = [(__objc2_class *)v11[17] sharedPurchaseConfig];
          if (!v39)
          {
            v39 = [(__objc2_class *)v11[17] sharedConfig];
          }
          v53 = [v39 OSLogObject];
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v54 = objc_opt_class();
            id v128 = v54;
            v55 = [(AMSPaymentSheetRequest *)v137 logKey];
            *(_DWORD *)buf = 138543618;
            v140 = v54;
            __int16 v141 = 2114;
            v142 = v55;
            _os_log_impl(&dword_18D554000, v53, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to finalized inline rating image", buf, 0x16u);
          }
          uint64_t v11 = off_1E559C000;
        }

        if (Mutable) {
          CFRelease(Mutable);
        }
        id v14 = v36;
        if (v33) {
          CFRelease(v33);
        }
        CGImageRelease(v31);
        uint64_t v52 = 0;
        id v16 = v132;
        goto LABEL_38;
      }
LABEL_37:
      uint64_t v52 = 0;
LABEL_38:
      if ([v17 count])
      {
        v62 = (void *)[v17 copy];
        uint64_t v63 = [(AMSPaymentSheetRequest *)v137 _replaceImagePlaceholderTag:v14 withAttributes:v62 foregroundColor:v52 forAttributedString:v136];

        id v136 = (id)v63;
      }

      if (v135 == ++v10) {
        goto LABEL_87;
      }
    }
    id v18 = (void *)MEMORY[0x1E4F1CB10];
    int64_t v19 = [v16 URLString];
    int64_t v20 = [v18 URLWithString:v19];

    v21 = [(__objc2_class *)v11[17] sharedPurchaseConfig];
    if (!v21)
    {
      v21 = [(__objc2_class *)v11[17] sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = v14;
      v24 = objc_opt_class();
      id v127 = v24;
      [(AMSPaymentSheetRequest *)v137 logKey];
      uint64_t v25 = v10;
      id v26 = v17;
      v28 = v27 = v16;
      v29 = AMSLogableURL(v20);
      *(_DWORD *)buf = 138543874;
      v140 = v24;
      id v14 = v23;
      __int16 v141 = 2114;
      v142 = v28;
      __int16 v143 = 2114;
      v144 = v29;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching server-supplied inline image at URL: %{public}@", buf, 0x20u);

      id v16 = v27;
      id v17 = v26;
      uint64_t v10 = v25;

      uint64_t v11 = off_1E559C000;
    }

    uint64_t v30 = [(AMSPaymentSheetRequest *)v137 _createImageRefWithURL:v20 designVersion:v130 adornmentStyle:0 bag:v131];
LABEL_9:
    id v31 = (CGImage *)v30;
    goto LABEL_10;
  }
LABEL_87:
  id v116 = v136;

  return v116;
}

- (id)_attachLeadingItem:(id)a3 attributedString:(id)a4 designVersion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(AMSPaymentSheetRequest *)self isDesignVersionEqualOrGreaterThan:0x1EDD01660])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v10 = [NSString stringWithFormat:@"%@%@", @"​", 0x1EDCC6888];
    uint64_t v11 = (void *)[v9 initWithString:v10];

    objc_msgSend(v11, "addAttributes:range:", v7, 0, 1);
    [v11 appendAttributedString:v8];
    v12 = (void *)[v11 copy];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_amsContentItemsForFlexibleList:(id)a3 assetCache:(id)a4 designVersion:(id)a5 bag:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__55;
  v28 = __Block_byref_object_dispose__55;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v10)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __96__AMSPaymentSheetRequest_PassKit___amsContentItemsForFlexibleList_assetCache_designVersion_bag___block_invoke;
    int64_t v19 = &unk_1E55A5110;
    int64_t v20 = self;
    id v21 = v12;
    id v22 = v13;
    v23 = &v24;
    [v10 enumerateObjectsUsingBlock:&v16];
  }
  if (objc_msgSend((id)v25[5], "count", v16, v17, v18, v19, v20)) {
    id v14 = (void *)[(id)v25[5] copy];
  }
  else {
    id v14 = 0;
  }
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __96__AMSPaymentSheetRequest_PassKit___amsContentItemsForFlexibleList_assetCache_designVersion_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) isDesignVersionEqualOrGreaterThan:0x1EDD01660];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v4)
  {
    if (isKindOfClass) {
      id v13 = v5;
    }
    else {
      id v13 = 0;
    }

    id v14 = [v3 objectForKeyedSubscript:@"header"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    uint64_t v16 = [v3 objectForKeyedSubscript:@"headerIcon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    if (v15 && v13)
    {
      id v18 = objc_msgSend(*(id *)(a1 + 32), "ams_createAMSContentItem:label:image:accessibilityIdentifier:padding:", v15, v13, 0, 0, 0);
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v18];
    }
    else
    {
      if (!v17 || !v13) {
        goto LABEL_29;
      }
      int64_t v19 = (void *)MEMORY[0x1E4F1CB10];
      int64_t v20 = [v17 string];
      id v18 = [v19 URLWithString:v20];

      uint64_t v21 = [*(id *)(a1 + 32) _createImageRefWithURL:v18 designVersion:*(void *)(a1 + 40) adornmentStyle:0 bag:*(void *)(a1 + 48)];
      if (!v21)
      {
        id v22 = +[AMSLogConfig sharedPurchaseConfig];
        if (!v22)
        {
          id v22 = +[AMSLogConfig sharedConfig];
        }
        v23 = [v22 OSLogObject];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          log = v23;
          uint64_t v24 = objc_opt_class();
          double v38 = *(void **)(a1 + 32);
          id v41 = v24;
          v39 = [v38 logKey];
          *(_DWORD *)buf = 138543618;
          uint64_t v43 = v24;
          v23 = log;
          __int16 v44 = 2114;
          v45 = v39;
          _os_log_impl(&dword_18D554000, log, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load flexList icon image", buf, 0x16u);
        }
      }
      uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EDCA7308];
      uint64_t v26 = objc_msgSend(*(id *)(a1 + 32), "ams_createAMSContentItem:label:image:accessibilityIdentifier:padding:", v25, v13, v21, 0, 0);
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v26];
    }
LABEL_29:

    goto LABEL_47;
  }
  if ((isKindOfClass & 1) == 0)
  {
LABEL_46:

    goto LABEL_47;
  }
  id v7 = v5;

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) _attachInlineImagesToAttributedString:v7 designVersion:*(void *)(a1 + 40) bag:*(void *)(a1 + 48)];

    uint64_t v5 = +[AMSPaymentSheetRequest attributedStringByRemovingPlaceholderTagsFromAttributedString:v8];

    id v9 = [v3 objectForKeyedSubscript:@"leadingItem"];
    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) _attachLeadingItem:v9 attributedString:v5 designVersion:*(void *)(a1 + 40)];

      id v11 = [v9 objectForKeyedSubscript:@"AMSPaymentSheetContentItemLeadingItemAttribute"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }

      v28 = [v9 objectForKeyedSubscript:@"AMSPaymentSheetContentItemLeadingItemValueAttribute"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v29 = v28;
      }
      else {
        id v29 = 0;
      }

      uint64_t v27 = 0;
      if ([v12 integerValue] == 2 && v29)
      {
        uint64_t v30 = [MEMORY[0x1E4F1CB10] URLWithString:v29];
        uint64_t v27 = [*(id *)(a1 + 32) _createImageRefWithURL:v30 designVersion:*(void *)(a1 + 40) adornmentStyle:0 bag:*(void *)(a1 + 48)];
      }
      uint64_t v5 = (void *)v10;
    }
    else
    {
      uint64_t v27 = 0;
    }
    id v31 = [v3 objectForKeyedSubscript:@"axID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v32 = v31;
    }
    else {
      id v32 = 0;
    }

    id v33 = [v3 objectForKeyedSubscript:@"padding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v34 = v33;
    }
    else {
      id v34 = 0;
    }

    uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v5];
    __int16 v36 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EDCA7308];
    v37 = objc_msgSend(*(id *)(a1 + 32), "ams_createAMSContentItem:label:image:accessibilityIdentifier:padding:", v36, v35, v27, v32, v34);
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v37];

    goto LABEL_46;
  }
LABEL_47:
}

- (id)ams_createAMSContentItem:(id)a3 label:(id)a4 image:(CGImage *)a5 accessibilityIdentifier:(id)a6 padding:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = objc_alloc_init(AMSPaymentContentItem);
  uint64_t v16 = v15;
  if (a5)
  {
    [(AMSPaymentContentItem *)v15 setImage:a5];
    CGImageRelease(a5);
  }
  if (v11) {
    [(AMSPaymentContentItem *)v16 setTitle:v11];
  }
  if (v12) {
    [(AMSPaymentContentItem *)v16 setLabel:v12];
  }
  if (v13) {
    [(AMSPaymentContentItem *)v16 setAccessibilityIdentifier:v13];
  }
  if (v14) {
    [(AMSPaymentContentItem *)v16 setPadding:v14];
  }

  return v16;
}

- (id)_contentItemsForFlexibleList:(id)a3 assetCache:(id)a4 designVersion:(id)a5 bag:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__55;
  v28 = __Block_byref_object_dispose__55;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v10)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __93__AMSPaymentSheetRequest_PassKit___contentItemsForFlexibleList_assetCache_designVersion_bag___block_invoke;
    int64_t v19 = &unk_1E55A5110;
    int64_t v20 = self;
    id v21 = v12;
    id v22 = v13;
    v23 = &v24;
    [v10 enumerateObjectsUsingBlock:&v16];
  }
  if (objc_msgSend((id)v25[5], "count", v16, v17, v18, v19, v20)) {
    id v14 = (void *)[(id)v25[5] copy];
  }
  else {
    id v14 = 0;
  }
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __93__AMSPaymentSheetRequest_PassKit___contentItemsForFlexibleList_assetCache_designVersion_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) isDesignVersionEqualOrGreaterThan:0x1EDD01660];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v4)
  {
    if (isKindOfClass) {
      id v15 = v5;
    }
    else {
      id v15 = 0;
    }

    uint64_t v16 = [v3 objectForKeyedSubscript:@"header"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    id v18 = [v3 objectForKeyedSubscript:@"headerIcon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    if (v17 && v15)
    {
      id v20 = objc_alloc_init((Class)getPKPaymentContentItemClass());
      [v20 setTitle:v17];
      [v20 setLabel:v15];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v20];
    }
    else
    {
      if (!v19 || !v15) {
        goto LABEL_42;
      }
      id v20 = objc_alloc_init((Class)getPKPaymentContentItemClass());
      id v21 = (void *)MEMORY[0x1E4F1CB10];
      id v22 = [v19 string];
      v23 = [v21 URLWithString:v22];

      uint64_t v24 = [*(id *)(a1 + 32) _createImageRefWithURL:v23 designVersion:*(void *)(a1 + 40) adornmentStyle:0 bag:*(void *)(a1 + 48)];
      if (v24)
      {
        uint64_t v25 = (CGImage *)v24;
        [v20 setImage:v24];
        CGImageRelease(v25);
      }
      else
      {
        id v33 = +[AMSLogConfig sharedPurchaseConfig];
        if (!v33)
        {
          id v33 = +[AMSLogConfig sharedConfig];
        }
        id v34 = [v33 OSLogObject];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          log = v34;
          uint64_t v35 = objc_opt_class();
          v37 = *(void **)(a1 + 32);
          id v40 = v35;
          double v38 = [v37 logKey];
          *(_DWORD *)buf = 138543618;
          BOOL v42 = v35;
          id v34 = log;
          __int16 v43 = 2114;
          __int16 v44 = v38;
          _os_log_impl(&dword_18D554000, log, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load flexList icon image", buf, 0x16u);
        }
      }
      __int16 v36 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EDCA7308];
      [v20 setTitle:v36];

      [v20 setLabel:v15];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v20];
    }
LABEL_42:

    goto LABEL_43;
  }
  if (isKindOfClass)
  {
    id v7 = v5;

    if (v7)
    {
      id v8 = objc_alloc_init((Class)getPKPaymentContentItemClass());
      id v9 = [*(id *)(a1 + 32) _attachInlineImagesToAttributedString:v7 designVersion:*(void *)(a1 + 40) bag:*(void *)(a1 + 48)];

      id v10 = +[AMSPaymentSheetRequest attributedStringByRemovingPlaceholderTagsFromAttributedString:v9];

      id v11 = [v3 objectForKeyedSubscript:@"leadingItem"];
      if (v11)
      {
        uint64_t v12 = [*(id *)(a1 + 32) _attachLeadingItem:v11 attributedString:v10 designVersion:*(void *)(a1 + 40)];

        id v13 = [v11 objectForKeyedSubscript:@"AMSPaymentSheetContentItemLeadingItemAttribute"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v14 = v13;
        }
        else {
          id v14 = 0;
        }

        uint64_t v26 = [v11 objectForKeyedSubscript:@"AMSPaymentSheetContentItemLeadingItemValueAttribute"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v27 = v26;
        }
        else {
          id v27 = 0;
        }

        if ([v14 integerValue] == 2 && v27)
        {
          v28 = [MEMORY[0x1E4F1CB10] URLWithString:v27];
          uint64_t v29 = [*(id *)(a1 + 32) _createImageRefWithURL:v28 designVersion:*(void *)(a1 + 40) adornmentStyle:0 bag:*(void *)(a1 + 48)];
          if (v29)
          {
            uint64_t v30 = (CGImage *)v29;
            [v8 setImage:v29];
            CGImageRelease(v30);
          }
        }
        id v10 = (void *)v12;
      }
      id v31 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v10];
      [v8 setLabel:v31];

      id v32 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EDCA7308];
      [v8 setTitle:v32];

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v8];
    }
  }
  else
  {
  }
LABEL_43:
}

- (int64_t)_imageTypeForURL:(id)a3
{
  id v3 = [a3 absoluteString];
  int v4 = [v3 lowercaseString];

  if ([v4 hasSuffix:@"jpg"]) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = [v4 hasSuffix:@"png"];
  }

  return v5;
}

- (CGRect)_rectWithAspectRatio:(CGSize)a3 insideRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.height;
  double v9 = a3.width;
  double v18 = a4.size.width / a3.width;
  double v10 = a4.size.height / a3.height;
  double MidX = CGRectGetMidX(a4);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v19);
  double v13 = fmin(v18, v10);
  double v14 = v9 * v13;
  double v15 = v8 * v13;
  double v16 = MidY + v8 * v13 * -0.5;
  double v17 = MidX + v14 * -0.5;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v17;
  return result;
}

- (id)_replaceImagePlaceholderTag:(id)a3 withAttributes:(id)a4 foregroundColor:(int64_t)a5 forAttributedString:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void *)[a6 mutableCopy];
  uint64_t v12 = (void *)[v10 mutableCopy];

  double v13 = @"AMSPaymentContentItemLightColorAttribute";
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke;
  aBlock[3] = &unk_1E55A5188;
  id v21 = v9;
  id v22 = v11;
  id v24 = v12;
  int64_t v25 = a5;
  v23 = v13;
  id v14 = v12;
  id v15 = v11;
  id v16 = v9;
  double v17 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  v17[2](v17, @"%%image_");
  v17[2](v17, @"%%IMAGE_");
  double v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v15];

  return v18;
}

void __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [NSString stringWithFormat:@"%@%@%@", v15, *(void *)(a1 + 32), @"%%"];
  int v4 = [*(id *)(a1 + 40) mutableString];
  uint64_t v5 = [v4 rangeOfString:v3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v4;
  }
  else
  {
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    do
    {
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      uint64_t v10 = *(void *)(a1 + 64);
      if (v10 == 2)
      {
        char v26 = 1;
        uint64_t v12 = MEMORY[0x1E4F1CC38];
      }
      else
      {
        if (v10) {
          goto LABEL_7;
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke_2;
        v20[3] = &unk_1E55A5138;
        id v11 = *(void **)(a1 + 40);
        id v21 = *(id *)(a1 + 48);
        id v22 = &v23;
        objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", v8, v9, 0, v20);

        uint64_t v12 = MEMORY[0x1E4F1CC38];
        if (!*((unsigned char *)v24 + 24)) {
LABEL_7:
        }
          uint64_t v12 = MEMORY[0x1E4F1CC28];
      }
      [*(id *)(a1 + 56) setObject:v12 forKeyedSubscript:*(void *)(a1 + 48)];
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", v8, v9, @" ");
      double v13 = *(void **)(a1 + 56);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke_3;
      v16[3] = &unk_1E55A5160;
      id v17 = *(id *)(a1 + 40);
      uint64_t v18 = v8;
      uint64_t v19 = v9;
      [v13 enumerateKeysAndObjectsUsingBlock:v16];
      id v7 = [*(id *)(a1 + 40) mutableString];

      uint64_t v8 = [v7 rangeOfString:v3];
      uint64_t v9 = v14;

      _Block_object_dispose(&v23, 8);
      int v4 = v7;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }
}

void __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
}

uint64_t __114__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withAttributes_foregroundColor_forAttributedString___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", a2, a3, *(void *)(a1 + 40), 1);
}

- (id)_replaceImagePlaceholderTag:(id)a3 withImageData:(id)a4 scale:(float)a5 tint:(BOOL)a6 forAttributedString:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void *)[a7 mutableCopy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withImageData_scale_tint_forAttributedString___block_invoke;
  aBlock[3] = &unk_1E55A51B0;
  id v22 = v12;
  id v23 = v14;
  float v26 = a5;
  id v24 = v13;
  uint64_t v25 = self;
  BOOL v27 = a6;
  id v15 = v13;
  id v16 = v14;
  id v17 = v12;
  uint64_t v18 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  v18[2](v18, @"%%image_");
  v18[2](v18, @"%%IMAGE_");
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v16];

  return v19;
}

void __108__AMSPaymentSheetRequest_PassKit___replaceImagePlaceholderTag_withImageData_scale_tint_forAttributedString___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"%@%@%@", a2, *(void *)(a1 + 32), @"%%"];
  int v4 = [*(id *)(a1 + 40) mutableString];
  uint64_t v5 = [v4 rangeOfString:v3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v4;
  }
  else
  {
    uint64_t v8 = v5;
    if (@"AMSPaymentContentItemImageAndScaleAttachment") {
      BOOL v9 = @"AMSPaymentContentItemImageKey" == 0;
    }
    else {
      BOOL v9 = 1;
    }
    int v11 = !v9 && @"AMSPaymentContentItemScaleKey" != 0;
    id v12 = off_1E559C000;
    int v34 = v11;
    id v32 = v3;
    do
    {
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", v8, v6, @" ");
      if (*(void *)(a1 + 48))
      {
        if (v11 && *(float *)(a1 + 64) > 0.0)
        {
          id v13 = [(__objc2_class *)v12[17] sharedPurchaseConfig];
          if (!v13)
          {
            id v13 = [(__objc2_class *)v12[17] sharedConfig];
          }
          uint64_t v14 = [v13 OSLogObject];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            id v15 = objc_opt_class();
            id v16 = *(void **)(a1 + 56);
            id v33 = v15;
            id v17 = [v16 logKey];
            uint64_t v18 = *(void *)(a1 + 32);
            LODWORD(v19) = *(_DWORD *)(a1 + 64);
            id v20 = [MEMORY[0x1E4F28ED0] numberWithFloat:v19];
            id v21 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 68)];
            *(_DWORD *)buf = 138544386;
            __int16 v36 = v15;
            int v11 = v34;
            __int16 v37 = 2114;
            double v38 = v17;
            __int16 v39 = 2114;
            uint64_t v40 = v18;
            id v3 = v32;
            __int16 v41 = 2114;
            BOOL v42 = v20;
            __int16 v43 = 2114;
            __int16 v44 = v21;
            _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Rendering Retina image for tag: %{public}@, scale:%{public}@ tint:%{public}@", buf, 0x34u);

            id v12 = off_1E559C000;
          }

          id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v22 setObject:*(void *)(a1 + 48) forKey:@"AMSPaymentContentItemImageKey"];
          LODWORD(v23) = *(_DWORD *)(a1 + 64);
          id v24 = [MEMORY[0x1E4F28ED0] numberWithFloat:v23];
          [v22 setObject:v24 forKey:@"AMSPaymentContentItemScaleKey"];

          objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", @"AMSPaymentContentItemImageAndScaleAttachment", v22, v8, 1);
        }
        else
        {
          uint64_t v25 = [(__objc2_class *)v12[17] sharedPurchaseConfig];
          if (!v25)
          {
            uint64_t v25 = [(__objc2_class *)v12[17] sharedConfig];
          }
          float v26 = [v25 OSLogObject];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            BOOL v27 = objc_opt_class();
            v28 = *(void **)(a1 + 56);
            id v29 = v27;
            uint64_t v30 = [v28 logKey];
            uint64_t v31 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            __int16 v36 = v27;
            int v11 = v34;
            __int16 v37 = 2114;
            double v38 = v30;
            __int16 v39 = 2114;
            uint64_t v40 = v31;
            _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Rendering non-Retina image for tag: %{public}@", buf, 0x20u);

            id v12 = off_1E559C000;
          }

          objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", @"AMSPaymentContentItemImageAttachment", *(void *)(a1 + 48), v8, 1);
        }
      }
      id v7 = [*(id *)(a1 + 40) mutableString];

      uint64_t v8 = [v7 rangeOfString:v3];
      int v4 = v7;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (id)_summaryItemsForAttributedList:(id)a3 assetCache:(id)a4 bag:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = AMSSetLogKeyIfNeeded();
  if ([v6 count])
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke;
    v32[3] = &unk_1E55A2D98;
    id v9 = v7;
    id v33 = v9;
    [v6 enumerateObjectsUsingBlock:v32];
    uint64_t v10 = [(AMSPaymentSheetRequest *)self paymentSummary];

    if (v10)
    {
      uint64_t v11 = [(AMSPaymentSheetRequest *)self paymentSummary];
    }
    else
    {
      id v16 = [(AMSPaymentSheetRequest *)self storeName];

      if (v16)
      {
        id v17 = NSString;
        uint64_t v18 = AMSLocalizedString(@"CONFIRMATION_TITLE_PAY", 0);
        double v19 = [(AMSPaymentSheetRequest *)self storeName];
        id v12 = [v17 stringWithFormat:@"%@ %@", v18, v19];

        goto LABEL_12;
      }
      uint64_t v11 = AMSLocalizedString(@"CONFIRMATION_TITLE_PAY", 0);
    }
    id v12 = (void *)v11;
LABEL_12:
    if ([(AMSPaymentSheetRequest *)self shouldUppercaseText])
    {
      uint64_t v20 = [v12 localizedUppercaseString];

      id v12 = (void *)v20;
    }
    uint64_t v21 = [(AMSPaymentSheetRequest *)self price];
    id v22 = (void *)v21;
    double v23 = &unk_1EDD01618;
    if (v21) {
      double v23 = (void *)v21;
    }
    id v24 = v23;

    id PKPaymentSummaryItemClass = getPKPaymentSummaryItemClass();
    float v26 = (void *)MEMORY[0x1E4F28C28];
    [v24 decimalValue];

    BOOL v27 = [v26 decimalNumberWithDecimal:v31];
    v28 = [PKPaymentSummaryItemClass summaryItemWithLabel:v12 amount:v27];

    [v9 addObject:v28];
    id v13 = v33;
    goto LABEL_17;
  }
  id v13 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v13)
  {
    id v13 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v35 = (id)objc_opt_class();
    __int16 v36 = 2114;
    __int16 v37 = v8;
    id v15 = v35;
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping attributed list", buf, 0x16u);
  }
LABEL_17:

  if ([v7 count]) {
    id v29 = (void *)[v7 copy];
  }
  else {
    id v29 = 0;
  }

  return v29;
}

void __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_2;
  v5[3] = &unk_1E55A2D98;
  id v6 = *(id *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = [v3 objectForKeyedSubscript:@"header"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;

    if (v7 && v5)
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      v18[3] = 0;
      uint64_t v8 = [v5 length];
      id v9 = [v5 string];
      uint64_t v10 = [v9 componentsSeparatedByString:@"\n"];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_3;
      v11[3] = &unk_1E55A5200;
      id v7 = v7;
      id v12 = v7;
      id v15 = v18;
      id v13 = v5;
      uint64_t v16 = 0;
      uint64_t v17 = v8;
      id v14 = *(id *)(a1 + 32);
      [v10 enumerateObjectsUsingBlock:v11];

      _Block_object_dispose(v18, 8);
    }
  }
  else
  {

    id v7 = 0;
  }
}

void __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id PKPaymentSummaryItemClass = getPKPaymentSummaryItemClass();
  id v7 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0.0"];
  uint64_t v8 = [PKPaymentSummaryItemClass summaryItemWithLabel:v5 amount:v7 type:0];

  [v8 setLocalizedAmount:&stru_1EDCA7308];
  if (a3)
  {
    [v8 setLocalizedTitle:&stru_1EDCA7308];
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) string];
    [v8 setLocalizedTitle:v9];
  }
  [v8 setUseDarkColor:1];
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v11 = [v5 length];
  [v8 setUseLargeFont:0];
  id v12 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_4;
  v16[3] = &unk_1E55A51D8;
  uint64_t v18 = v10;
  uint64_t v19 = v11;
  id v17 = v8;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 72);
  id v15 = v8;
  objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", @"useLargeSize", v13, v14, 0, v16);
  [*(id *)(a1 + 48) addObject:v15];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v5 length] + 1;
}

void __81__AMSPaymentSheetRequest_PassKit___summaryItemsForAttributedList_assetCache_bag___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  if (a3 == *(void *)(a1 + 40) && a4 == *(void *)(a1 + 48))
  {
    id v10 = v9;
    [*(id *)(a1 + 32) setUseLargeFont:1];
    id v9 = v10;
    *a5 = 1;
  }
}

- (CGPath)_createBorderPathForAdornmentStyle:(int64_t)a3 iconWidth:(double)a4 iconHeight:(double)a5
{
  Mutable = 0;
  switch(a3)
  {
    case 0:
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, 0.5, 0.5);
      CGPathAddLineToPoint(Mutable, 0, 0.5, a5 + -0.5);
      CGFloat v12 = a4 + -0.5;
      CGPathAddLineToPoint(Mutable, 0, v12, a5 + -0.5);
      CGPathAddLineToPoint(Mutable, 0, v12, 0.5);
      CGPathAddLineToPoint(Mutable, 0, 0.5, 0.5);
      return Mutable;
    case 3:
    case 6:
      v18.size.CGFloat width = a4 + -1.0;
      v18.size.CGFloat height = a5 + -1.0;
      v18.origin.CGFloat x = 0.5;
      CGFloat v8 = (a5 + -1.0) * 0.5;
      v18.origin.CGFloat y = 0.5;
      id v9 = CGPathCreateWithRoundedRect(v18, (a4 + -1.0) * 0.5, v8, 0);
      MutableCopCGFloat y = CGPathCreateMutableCopy(v9);
      CGPathRelease(v9);
      return MutableCopy;
    case 4:
      Mutable = CGPathCreateMutable();
      CGFloat v13 = a4 * 0.236842105 + 0.0 + 0.5;
      CGPathMoveToPoint(Mutable, 0, 0.5, v13);
      CGFloat v14 = a5 - a4 * 0.236842105 + -0.5;
      CGPathAddLineToPoint(Mutable, 0, 0.5, v14);
      CGFloat v15 = a5 + -0.5;
      CGPathAddQuadCurveToPoint(Mutable, 0, 0.5, v15, v13, v15);
      CGFloat v16 = a4 - a4 * 0.236842105 + -0.5;
      CGPathAddLineToPoint(Mutable, 0, v16, v15);
      CGFloat v17 = a4 + -0.5;
      CGPathAddQuadCurveToPoint(Mutable, 0, v17, v15, v17, v14);
      CGPathAddLineToPoint(Mutable, 0, v17, v13);
      CGPathAddQuadCurveToPoint(Mutable, 0, v17, 0.5, v16, 0.5);
      CGPathAddLineToPoint(Mutable, 0, v13, 0.5);
      CGPathAddQuadCurveToPoint(Mutable, 0, 0.5, 0.5, 0.5, v13);
      return Mutable;
    default:
      return Mutable;
  }
}

- (CGImage)_createDefaultImageWithImageRef:(CGImage *)a3 size:(CGSize)a4 borderPath:(CGPath *)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v10 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, vcvtd_n_u64_f64(width, 2uLL), DeviceRGB, 2u);
  v16.origin.CGFloat x = 0.0;
  v16.origin.CGFloat y = 0.0;
  v16.size.double width = width;
  v16.size.double height = height;
  CGContextDrawImage(v10, v16, a3);
  v14[0] = xmmword_18DDF4C80;
  v14[1] = unk_18DDF4C90;
  uint64_t v11 = CGColorCreate(DeviceRGB, (const CGFloat *)v14);
  CGContextSetStrokeColorWithColor(v10, v11);
  CGContextSetLineWidth(v10, 1.0);
  CGContextAddPath(v10, a5);
  CGContextDrawPath(v10, kCGPathStroke);
  Image = CGBitmapContextCreateImage(v10);
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v11);
  CGContextRelease(v10);
  return Image;
}

- (CGImage)_createImageForAssetConfiguration:(id)a3 outAssetScale:(float *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v27 = 0;
  id v7 = objc_msgSend(MEMORY[0x1E4F28B50], "ams_AppleMediaServicesBundle");
  if (!v7)
  {
    CGFloat v8 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v8)
    {
      CGFloat v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      id v11 = v10;
      CGFloat v12 = [(AMSPaymentSheetRequest *)self logKey];
      *(_DWORD *)buf = 138543618;
      id v29 = v10;
      __int16 v30 = 2114;
      uint64_t v31 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Image Source: Failed to bundle", buf, 0x16u);
    }
  }
  CGFloat v13 = [v6 filename];
  CGFloat v14 = [v6 fileExtension];
  uint64_t v15 = [v7 URLForResource:v13 withExtension:v14];

  if (v15)
  {
    [v6 size];
    CGRect v18 = -[AMSPaymentSheetRequest _createImageRefForAssetURL:size:assetType:outAssetScale:](self, "_createImageRefForAssetURL:size:assetType:outAssetScale:", v15, [v6 type], &v27, v16, v17);
    if (a4) {
LABEL_9:
    }
      *(_DWORD *)a4 = v27;
  }
  else
  {
    uint64_t v20 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v20)
    {
      uint64_t v20 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = objc_opt_class();
      id v26 = v22;
      double v23 = [(AMSPaymentSheetRequest *)self logKey];
      id v24 = [v6 filename];
      uint64_t v25 = [v6 fileExtension];
      *(_DWORD *)buf = 138544130;
      id v29 = v22;
      __int16 v30 = 2114;
      uint64_t v31 = v23;
      __int16 v32 = 2114;
      id v33 = v24;
      __int16 v34 = 2114;
      id v35 = v25;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Image Source: Failed to find path for resource: %{public}@.%{public}@", buf, 0x2Au);
    }
    CGRect v18 = 0;
    if (a4) {
      goto LABEL_9;
    }
  }

  return v18;
}

- (CGImage)_createImageRefForAssetURL:(id)a3 size:(CGSize)a4 assetType:(int64_t)a5 outAssetScale:(float *)a6
{
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  if (!a5)
  {
    CGFloat v13 = [(AMSPaymentSheetRequest *)self _createImageRefForImageURL:v12 outAssetScale:a6];
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    CGFloat v13 = -[AMSPaymentSheetRequest _createImageRefForPDFURL:size:outAssetScale:](self, "_createImageRefForPDFURL:size:outAssetScale:", v12, a6, width, height);
LABEL_5:
    id v6 = v13;
  }

  return v6;
}

- (CGImage)_createImageRefForPDFURL:(id)a3 size:(CGSize)a4 outAssetScale:(float *)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  CFURLRef v9 = (const __CFURL *)a3;
  id v10 = CGPDFDocumentCreateWithURL(v9);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = v10;
  id v11 = (void (**)(void))_Block_copy(aBlock);
  if (!v10)
  {
    if (+[AMSUnitTests isRunningUnitTests])
    {
      v51 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v51)
      {
        v51 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v52 = [v51 OSLogObject];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = AMSLogKey();
        v54 = NSString;
        if (v53)
        {
          uint64_t v55 = objc_opt_class();
          v56 = AMSLogKey();
          v57 = [v54 stringWithFormat:@"%@: [%@] ", v55, v56];
        }
        else
        {
          v57 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v56 = v57;
        }
        v100 = AMSLogableURL(v9);
        LODWORD(v136.a) = 138543618;
        *(void *)((char *)&v136.a + 4) = v57;
        WORD2(v136.b) = 2114;
        *(void *)((char *)&v136.b + 6) = v100;
        _os_log_impl(&dword_18D554000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to create PDF document for resource at URL: %{public}@", (uint8_t *)&v136, 0x16u);
        if (v53) {
      }
        }
      goto LABEL_70;
    }
    uint64_t v63 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v63)
    {
      uint64_t v63 = +[AMSLogConfig sharedConfig];
    }
    BOOL v64 = [v63 OSLogObject];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      BOOL v65 = AMSLogKey();
      v66 = NSString;
      if (v65)
      {
        uint64_t v67 = objc_opt_class();
        v68 = AMSLogKey();
        v69 = [v66 stringWithFormat:@"%@: [%@] ", v67, v68];
      }
      else
      {
        v69 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        v68 = v69;
      }
      v103 = AMSLogableURL(v9);
      LODWORD(v136.a) = 138543618;
      *(void *)((char *)&v136.a + 4) = v69;
      WORD2(v136.b) = 2114;
      *(void *)((char *)&v136.b + 6) = v103;
      _os_log_impl(&dword_18D554000, v64, OS_LOG_TYPE_FAULT, "%{public}@Failed to create PDF document for resource at URL: %{public}@", (uint8_t *)&v136, 0x16u);
      if (v65) {
    }
      }
LABEL_90:

    goto LABEL_91;
  }
  Page = CGPDFDocumentGetPage(v10, 1uLL);
  CGFloat v13 = Page;
  if (!Page)
  {
    if (+[AMSUnitTests isRunningUnitTests])
    {
      v51 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v51)
      {
        v51 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v52 = [v51 OSLogObject];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v58 = AMSLogKey();
        v59 = NSString;
        if (v58)
        {
          uint64_t v60 = objc_opt_class();
          v61 = AMSLogKey();
          v62 = [v59 stringWithFormat:@"%@: [%@] ", v60, v61];
        }
        else
        {
          v62 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v61 = v62;
        }
        id v108 = AMSLogableURL(v9);
        LODWORD(v136.a) = 138543618;
        *(void *)((char *)&v136.a + 4) = v62;
        WORD2(v136.b) = 2114;
        *(void *)((char *)&v136.b + 6) = v108;
        _os_log_impl(&dword_18D554000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to create PDF page for page 1 of PDF at URL: %{public}@", (uint8_t *)&v136, 0x16u);
        if (v58) {
      }
        }
LABEL_70:

      v101 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v102 = +[AMSLogConfig sharedPurchaseConfig];
      [v101 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v102 userInfo:0];

LABEL_91:
      Image = 0;
      float v27 = 0.0;
      goto LABEL_123;
    }
    uint64_t v63 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v63)
    {
      uint64_t v63 = +[AMSLogConfig sharedConfig];
    }
    BOOL v64 = [v63 OSLogObject];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      v77 = AMSLogKey();
      id v78 = NSString;
      if (v77)
      {
        uint64_t v79 = objc_opt_class();
        char v80 = AMSLogKey();
        v81 = [v78 stringWithFormat:@"%@: [%@] ", v79, v80];
      }
      else
      {
        v81 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        char v80 = v81;
      }
      v109 = AMSLogableURL(v9);
      LODWORD(v136.a) = 138543618;
      *(void *)((char *)&v136.a + 4) = v81;
      WORD2(v136.b) = 2114;
      *(void *)((char *)&v136.b + 6) = v109;
      _os_log_impl(&dword_18D554000, v64, OS_LOG_TYPE_FAULT, "%{public}@Failed to create PDF page for page 1 of PDF at URL: %{public}@", (uint8_t *)&v136, 0x16u);
      if (v77) {
    }
      }
    goto LABEL_90;
  }
  CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
  CGFloat y = BoxRect.origin.y;
  CGFloat x = BoxRect.origin.x;
  CGFloat v14 = BoxRect.size.width;
  CGFloat v15 = BoxRect.size.height;
  int RotationAngle = CGPDFPageGetRotationAngle(v13);
  memset(&v136, 0, sizeof(v136));
  CGAffineTransformMakeRotation(&v136, (double)-RotationAngle * 0.0174532925);
  CGAffineTransform transform = v136;
  v139.origin.CGFloat y = y;
  v139.origin.CGFloat x = x;
  v139.size.double width = v14;
  v139.size.double height = v15;
  CGRect v140 = CGRectApplyAffineTransform(v139, &transform);
  CGFloat v120 = v140.origin.y;
  CGFloat v121 = v140.origin.x;
  double v17 = v140.size.width;
  double rect = v140.size.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v141.origin.CGFloat x = x;
    v141.origin.CGFloat y = y;
    v141.size.double width = v14;
    v141.size.double height = v15;
    double v19 = CGRectGetWidth(v141);
    v142.origin.CGFloat x = x;
    v142.origin.CGFloat y = y;
    v142.size.double width = v14;
    v142.size.double height = v15;
    double width = v19 * 0.5;
    double height = CGRectGetHeight(v142) * 0.5;
  }
  -[AMSPaymentSheetRequest _rectWithAspectRatio:insideRect:](self, "_rectWithAspectRatio:insideRect:", v17, rect, 0.0, 0.0, width, height);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v118 = v15;
  CGFloat v119 = v14;
  id v24 = +[AMSDevice screenScale];
  uint64_t v25 = v24;
  if (!v24) {
    id v24 = &unk_1EDD01630;
  }
  [v24 floatValue];
  float v27 = v26;

  CGFloat v28 = *MEMORY[0x1E4F1DAD8];
  CGFloat v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CGAffineTransformMakeScale(&v133, v27, v27);
  v143.origin.CGFloat x = v28;
  v143.origin.CGFloat y = v29;
  v143.size.double width = v21;
  v143.size.double height = v23;
  CGRect v144 = CGRectApplyAffineTransform(v143, &v133);
  CGRect v145 = CGRectIntegral(v144);
  CGFloat v30 = v145.origin.x;
  CGFloat v31 = v145.origin.y;
  CGFloat v32 = v145.size.width;
  CGFloat v33 = v145.size.height;
  double v117 = CGRectGetHeight(v145);
  v146.origin.CGFloat y = v120;
  v146.origin.CGFloat x = v121;
  v146.size.double width = v17;
  v146.size.double height = rect;
  double recta = CGRectGetHeight(v146);
  v147.origin.CGFloat x = v30;
  v147.origin.CGFloat y = v31;
  v147.size.double width = v32;
  v147.size.double height = v33;
  double v34 = CGRectGetWidth(v147);
  v148.origin.CGFloat x = v30;
  v148.origin.CGFloat y = v31;
  v148.size.double width = v32;
  v148.size.double height = v33;
  double v35 = CGRectGetHeight(v148);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke_112;
  v132[3] = &__block_descriptor_40_e5_v8__0l;
  v132[4] = DeviceRGB;
  __int16 v37 = (void (**)(void))_Block_copy(v132);
  if (!DeviceRGB)
  {
    if (+[AMSUnitTests isRunningUnitTests])
    {
      v70 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v70)
      {
        v70 = +[AMSLogConfig sharedConfig];
      }
      id v71 = [v70 OSLogObject];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        v72 = AMSLogKey();
        v73 = NSString;
        if (v72)
        {
          uint64_t v74 = objc_opt_class();
          id v75 = AMSLogKey();
          v76 = [v73 stringWithFormat:@"%@: [%@] ", v74, v75];
        }
        else
        {
          v76 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          id v75 = v76;
        }
        v110 = AMSLogableURL(v9);
        LODWORD(transform.a) = 138543618;
        *(void *)((char *)&transform.a + 4) = v76;
        WORD2(transform.b) = 2114;
        *(void *)((char *)&transform.b + 6) = v110;
        _os_log_impl(&dword_18D554000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to create color space for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
        if (v72) {
      }
        }
      __int16 v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v88 = +[AMSLogConfig sharedPurchaseConfig];
      [v39 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v88 userInfo:0];
    }
    else
    {
      __int16 v39 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v39)
      {
        __int16 v39 = +[AMSLogConfig sharedConfig];
      }
      id v88 = [v39 OSLogObject];
      if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
      {
        v89 = AMSLogKey();
        v90 = NSString;
        if (v89)
        {
          uint64_t v91 = objc_opt_class();
          v92 = AMSLogKey();
          v93 = [v90 stringWithFormat:@"%@: [%@] ", v91, v92];
        }
        else
        {
          v93 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v92 = v93;
        }
        uint64_t v111 = AMSLogableURL(v9);
        LODWORD(transform.a) = 138543618;
        *(void *)((char *)&transform.a + 4) = v93;
        WORD2(transform.b) = 2114;
        *(void *)((char *)&transform.b + 6) = v111;
        _os_log_impl(&dword_18D554000, v88, OS_LOG_TYPE_FAULT, "%{public}@Failed to create color space for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
        if (v89) {
      }
        }
    }

    Image = 0;
    float v27 = 0.0;
    goto LABEL_122;
  }
  uint64_t v38 = CGBitmapContextCreate(0, (unint64_t)v34, (unint64_t)v35, 8uLL, 4 * (unint64_t)v34, DeviceRGB, 2u);
  v131[0] = MEMORY[0x1E4F143A8];
  v131[1] = 3221225472;
  v131[2] = __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke_2;
  v131[3] = &__block_descriptor_40_e5_v8__0l;
  v131[4] = v38;
  __int16 v39 = (void (**)(void))_Block_copy(v131);
  if (v38)
  {
    v149.origin.CGFloat x = v30;
    v149.origin.CGFloat y = v31;
    v149.size.double width = v32;
    v149.size.double height = v33;
    CGPDFPageGetDrawingTransform(&transform, v13, kCGPDFCropBox, v149, 0, 1);
    CGAffineTransform v136 = transform;
    if (v117 / recta > 1.0)
    {
      v150.origin.CGFloat x = x;
      v150.origin.CGFloat y = y;
      v150.size.double width = v119;
      v150.size.double height = v118;
      CGFloat MidX = CGRectGetMidX(v150);
      v151.origin.CGFloat x = x;
      v151.origin.CGFloat y = y;
      v151.size.double width = v119;
      v151.size.double height = v118;
      CGFloat MidY = CGRectGetMidY(v151);
      CGAffineTransform v130 = v136;
      CGAffineTransformTranslate(&transform, &v130, MidX, MidY);
      CGAffineTransform v136 = transform;
      CGAffineTransform v130 = transform;
      CGAffineTransformScale(&transform, &v130, v117 / recta, v117 / recta);
      CGAffineTransform v136 = transform;
      v152.origin.CGFloat x = x;
      v152.origin.CGFloat y = y;
      v152.size.double width = v119;
      v152.size.double height = v118;
      double v42 = CGRectGetMidX(v152);
      v153.origin.CGFloat x = x;
      v153.origin.CGFloat y = y;
      v153.size.double width = v119;
      v153.size.double height = v118;
      CGFloat v43 = CGRectGetMidY(v153);
      CGAffineTransform v130 = v136;
      CGAffineTransformTranslate(&transform, &v130, -v42, -v43);
      CGAffineTransform v136 = transform;
    }
    CGAffineTransform transform = v136;
    CGContextConcatCTM(v38, &transform);
    v154.origin.CGFloat y = y;
    v154.origin.CGFloat x = x;
    v154.size.double height = v118;
    v154.size.double width = v119;
    CGContextAddRect(v38, v154);
    CGContextClip(v38);
    CGContextDrawPDFPage(v38, v13);
    Image = CGBitmapContextCreateImage(v38);
    if (Image) {
      goto LABEL_121;
    }
    if (+[AMSUnitTests isRunningUnitTests])
    {
      uint64_t v45 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v45)
      {
        uint64_t v45 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v46 = [v45 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v126 = AMSLogKey();
        id v47 = NSString;
        if (v126)
        {
          uint64_t v48 = objc_opt_class();
          v49 = AMSLogKey();
          id v50 = [v47 stringWithFormat:@"%@: [%@] ", v48, v49];
        }
        else
        {
          id v50 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v49 = v50;
        }
        v114 = AMSLogableURL(v9);
        LODWORD(transform.a) = 138543618;
        *(void *)((char *)&transform.a + 4) = v50;
        WORD2(transform.b) = 2114;
        *(void *)((char *)&transform.b + 6) = v114;
        _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
        if (v126) {
      }
        }
      v94 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v95 = +[AMSLogConfig sharedPurchaseConfig];
      [v94 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v95 userInfo:0];
    }
    else
    {
      v94 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v94)
      {
        v94 = +[AMSLogConfig sharedConfig];
      }
      id v95 = [v94 OSLogObject];
      if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
      {
        v129 = AMSLogKey();
        v104 = NSString;
        if (v129)
        {
          uint64_t v105 = objc_opt_class();
          v106 = AMSLogKey();
          v107 = [v104 stringWithFormat:@"%@: [%@] ", v105, v106];
        }
        else
        {
          v107 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v106 = v107;
        }
        v115 = AMSLogableURL(v9);
        LODWORD(transform.a) = 138543618;
        *(void *)((char *)&transform.a + 4) = v107;
        WORD2(transform.b) = 2114;
        *(void *)((char *)&transform.b + 6) = v115;
        _os_log_impl(&dword_18D554000, v95, OS_LOG_TYPE_FAULT, "%{public}@Failed to create image for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
        if (v129) {
      }
        }
    }
  }
  else if (+[AMSUnitTests isRunningUnitTests])
  {
    v82 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v82)
    {
      v82 = +[AMSLogConfig sharedConfig];
    }
    id v83 = [v82 OSLogObject];
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      id v127 = AMSLogKey();
      v84 = NSString;
      if (v127)
      {
        uint64_t v85 = objc_opt_class();
        v86 = AMSLogKey();
        v87 = [v84 stringWithFormat:@"%@: [%@] ", v85, v86];
      }
      else
      {
        v87 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        v86 = v87;
      }
      v112 = AMSLogableURL(v9);
      LODWORD(transform.a) = 138543618;
      *(void *)((char *)&transform.a + 4) = v87;
      WORD2(transform.b) = 2114;
      *(void *)((char *)&transform.b + 6) = v112;
      _os_log_impl(&dword_18D554000, v83, OS_LOG_TYPE_ERROR, "%{public}@Failed to create bitmap image context for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
      if (v127) {
    }
      }
    v94 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v95 = +[AMSLogConfig sharedPurchaseConfig];
    [v94 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v95 userInfo:0];
  }
  else
  {
    v94 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v94)
    {
      v94 = +[AMSLogConfig sharedConfig];
    }
    id v95 = [v94 OSLogObject];
    if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
    {
      id v128 = AMSLogKey();
      v96 = NSString;
      if (v128)
      {
        uint64_t v97 = objc_opt_class();
        v98 = AMSLogKey();
        v99 = [v96 stringWithFormat:@"%@: [%@] ", v97, v98];
      }
      else
      {
        v99 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        v98 = v99;
      }
      id v113 = AMSLogableURL(v9);
      LODWORD(transform.a) = 138543618;
      *(void *)((char *)&transform.a + 4) = v99;
      WORD2(transform.b) = 2114;
      *(void *)((char *)&transform.b + 6) = v113;
      _os_log_impl(&dword_18D554000, v95, OS_LOG_TYPE_FAULT, "%{public}@Failed to create bitmap image context for PDF at URL: %{public}@", (uint8_t *)&transform, 0x16u);
      if (v128) {
    }
      }
  }

  Image = 0;
  float v27 = 0.0;
LABEL_121:
  v39[2](v39);
LABEL_122:

  v37[2](v37);
LABEL_123:
  if (a5) {
    *a5 = v27;
  }
  v11[2](v11);

  return Image;
}

void __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke(uint64_t a1)
{
}

void __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke_112(uint64_t a1)
{
}

void __79__AMSPaymentSheetRequest_PassKit___createImageRefForPDFURL_size_outAssetScale___block_invoke_2(uint64_t a1)
{
}

- (CGImage)_createImageRefForImageURL:(id)a3 outAssetScale:(float *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  CFURLRef v6 = (const __CFURL *)a3;
  int v27 = 0;
  id v7 = CGImageSourceCreateWithURL(v6, 0);
  if (v7)
  {
    CGFloat v8 = v7;
    if (CGImageSourceGetCount(v7))
    {
      CFURLRef v9 = +[AMSDevice screenScale];
      [v9 floatValue];
      int v11 = v10;

      LODWORD(v12) = v11;
      CGFloat v13 = [(AMSPaymentSheetRequest *)self _createImageRefForImageSource:v8 screenScale:&v27 outAssetScale:v12];
    }
    else
    {
      double v20 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v20)
      {
        double v20 = +[AMSLogConfig sharedConfig];
      }
      CGFloat v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        double v22 = objc_opt_class();
        id v23 = v22;
        id v24 = [(AMSPaymentSheetRequest *)self logKey];
        uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:0];
        *(_DWORD *)buf = 138543874;
        CGFloat v29 = v22;
        __int16 v30 = 2114;
        CGFloat v31 = v24;
        __int16 v32 = 2114;
        CGFloat v33 = v25;
        _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Image Source: Failed image count: %{public}@", buf, 0x20u);
      }
      CGFloat v13 = 0;
    }
    CFRelease(v8);
    if (a4) {
LABEL_16:
    }
      *(_DWORD *)a4 = v27;
  }
  else
  {
    CGFloat v14 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v14)
    {
      CGFloat v14 = +[AMSLogConfig sharedConfig];
    }
    CGFloat v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      double v16 = objc_opt_class();
      id v17 = v16;
      CGRect v18 = [(AMSPaymentSheetRequest *)self logKey];
      double v19 = AMSLogableURL(v6);
      *(_DWORD *)buf = 138543874;
      CGFloat v29 = v16;
      __int16 v30 = 2114;
      CGFloat v31 = v18;
      __int16 v32 = 2114;
      CGFloat v33 = v19;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Image Source: Failed to create image source for resource at URL: %{public}@", buf, 0x20u);
    }
    CGFloat v13 = 0;
    if (a4) {
      goto LABEL_16;
    }
  }

  return v13;
}

- (CGImage)_createImageMaskRefWithSize:(CGSize)a3 andPath:(CGPath *)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
  CGFloat v8 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, 0, DeviceGray, 7u);
  long long v19 = xmmword_18DDF4C70;
  CFURLRef v9 = CGColorCreate(DeviceGray, (const CGFloat *)&v19);
  CGContextSetFillColorWithColor(v8, v9);
  v21.origin.CGFloat x = 0.0;
  v21.origin.CGFloat y = 0.0;
  v21.size.double width = width;
  v21.size.double height = height;
  CGContextFillRect(v8, v21);
  CGContextBeginPath(v8);
  CGContextAddPath(v8, a4);
  CGContextClip(v8);
  v22.origin.CGFloat x = 0.0;
  v22.origin.CGFloat y = 0.0;
  v22.size.double width = width;
  v22.size.double height = height;
  CGContextClearRect(v8, v22);
  Image = CGBitmapContextCreateImage(v8);
  size_t v11 = CGImageGetWidth(Image);
  size_t v12 = CGImageGetHeight(Image);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(Image);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(Image);
  size_t BytesPerRow = CGImageGetBytesPerRow(Image);
  DataProvider = CGImageGetDataProvider(Image);
  id v17 = CGImageMaskCreate(v11, v12, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, 0, 0);
  CGImageRelease(Image);
  CGColorRelease(v9);
  CGContextRelease(v8);
  CGColorSpaceRelease(DeviceGray);
  return v17;
}

- (CGImage)_createImageRefForImageSource:(CGImageSource *)a3 screenScale:(float)a4 outAssetScale:(float *)a5
{
  size_t Count = CGImageSourceGetCount(a3);
  float v9 = 2.0;
  float v10 = 1.0;
  if (a4 == 2.0 && (Count & 0xFFFFFFFFFFFFFFFELL) == 2) {
    float v11 = 2.0;
  }
  else {
    float v11 = 1.0;
  }
  uint64_t v12 = 1;
  uint64_t v13 = 2;
  if (Count == 3) {
    float v10 = 3.0;
  }
  else {
    uint64_t v13 = 0;
  }
  if (Count != 2)
  {
    uint64_t v12 = v13;
    float v9 = v10;
  }
  if (a4 == 3.0) {
    size_t v14 = v12;
  }
  else {
    size_t v14 = (a4 == 2.0) & ((Count & 0xFFFFFFFFFFFFFFFELL) == 2);
  }
  if (a4 == 3.0) {
    float v15 = v9;
  }
  else {
    float v15 = v11;
  }
  CGRect result = CGImageSourceCreateImageAtIndex(a3, v14, 0);
  if (a5) {
    *a5 = v15;
  }
  return result;
}

- (CGImage)_createImageRefWithURL:(id)a3 designVersion:(id)a4 adornmentStyle:(int64_t)a5 bag:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v46 = a4;
  id v10 = a6;
  float v11 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v11)
  {
    float v11 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v12 = objc_msgSend(v11, "OSLogObject", a5);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    id v14 = v13;
    float v15 = [(AMSPaymentSheetRequest *)self logKey];
    double v16 = AMSLogableURL(v9);
    *(_DWORD *)buf = 138543874;
    id v50 = v13;
    __int16 v51 = 2114;
    uint64_t v52 = v15;
    __int16 v53 = 2114;
    id v54 = v16;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading image resource at: %{public}@", buf, 0x20u);
  }
  id v17 = [[AMSURLRequestEncoder alloc] initWithBag:v10];

  [(AMSURLRequestEncoder *)v17 setDisableResponseDecoding:1];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [v18 timeIntervalSince1970];
  double v20 = v19;

  CGRect v21 = [(AMSURLRequestEncoder *)v17 requestWithMethod:2 URL:v9 parameters:0];
  id v48 = 0;
  CGRect v22 = [v21 resultWithError:&v48];
  id v23 = v48;

  if (v23)
  {
    id v24 = 0;
LABEL_8:
    int v27 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v27)
    {
      int v27 = +[AMSLogConfig sharedConfig];
    }
    CGFloat v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      CGFloat v29 = objc_opt_class();
      id v30 = v29;
      CGFloat v31 = [(AMSPaymentSheetRequest *)self logKey];
      *(_DWORD *)buf = 138543874;
      id v50 = v29;
      __int16 v51 = 2114;
      uint64_t v52 = v31;
      __int16 v53 = 2114;
      id v54 = v23;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load image resource. Error: %{public}@", buf, 0x20u);
    }
    __int16 v32 = 0;
    CGFloat v33 = v46;
    goto LABEL_13;
  }
  uint64_t v25 = +[AMSURLSession defaultSession];
  float v26 = [v25 dataTaskPromiseWithRequest:v22];
  id v47 = 0;
  id v24 = [v26 resultWithError:&v47];
  id v23 = v47;

  if (v23) {
    goto LABEL_8;
  }
  double v35 = [v24 data];
  id v23 = (id)[v35 length];

  if (!v23) {
    goto LABEL_8;
  }
  uint64_t v36 = [(AMSPaymentSheetRequest *)self performanceMetrics];
  [v36 setResourceRequestStartTime:v20];

  id v37 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [v37 timeIntervalSince1970];
  double v39 = v38;
  uint64_t v40 = [(AMSPaymentSheetRequest *)self performanceMetrics];
  [v40 setResourceRequestEndTime:v39];

  __int16 v41 = [v24 data];

  double v42 = CGDataProviderCreateWithCFData((CFDataRef)v41);
  unint64_t v43 = [(AMSPaymentSheetRequest *)self _imageTypeForURL:v9];
  if (v43 >= 2)
  {
    CGFloat v33 = v46;
    if (v43 == 2) {
      __int16 v32 = CGImageCreateWithJPEGDataProvider(v42, 0, 1, kCGRenderingIntentDefault);
    }
    else {
      __int16 v32 = 0;
    }
  }
  else
  {
    __int16 v32 = CGImageCreateWithPNGDataProvider(v42, 0, 1, kCGRenderingIntentDefault);
    CGFloat v33 = v46;
  }
  if (v42) {
    CFRelease(v42);
  }
  if ([(AMSPaymentSheetRequest *)self isDesignVersionLessThan:0x1EDD01660]) {
    __int16 v32 = [(AMSPaymentSheetRequest *)self _createImageRefForImageRef:v32 withAdornmentStyle:v45 andDesignVersion:v33];
  }
LABEL_13:

  return v32;
}

- (CGImage)_createImageRefForImageRef:(CGImage *)a3 withAdornmentStyle:(int64_t)a4 andDesignVersion:(id)a5
{
  id v8 = a5;
  unint64_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  size_t v11 = Height;
  double v12 = (double)Width;
  double v13 = (double)Height;
  switch(a4)
  {
    case 0:
      id v14 = [(AMSPaymentSheetRequest *)self _createBorderPathForAdornmentStyle:0 iconWidth:(double)Width iconHeight:v13];
      double v20 = -[AMSPaymentSheetRequest _createDefaultImageWithImageRef:size:borderPath:](self, "_createDefaultImageWithImageRef:size:borderPath:", a3, v14, v12, v13);
      goto LABEL_24;
    case 1:
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, 0.0, v12 * 0.032);
      CGPathAddLineToPoint(Mutable, 0, 0.0, v13 - v12 * 0.032);
      CGPathAddArcToPoint(Mutable, 0, 0.0, v13, v12 * 0.032, v13, v12 * 0.032);
      CGPathAddLineToPoint(Mutable, 0, v12 - v12 * 0.473684211, v13);
      CGPathAddArcToPoint(Mutable, 0, (double)Width, v13, (double)Width, v13 - v12 * 0.473684211, v12 * 0.473684211);
      CGPathAddLineToPoint(Mutable, 0, (double)Width, v12 * 0.032);
      CGPathAddArcToPoint(Mutable, 0, (double)Width, 0.0, v12 - v12 * 0.032, 0.0, v12 * 0.032);
      CGPathAddLineToPoint(Mutable, 0, v12 * 0.032, 0.0);
      CGPathAddArcToPoint(Mutable, 0, 0.0, 0.0, 0.0, v12 * 0.032, v12 * 0.032);
      MutableCopCGFloat y = CGPathCreateMutableCopy(Mutable);
      id v23 = [(AMSPaymentSheetRequest *)self _createMaskedImageRefForImageRef:a3 withPathRef:MutableCopy adornmentStyle:1 andDesignVersion:v8];
      if (Mutable) {
        CGPathRelease(Mutable);
      }
      if (MutableCopy) {
        CGPathRelease(MutableCopy);
      }
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      uint64_t v25 = CGBitmapContextCreate(0, Width, v11, 8uLL, 4 * Width, DeviceRGB, 2u);
      CGContextSetRGBFillColor(v25, 0.0, 0.0, 0.0, 0.0);
      v38.origin.CGFloat x = 0.0;
      v38.origin.CGFloat y = 0.0;
      v38.size.double width = (double)Width;
      v38.size.double height = v13;
      CGContextFillRect(v25, v38);
      CGContextSetRGBFillColor(v25, 0.827000022, 0.827000022, 0.827000022, 1.0);
      v39.origin.CGFloat x = 0.0;
      v39.origin.CGFloat y = 0.0;
      v39.size.double width = (double)Width;
      v39.size.double height = v13;
      float v26 = CGPathCreateWithRoundedRect(v39, v12 * 0.0579999983, v13 * 0.0579999983, 0);
      CGContextBeginPath(v25);
      CGContextAddPath(v25, v26);
      CGContextFillPath(v25);
      if (DeviceRGB) {
        CGColorSpaceRelease(DeviceRGB);
      }
      if (v26) {
        CGPathRelease(v26);
      }
      double v27 = v12 * 0.0813999996;
      double v28 = v13 * 0.0813999996;
      v40.size.double width = v12 + v12 * 0.0813999996 * -2.0;
      v40.size.double height = v13 + v13 * 0.0813999996 * -2.0;
      v40.origin.CGFloat x = v12 * 0.0813999996;
      v40.origin.CGFloat y = v13 * 0.0813999996;
      CGContextDrawImage(v25, v40, v23);
      if (v23) {
        CGImageRelease(v23);
      }
      double v29 = v27 * 0.550000012;
      CGFloat v30 = v12 - v27 - v27 * 0.550000012;
      CGFloat v31 = v13 - v28 - v28 * 0.550000012;
      CGContextSetRGBStrokeColor(v25, 0.707, 0.707, 0.707, 1.0);
      CGContextSetLineWidth(v25, v12 * 0.0208333333);
      CGContextMoveToPoint(v25, v30, v28 * 0.550000012 + v31);
      CGContextAddLineToPoint(v25, v30, v31 - v28 * 0.550000012);
      CGContextStrokePath(v25);
      CGContextMoveToPoint(v25, v30 - v29, v31);
      CGContextAddLineToPoint(v25, v29 + v30, v31);
      CGContextStrokePath(v25);
      Image = CGBitmapContextCreateImage(v25);
      if (v25) {
        CGContextRelease(v25);
      }
      id v14 = 0;
      goto LABEL_25;
    case 2:
      v41.origin.CGFloat y = v13 * 0.125;
      v41.size.double height = v13 * 0.75;
      v41.origin.CGFloat x = 0.0;
      v41.size.double width = (double)Width;
      id v14 = CGPathCreateWithRoundedRect(v41, v13 * 0.375, v13 * 0.375, 0);
      float v15 = self;
      double v16 = a3;
      id v17 = v14;
      int64_t v18 = 2;
      goto LABEL_23;
    case 3:
    case 6:
      v37.origin.CGFloat x = 0.0;
      v37.origin.CGFloat y = 0.0;
      v37.size.double width = (double)Width;
      v37.size.double height = (double)Height;
      id v14 = CGPathCreateWithRoundedRect(v37, v12 * 0.5, v13 * 0.5, 0);
      float v15 = self;
      double v16 = a3;
      id v17 = v14;
      int64_t v18 = a4;
      goto LABEL_23;
    case 4:
      BOOL v32 = [(AMSPaymentSheetRequest *)self isDesignVersionEqualOrGreaterThan:0x1EDD01660];
      double v33 = 0.236842105;
      if (v32) {
        double v33 = 0.185185185;
      }
      CGFloat v34 = v33 * v12;
      CGFloat v35 = v33 * v13;
      v42.origin.CGFloat x = 0.0;
      v42.origin.CGFloat y = 0.0;
      v42.size.double width = (double)Width;
      v42.size.double height = v13;
      id v14 = CGPathCreateWithRoundedRect(v42, v34, v35, 0);
      float v15 = self;
      double v16 = a3;
      id v17 = v14;
      int64_t v18 = 4;
      goto LABEL_23;
    case 5:
      v43.origin.CGFloat x = 0.0;
      v43.origin.CGFloat y = 0.0;
      v43.size.double width = (double)Width;
      v43.size.double height = (double)Height;
      id v14 = CGPathCreateWithRoundedRect(v43, v13 * 0.102564103, v13 * 0.102564103, 0);
      float v15 = self;
      double v16 = a3;
      id v17 = v14;
      int64_t v18 = 5;
LABEL_23:
      double v20 = [(AMSPaymentSheetRequest *)v15 _createMaskedImageRefForImageRef:v16 withPathRef:v17 adornmentStyle:v18 andDesignVersion:v8];
LABEL_24:
      Image = v20;
LABEL_25:
      CGPathRelease(v14);
      if (Image) {
        CGImageRelease(a3);
      }
      break;
    default:
      CGPathRelease(0);
      Image = 0;
      break;
  }

  return Image;
}

- (CGImage)_createMaskedImageRefForImageRef:(CGImage *)a3 withPathRef:(CGPath *)a4 adornmentStyle:(int64_t)a5 andDesignVersion:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  double v12 = (double)Width;
  double v13 = (double)Height;
  ColorSpace = CGImageGetColorSpace(a3);
  uint64_t Model = CGColorSpaceGetModel(ColorSpace);
  if (Model == 1)
  {
    CopCGFloat y = CGImageCreateCopy(a3);
    goto LABEL_5;
  }
  uint64_t v16 = Model;
  if (!Model)
  {
    CopCGFloat y = [(AMSPaymentSheetRequest *)self _createRGBImageRefForGreyScaleImageRef:a3 width:Width height:Height];
LABEL_5:
    int64_t v18 = Copy;
    goto LABEL_11;
  }
  double v19 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v19)
  {
    double v19 = +[AMSLogConfig sharedConfig];
  }
  double v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    CGRect v21 = objc_opt_class();
    id v22 = v21;
    id v23 = [(AMSPaymentSheetRequest *)self logKey];
    id v24 = [MEMORY[0x1E4F28ED0] numberWithInt:v16];
    *(_DWORD *)uint64_t v36 = 138543874;
    *(void *)&v36[4] = v21;
    *(_WORD *)&v36[12] = 2114;
    *(void *)&v36[14] = v23;
    *(_WORD *)&v36[22] = 2114;
    *(void *)&v36[24] = v24;
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Warning - Attempting to mask image with an unsupported color model: %{public}@", v36, 0x20u);
  }
  int64_t v18 = 0;
LABEL_11:
  uint64_t v25 = -[AMSPaymentSheetRequest _createImageMaskRefWithSize:andPath:](self, "_createImageMaskRefWithSize:andPath:", a4, v12, v13);
  float v26 = CGImageCreateWithMask(v18, v25);
  size_t v27 = CGImageGetWidth(v26);
  size_t v28 = CGImageGetHeight(v26);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(v26);
  size_t BytesPerRow = CGImageGetBytesPerRow(v26);
  CGFloat v31 = CGBitmapContextCreate(0, v27, v28, BitsPerComponent, BytesPerRow, ColorSpace, 1u);
  CGContextSetInterpolationQuality(v31, kCGInterpolationHigh);
  CGContextSetRGBFillColor(v31, 1.0, 0.0, 0.0, 0.0);
  v38.origin.CGFloat x = 0.0;
  v38.origin.CGFloat y = 0.0;
  v38.size.double width = v12;
  v38.size.double height = v13;
  CGContextFillRect(v31, v38);
  v39.origin.CGFloat x = 0.0;
  v39.origin.CGFloat y = 0.0;
  v39.size.double width = v12;
  v39.size.double height = v13;
  CGContextDrawImage(v31, v39, v26);
  BOOL v32 = [(AMSPaymentSheetRequest *)self _shouldDrawGrayBorderForMaskedImageWithDesignVersion:v9];

  if (a4 && v32)
  {
    *(_OWORD *)uint64_t v36 = xmmword_18DDF4C80;
    *(_OWORD *)&v36[16] = unk_18DDF4C90;
    double v33 = CGColorCreate(ColorSpace, (const CGFloat *)v36);
    CGContextSetStrokeColorWithColor(v31, v33);
    CGContextSetLineWidth(v31, 2.0);
    v40.origin.CGFloat x = 0.0;
    v40.origin.CGFloat y = 0.0;
    v40.size.double width = v12;
    v40.size.double height = v13;
    CGContextClipToMask(v31, v40, v25);
    CGContextAddPath(v31, a4);
    CGContextDrawPath(v31, kCGPathStroke);
    CGColorRelease(v33);
  }
  Image = CGBitmapContextCreateImage(v31);
  CGContextRelease(v31);
  CGImageRelease(v25);
  CGImageRelease(v26);
  CGImageRelease(v18);
  return Image;
}

- (CGImage)_createRatingImageWithStringValue:(id)a3 assetScale:(float *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  id v5 = +[AMSDevice screenScale];
  [v5 floatValue];
  float v7 = v6;

  *(_OWORD *)components = xmmword_18DDF4CA0;
  long long v28 = unk_18DDF4CB0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGColorRef v9 = CGColorCreate(DeviceRGB, components);
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontLabel, v7 * 9.0, 0);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F243F0], UIFontForLanguage);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F24740], v9);
  CFAttributedStringRef v12 = CFAttributedStringCreate(0, v4, Mutable);
  double v13 = CTFramesetterCreateWithAttributedString(v12);
  CFIndex v14 = [(__CFString *)v4 length];

  v31.float width = 1.79769313e308;
  v30.location = 0;
  v30.length = v14;
  v31.float height = 1.79769313e308;
  CGSize v15 = CTFramesetterSuggestFrameSizeWithConstraints(v13, v30, 0, v31, 0);
  float height = v15.height;
  CGFloat v17 = ceilf(height);
  float v18 = v17 * 0.352941176;
  float width = v15.width;
  double v20 = ceilf(width) + ceilf(v18) * 2.0;
  CGRect v21 = CGBitmapContextCreate(0, (unint64_t)v20, vcvtps_u32_f32(height), 8uLL, vcvtd_n_u64_f64(v20, 3uLL), DeviceRGB, 2u);
  CGContextSetShouldAntialias(v21, 1);
  CGContextSetInterpolationQuality(v21, kCGInterpolationHigh);
  v32.origin.CGFloat x = 0.0;
  v32.origin.CGFloat y = 0.0;
  v32.size.float width = v20;
  v32.size.float height = v17;
  CGRect v33 = CGRectInset(v32, 1.0, 1.0);
  id v22 = CGPathCreateWithRoundedRect(v33, 6.0, 6.0, 0);
  CGContextAddPath(v21, v22);
  CGContextSetStrokeColorWithColor(v21, v9);
  CGContextSetLineWidth(v21, 1.0);
  CGContextStrokePath(v21);
  id v23 = CTLineCreateWithAttributedString(v12);
  CGContextSetTextPosition(v21, v20 * 0.5 - v15.width * 0.5, v17 * 0.5 + v15.height * -0.25 + -1.0);
  CTLineDraw(v23, v21);
  Image = CGBitmapContextCreateImage(v21);
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v9);
  CGContextRelease(v21);
  CGPathRelease(v22);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (UIFontForLanguage) {
    CFRelease(UIFontForLanguage);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (a4) {
    *a4 = v7;
  }
  return Image;
}

- (CGImage)_createRGBImageRefForGreyScaleImageRef:(CGImage *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  CGFloat v7 = (double)a4;
  CGFloat v8 = (double)a5;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  CFAttributedStringRef v12 = CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * a4, DeviceRGB, 1u);
  CGContextSetInterpolationQuality(v12, kCGInterpolationHigh);
  CGContextSetRGBFillColor(v12, 0.0, 0.0, 0.0, 1.0);
  v15.origin.CGFloat x = 0.0;
  v15.origin.CGFloat y = 0.0;
  v15.size.float width = v7;
  v15.size.float height = v8;
  CGContextFillRect(v12, v15);
  v16.origin.CGFloat x = 0.0;
  v16.origin.CGFloat y = 0.0;
  v16.size.float width = v7;
  v16.size.float height = v8;
  CGContextDrawImage(v12, v16, a3);
  Image = CGBitmapContextCreateImage(v12);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v12);
  return Image;
}

- (BOOL)_shouldDrawGrayBorderForMaskedImageWithDesignVersion:(id)a3
{
  return 1;
}

- (AMSPaymentSheetRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSPaymentSheetRequest;
  int64_t v2 = [(AMSPaymentSheetRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = AMSSetLogKeyIfNeeded();
    logKeCGFloat y = v2->_logKey;
    v2->_logKeCGFloat y = (NSString *)v3;
  }
  return v2;
}

- (BOOL)requiresDelegateAuthentication
{
  int64_t v2 = [(AMSPaymentSheetRequest *)self delegateAuthenticateChallenge];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)isDesignVersionEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPaymentSheetRequest *)self designVersion];
  char v6 = [v5 isEqualToNumber:v4];

  return v6;
}

- (BOOL)isDesignVersionEqualOrGreaterThan:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPaymentSheetRequest *)self designVersion];

  if (v5)
  {
    char v6 = [(AMSPaymentSheetRequest *)self designVersion];
    uint64_t v7 = [v6 integerValue];
    BOOL v8 = v7 >= [v4 integerValue];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isDesignVersionLessThan:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPaymentSheetRequest *)self designVersion];

  if (v5)
  {
    char v6 = [(AMSPaymentSheetRequest *)self designVersion];
    uint64_t v7 = [v6 integerValue];
    BOOL v8 = v7 < [v4 integerValue];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v38 = a3;
  id v4 = [(AMSPaymentSheetRequest *)self account];
  [v38 encodeObject:v4 forKey:@"kAccount"];

  id v5 = [(AMSPaymentSheetRequest *)self accountHeader];
  [v38 encodeObject:v5 forKey:@"kAccountHeader"];

  objc_msgSend(v38, "encodeBool:forKey:", -[AMSPaymentSheetRequest isApplePayClassic](self, "isApplePayClassic"), @"kApplePayClassic");
  char v6 = [(AMSPaymentSheetRequest *)self attributedList];
  [v38 encodeObject:v6 forKey:@"kAttributedList"];

  uint64_t v7 = [(AMSPaymentSheetRequest *)self biometricsRequest];
  [v38 encodeObject:v7 forKey:@"kBiometricsRequest"];

  objc_msgSend(v38, "encodeInteger:forKey:", -[AMSPaymentSheetRequest confirmationTitle](self, "confirmationTitle"), @"kConfirmationTitle");
  BOOL v8 = [(AMSPaymentSheetRequest *)self countryCode];
  [v38 encodeObject:v8 forKey:@"kCountryCode"];

  CGColorRef v9 = [(AMSPaymentSheetRequest *)self currencyCode];
  [v38 encodeObject:v9 forKey:@"kCurrencyCode"];

  id v10 = [(AMSPaymentSheetRequest *)self delegateAuthenticateChallenge];
  [v38 encodeObject:v10 forKey:@"kDelegateAuthenticateChallenge"];

  size_t v11 = [(AMSPaymentSheetRequest *)self designVersion];
  [v38 encodeObject:v11 forKey:@"kDesignVersion"];

  CFAttributedStringRef v12 = [(AMSPaymentSheetRequest *)self displayPrice];
  [v38 encodeObject:v12 forKey:@"kDisplayPrice"];

  double v13 = [(AMSPaymentSheetRequest *)self explanation];
  [v38 encodeObject:v13 forKey:@"kExplanation"];

  CFIndex v14 = [(AMSPaymentSheetRequest *)self flexList];
  [v38 encodeObject:v14 forKey:@"kFlexList"];

  CGRect v15 = [(AMSPaymentSheetRequest *)self inlineImages];
  [v38 encodeObject:v15 forKey:@"kInlineImages"];

  CGRect v16 = [(AMSPaymentSheetRequest *)self logKey];
  [v38 encodeObject:v16 forKey:@"kLogKey"];

  CGFloat v17 = [(AMSPaymentSheetRequest *)self merchantSession];
  [v38 encodeObject:v17 forKey:@"kMerchantSession"];

  float v18 = [(AMSPaymentSheetRequest *)self message];
  [v38 encodeObject:v18 forKey:@"kMessage"];

  objc_msgSend(v38, "encodeInteger:forKey:", -[AMSPaymentSheetRequest payee](self, "payee"), @"kPayee");
  double v19 = [(AMSPaymentSheetRequest *)self paymentSession];
  [v38 encodeObject:v19 forKey:@"kPaymentSession"];

  double v20 = [(AMSPaymentSheetRequest *)self paymentSummary];
  [v38 encodeObject:v20 forKey:@"kPaymentSummary"];

  CGRect v21 = [(AMSPaymentSheetRequest *)self preSheetDialog];
  [v38 encodeObject:v21 forKey:@"kPreSheetDialog"];

  id v22 = [(AMSPaymentSheetRequest *)self price];
  [v38 encodeObject:v22 forKey:@"kPrice"];

  id v23 = [(AMSPaymentSheetRequest *)self priceSectionItems];
  [v38 encodeObject:v23 forKey:@"kPriceSectionItems"];

  id v24 = [(AMSPaymentSheetRequest *)self ratingHeader];
  [v38 encodeObject:v24 forKey:@"kRatingHeader"];

  uint64_t v25 = [(AMSPaymentSheetRequest *)self ratingValue];
  [v38 encodeObject:v25 forKey:@"kRatingValue"];

  objc_msgSend(v38, "encodeBool:forKey:", -[AMSPaymentSheetRequest requiresAuthorization](self, "requiresAuthorization"), @"kRequiresAuthorization");
  objc_msgSend(v38, "encodeInteger:forKey:", -[AMSPaymentSheetRequest salableIcon](self, "salableIcon"), @"kSalableIcon");
  float v26 = [(AMSPaymentSheetRequest *)self salableIconURL];
  [v38 encodeObject:v26 forKey:@"kSalableIconURL"];

  size_t v27 = [(AMSPaymentSheetRequest *)self salableInfo];
  [v38 encodeObject:v27 forKey:@"kSalableInfo"];

  long long v28 = [(AMSPaymentSheetRequest *)self salableInfoLabel];
  [v38 encodeObject:v28 forKey:@"kSalableInfoLabel"];

  uint64_t v29 = [(AMSPaymentSheetRequest *)self secondaryFlexList];
  [v38 encodeObject:v29 forKey:@"kSecondaryFlexList"];

  objc_msgSend(v38, "encodeInteger:forKey:", -[AMSPaymentSheetRequest secondarySalableIcon](self, "secondarySalableIcon"), @"kSecondarySalableIcon");
  CFRange v30 = [(AMSPaymentSheetRequest *)self secondarySalableIconURL];
  [v38 encodeObject:v30 forKey:@"kSecondarySalableIconURL"];

  CGSize v31 = [(AMSPaymentSheetRequest *)self secondarySalableInfo];
  [v38 encodeObject:v31 forKey:@"kSecondarySalableInfo"];

  CGRect v32 = [(AMSPaymentSheetRequest *)self secondarySalableInfoLabel];
  [v38 encodeObject:v32 forKey:@"kSecondarySalableInfoLabel"];

  CGRect v33 = [(AMSPaymentSheetRequest *)self selectedCard];
  [v38 encodeObject:v33 forKey:@"kSelectedCard"];

  objc_msgSend(v38, "encodeBool:forKey:", -[AMSPaymentSheetRequest shouldUppercaseText](self, "shouldUppercaseText"), @"kShouldUppercaseText");
  CGFloat v34 = [(AMSPaymentSheetRequest *)self storeName];
  [v38 encodeObject:v34 forKey:@"kStoreName"];

  CGFloat v35 = [(AMSPaymentSheetRequest *)self styles];
  [v38 encodeObject:v35 forKey:@"kStyles"];

  uint64_t v36 = [(AMSPaymentSheetRequest *)self title];
  [v38 encodeObject:v36 forKey:@"kTitle"];

  objc_msgSend(v38, "encodeInteger:forKey:", -[AMSPaymentSheetRequest titleType](self, "titleType"), @"kTitleType");
  uint64_t v37 = [(AMSPaymentSheetRequest *)self userAgent];
  [v38 encodeObject:v37 forKey:@"kUserAgent"];

  objc_msgSend(v38, "encodeBool:forKey:", -[AMSPaymentSheetRequest disablePasscodeFallback](self, "disablePasscodeFallback"), @"kDisablePasscodeFallback");
  objc_msgSend(v38, "encodeBool:forKey:", -[AMSPaymentSheetRequest drawBackground](self, "drawBackground"), @"kDrawBackground");
  objc_msgSend(v38, "encodeBool:forKey:", -[AMSPaymentSheetRequest drawBottomDivider](self, "drawBottomDivider"), @"kDrawBottomDivider");
}

- (AMSPaymentSheetRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v119.receiver = self;
  v119.super_class = (Class)AMSPaymentSheetRequest;
  id v5 = [(AMSPaymentSheetRequest *)&v119 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAccount"];
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAccountHeader"];
    accountHeader = v5->_accountHeader;
    v5->_accountHeader = (NSString *)v8;

    v5->_applePayClassic = [v4 decodeBoolForKey:@"kApplePayClassic"];
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    CFIndex v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"kAttributedList"];
    attributedList = v5->_attributedList;
    v5->_attributedList = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBiometricsRequest"];
    biometricsRequest = v5->_biometricsRequest;
    v5->_biometricsRequest = (AMSBiometricsSignatureRequest *)v17;

    v5->_confirmationTitle = [v4 decodeIntegerForKey:@"kConfirmationTitle"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCountryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCurrencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDelegateAuthenticateChallenge"];
    delegateAuthenticateChallenge = v5->_delegateAuthenticateChallenge;
    v5->_delegateAuthenticateChallenge = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDesignVersion"];
    designVersion = v5->_designVersion;
    v5->_designVersion = (NSNumber *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDisplayPrice"];
    displayPrice = v5->_displayPrice;
    v5->_displayPrice = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kExplanation"];
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v29;

    CGSize v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    CGFloat v35 = objc_msgSend(v31, "setWithObjects:", v32, v33, v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"kFlexList"];
    flexList = v5->_flexList;
    v5->_flexList = (NSArray *)v36;

    id v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    CGRect v41 = objc_msgSend(v38, "setWithObjects:", v39, v40, objc_opt_class(), 0);
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"kInlineImages"];
    inlineImages = v5->_inlineImages;
    v5->_inlineImages = (NSArray *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLogKey"];
    logKeCGFloat y = v5->_logKey;
    v5->_logKeCGFloat y = (NSString *)v44;

    id v46 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v47 = objc_opt_class();
    id v48 = objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
    uint64_t v49 = [v4 decodeObjectOfClasses:v48 forKey:@"kMerchantSession"];
    merchantSession = v5->_merchantSession;
    v5->_merchantSession = (NSDictionary *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMessage"];
    message = v5->_message;
    v5->_message = (NSString *)v51;

    v5->_payee = [v4 decodeIntegerForKey:@"kPayee"];
    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPaymentSession"];
    paymentSession = v5->_paymentSession;
    v5->_paymentSession = (NSString *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPaymentSummary"];
    paymentSummarCGFloat y = v5->_paymentSummary;
    v5->_paymentSummarCGFloat y = (NSString *)v55;

    v57 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v58 = objc_opt_class();
    uint64_t v59 = objc_opt_class();
    uint64_t v60 = objc_opt_class();
    v61 = objc_msgSend(v57, "setWithObjects:", v58, v59, v60, objc_opt_class(), 0);
    uint64_t v62 = [v4 decodeObjectOfClasses:v61 forKey:@"kPreSheetDialog"];
    preSheetDialog = v5->_preSheetDialog;
    v5->_preSheetDialog = (NSArray *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPrice"];
    price = v5->_price;
    v5->_price = (NSNumber *)v64;

    v66 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v67 = objc_opt_class();
    v68 = objc_msgSend(v66, "setWithObjects:", v67, objc_opt_class(), 0);
    uint64_t v69 = [v4 decodeObjectOfClasses:v68 forKey:@"kPriceSectionItems"];
    priceSectionItems = v5->_priceSectionItems;
    v5->_priceSectionItems = (NSArray *)v69;

    uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRatingHeader"];
    ratingHeader = v5->_ratingHeader;
    v5->_ratingHeader = (NSString *)v71;

    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRatingValue"];
    ratingValue = v5->_ratingValue;
    v5->_ratingValue = (NSString *)v73;

    v5->_requiresAuthorization = [v4 decodeBoolForKey:@"kRequiresAuthorization"];
    v5->_salableIcon = [v4 decodeIntegerForKey:@"kSalableIcon"];
    uint64_t v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSalableIconURL"];
    salableIconURL = v5->_salableIconURL;
    v5->_salableIconURL = (NSURL *)v75;

    v77 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v78 = objc_opt_class();
    uint64_t v79 = objc_opt_class();
    uint64_t v80 = objc_opt_class();
    v81 = objc_msgSend(v77, "setWithObjects:", v78, v79, v80, objc_opt_class(), 0);
    uint64_t v82 = [v4 decodeObjectOfClasses:v81 forKey:@"kSalableInfo"];
    salableInfo = v5->_salableInfo;
    v5->_salableInfo = (NSArray *)v82;

    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSalableInfoLabel"];
    salableInfoLabel = v5->_salableInfoLabel;
    v5->_salableInfoLabel = (NSAttributedString *)v84;

    v86 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v87 = objc_opt_class();
    uint64_t v88 = objc_opt_class();
    uint64_t v89 = objc_opt_class();
    v90 = objc_msgSend(v86, "setWithObjects:", v87, v88, v89, objc_opt_class(), 0);
    uint64_t v91 = [v4 decodeObjectOfClasses:v90 forKey:@"kSecondaryFlexList"];
    secondaryFlexList = v5->_secondaryFlexList;
    v5->_secondaryFlexList = (NSArray *)v91;

    v5->_secondarySalableIcon = [v4 decodeIntegerForKey:@"kSecondarySalableIcon"];
    uint64_t v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSecondarySalableIconURL"];
    secondarySalableIconURL = v5->_secondarySalableIconURL;
    v5->_secondarySalableIconURL = (NSURL *)v93;

    id v95 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v96 = objc_opt_class();
    uint64_t v97 = objc_opt_class();
    uint64_t v98 = objc_opt_class();
    v99 = objc_msgSend(v95, "setWithObjects:", v96, v97, v98, objc_opt_class(), 0);
    uint64_t v100 = [v4 decodeObjectOfClasses:v99 forKey:@"kSecondarySalableInfo"];
    secondarySalableInfo = v5->_secondarySalableInfo;
    v5->_secondarySalableInfo = (NSArray *)v100;

    uint64_t v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSecondarySalableInfoLabel"];
    secondarySalableInfoLabel = v5->_secondarySalableInfoLabel;
    v5->_secondarySalableInfoLabel = (NSAttributedString *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSelectedCard"];
    selectedCard = v5->_selectedCard;
    v5->_selectedCard = (AMSCardSingleSelection *)v104;

    v5->_shouldUppercaseText = [v4 decodeBoolForKey:@"kShouldUppercaseText"];
    uint64_t v106 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kStoreName"];
    storeName = v5->_storeName;
    v5->_storeName = (NSString *)v106;

    id v108 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v109 = objc_opt_class();
    uint64_t v110 = objc_opt_class();
    uint64_t v111 = objc_msgSend(v108, "setWithObjects:", v109, v110, objc_opt_class(), 0);
    uint64_t v112 = [v4 decodeObjectOfClasses:v111 forKey:@"kStyles"];
    styles = v5->_styles;
    v5->_styles = (NSArray *)v112;

    uint64_t v114 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v114;

    v5->_titleType = [v4 decodeIntegerForKey:@"kTitleType"];
    uint64_t v116 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUserAgent"];
    userAgent = v5->_userAgent;
    v5->_userAgent = (NSString *)v116;

    v5->_disablePasscodeFallback = [v4 decodeBoolForKey:@"kDisablePasscodeFallback"];
    v5->_drawBackground = [v4 decodeBoolForKey:@"kDrawBackground"];
    v5->_drawBottomDivider = [v4 decodeBoolForKey:@"kDrawBottomDivider"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)accountHeader
{
  return self->_accountHeader;
}

- (void)setAccountHeader:(id)a3
{
}

- (BOOL)isApplePayClassic
{
  return self->_applePayClassic;
}

- (void)setApplePayClassic:(BOOL)a3
{
  self->_applePayClassic = a3;
}

- (NSArray)attributedList
{
  return self->_attributedList;
}

- (void)setAttributedList:(id)a3
{
}

- (AMSBiometricsSignatureRequest)biometricsRequest
{
  return self->_biometricsRequest;
}

- (void)setBiometricsRequest:(id)a3
{
}

- (int64_t)confirmationTitle
{
  return self->_confirmationTitle;
}

- (void)setConfirmationTitle:(int64_t)a3
{
  self->_confirmationTitle = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSString)delegateAuthenticateChallenge
{
  return self->_delegateAuthenticateChallenge;
}

- (void)setDelegateAuthenticateChallenge:(id)a3
{
}

- (NSNumber)designVersion
{
  return self->_designVersion;
}

- (void)setDesignVersion:(id)a3
{
}

- (NSString)displayPrice
{
  return self->_displayPrice;
}

- (void)setDisplayPrice:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (NSArray)flexList
{
  return self->_flexList;
}

- (void)setFlexList:(id)a3
{
}

- (NSArray)inlineImages
{
  return self->_inlineImages;
}

- (void)setInlineImages:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (NSDictionary)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int64_t)payee
{
  return self->_payee;
}

- (void)setPayee:(int64_t)a3
{
  self->_payee = a3;
}

- (NSString)paymentSession
{
  return self->_paymentSession;
}

- (void)setPaymentSession:(id)a3
{
}

- (NSString)paymentSummary
{
  return self->_paymentSummary;
}

- (void)setPaymentSummary:(id)a3
{
}

- (NSArray)preSheetDialog
{
  return self->_preSheetDialog;
}

- (void)setPreSheetDialog:(id)a3
{
}

- (NSNumber)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (NSArray)priceSectionItems
{
  return self->_priceSectionItems;
}

- (void)setPriceSectionItems:(id)a3
{
}

- (NSString)ratingHeader
{
  return self->_ratingHeader;
}

- (void)setRatingHeader:(id)a3
{
}

- (NSString)ratingValue
{
  return self->_ratingValue;
}

- (void)setRatingValue:(id)a3
{
}

- (BOOL)requiresAuthorization
{
  return self->_requiresAuthorization;
}

- (void)setRequiresAuthorization:(BOOL)a3
{
  self->_requiresAuthorization = a3;
}

- (int64_t)salableIcon
{
  return self->_salableIcon;
}

- (void)setSalableIcon:(int64_t)a3
{
  self->_salableIcon = a3;
}

- (NSURL)salableIconURL
{
  return self->_salableIconURL;
}

- (void)setSalableIconURL:(id)a3
{
}

- (NSArray)salableInfo
{
  return self->_salableInfo;
}

- (void)setSalableInfo:(id)a3
{
}

- (NSAttributedString)salableInfoLabel
{
  return self->_salableInfoLabel;
}

- (void)setSalableInfoLabel:(id)a3
{
}

- (NSArray)secondaryFlexList
{
  return self->_secondaryFlexList;
}

- (void)setSecondaryFlexList:(id)a3
{
}

- (int64_t)secondarySalableIcon
{
  return self->_secondarySalableIcon;
}

- (void)setSecondarySalableIcon:(int64_t)a3
{
  self->_secondarySalableIcon = a3;
}

- (NSURL)secondarySalableIconURL
{
  return self->_secondarySalableIconURL;
}

- (void)setSecondarySalableIconURL:(id)a3
{
}

- (NSArray)secondarySalableInfo
{
  return self->_secondarySalableInfo;
}

- (void)setSecondarySalableInfo:(id)a3
{
}

- (NSAttributedString)secondarySalableInfoLabel
{
  return self->_secondarySalableInfoLabel;
}

- (void)setSecondarySalableInfoLabel:(id)a3
{
}

- (AMSCardSingleSelection)selectedCard
{
  return self->_selectedCard;
}

- (void)setSelectedCard:(id)a3
{
}

- (BOOL)shouldUppercaseText
{
  return self->_shouldUppercaseText;
}

- (void)setShouldUppercaseText:(BOOL)a3
{
  self->_shouldUppercaseText = a3;
}

- (NSString)storeName
{
  return self->_storeName;
}

- (void)setStoreName:(id)a3
{
}

- (NSArray)styles
{
  return self->_styles;
}

- (void)setStyles:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)titleType
{
  return self->_titleType;
}

- (void)setTitleType:(int64_t)a3
{
  self->_titleType = a3;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (BOOL)disablePasscodeFallback
{
  return self->_disablePasscodeFallback;
}

- (void)setDisablePasscodeFallback:(BOOL)a3
{
  self->_disablePasscodeFallback = a3;
}

- (BOOL)drawBackground
{
  return self->_drawBackground;
}

- (void)setDrawBackground:(BOOL)a3
{
  self->_drawBackground = a3;
}

- (BOOL)drawBottomDivider
{
  return self->_drawBottomDivider;
}

- (void)setDrawBottomDivider:(BOOL)a3
{
  self->_drawBottomDivider = a3;
}

- (BOOL)isDelegateAuthentication
{
  return self->_isDelegateAuthentication;
}

- (void)setIsDelegateAuthentication:(BOOL)a3
{
  self->_isDelegateAuthentication = a3;
}

- (AMSPaymentSheetPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_selectedCard, 0);
  objc_storeStrong((id *)&self->_secondarySalableInfoLabel, 0);
  objc_storeStrong((id *)&self->_secondarySalableInfo, 0);
  objc_storeStrong((id *)&self->_secondarySalableIconURL, 0);
  objc_storeStrong((id *)&self->_secondaryFlexList, 0);
  objc_storeStrong((id *)&self->_salableInfoLabel, 0);
  objc_storeStrong((id *)&self->_salableInfo, 0);
  objc_storeStrong((id *)&self->_salableIconURL, 0);
  objc_storeStrong((id *)&self->_ratingValue, 0);
  objc_storeStrong((id *)&self->_ratingHeader, 0);
  objc_storeStrong((id *)&self->_priceSectionItems, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_preSheetDialog, 0);
  objc_storeStrong((id *)&self->_paymentSummary, 0);
  objc_storeStrong((id *)&self->_paymentSession, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_inlineImages, 0);
  objc_storeStrong((id *)&self->_flexList, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_displayPrice, 0);
  objc_storeStrong((id *)&self->_designVersion, 0);
  objc_storeStrong((id *)&self->_delegateAuthenticateChallenge, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_biometricsRequest, 0);
  objc_storeStrong((id *)&self->_attributedList, 0);
  objc_storeStrong((id *)&self->_accountHeader, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (id)paymentSheetRequestFromDictionary:(id)a3 account:(id)a4
{
  return +[AMSFinancePaymentSheetResponse createRequestFromDictionary:a3 confirmationOnly:0 delegateAuthenticationRequired:0 biometricSignatureRequired:0 authenticateResponse:0 taskInfo:0 account:a4];
}

@end