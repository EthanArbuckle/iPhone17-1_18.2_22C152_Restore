@interface HMCharacteristic(HFActionSuggestions)
+ (id)hf_suggestionVendorForCharacteristicType:()HFActionSuggestions;
@end

@implementation HMCharacteristic(HFActionSuggestions)

+ (id)hf_suggestionVendorForCharacteristicType:()HFActionSuggestions
{
  id v3 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke;
  v8[3] = &unk_264091718;
  id v9 = v3;
  id v4 = v3;
  v5 = __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke((uint64_t)v8);
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

@end