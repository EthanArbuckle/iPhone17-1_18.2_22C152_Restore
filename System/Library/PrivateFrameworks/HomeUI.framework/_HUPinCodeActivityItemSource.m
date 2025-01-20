@interface _HUPinCodeActivityItemSource
- (HFPinCodeItem)pinCodeItem;
- (_HUPinCodeActivityItemSource)initWithPinCodeItem:(id)a3;
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setPinCodeItem:(id)a3;
@end

@implementation _HUPinCodeActivityItemSource

- (_HUPinCodeActivityItemSource)initWithPinCodeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HUPinCodeActivityItemSource;
  v6 = [(_HUPinCodeActivityItemSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pinCodeItem, a3);
  }

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1F18F92B8;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  v4 = [(_HUPinCodeActivityItemSource *)self pinCodeItem];
  id v5 = [v4 pinCodeValue];
  v12 = HULocalizedStringWithFormat(@"HUPinCodeShareFormatString", @"%@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  return v12;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  v4 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438B8] scale:3];
  id v5 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"number.square.fill"];
  uint64_t v6 = [v5 imageWithConfiguration:v4];
  uint64_t v7 = [v6 imageWithRenderingMode:2];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v7];
  uint64_t v9 = [(_HUPinCodeActivityItemSource *)self pinCodeItem];
  uint64_t v10 = [v9 latestResults];
  uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v12 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  [v12 setTitle:v11];
  v13 = _HULocalizedStringWithDefaultValue(@"HUPinCodeValueCellTitle", @"HUPinCodeValueCellTitle", 1);
  [v12 setSummary:v13];

  [v12 setIcon:v8];

  return v12;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  v4 = [(_HUPinCodeActivityItemSource *)self pinCodeItem];
  id v5 = [v4 latestResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  if (v6) {
    HULocalizedStringWithFormat(@"HUPinCodeShareAirDropFilename", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  }
  else {
  v13 = _HULocalizedStringWithDefaultValue(@"HUPinCodeShareAirDropUnknownGuestFilename", @"HUPinCodeShareAirDropUnknownGuestFilename", 1);
  }
  v14 = [v13 stringByAppendingPathExtension:@"txt"];

  return v14;
}

- (HFPinCodeItem)pinCodeItem
{
  return self->_pinCodeItem;
}

- (void)setPinCodeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end