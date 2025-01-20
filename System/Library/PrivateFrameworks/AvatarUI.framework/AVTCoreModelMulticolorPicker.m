@interface AVTCoreModelMulticolorPicker
- (AVTCoreModelMulticolorAuxiliaryPicker)auxiliaryPicker;
- (AVTCoreModelMulticolorPicker)initWithIdentifier:(id)a3 title:(id)a4 subpickers:(id)a5 subtitles:(id)a6 nestedPresetPickers:(id)a7 auxiliaryPicker:(id)a8 initialState:(int64_t)a9 allowsRemoval:(BOOL)a10 options:(id)a11;
- (AVTCoreModelMulticolorPicker)initWithTitle:(id)a3 subpickers:(id)a4 subtitles:(id)a5 nestedPresetPickers:(id)a6 auxiliaryPicker:(id)a7 initialState:(int64_t)a8 allowsRemoval:(BOOL)a9 options:(id)a10;
- (AVTCoreModelPairing)pairing;
- (AVTCoreModelPickerOptions)options;
- (BOOL)allowsRemoval;
- (NSArray)subpickers;
- (NSArray)subtitles;
- (NSDictionary)nestedPresetPickers;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
- (int64_t)initialState;
@end

@implementation AVTCoreModelMulticolorPicker

- (AVTCoreModelMulticolorPicker)initWithTitle:(id)a3 subpickers:(id)a4 subtitles:(id)a5 nestedPresetPickers:(id)a6 auxiliaryPicker:(id)a7 initialState:(int64_t)a8 allowsRemoval:(BOOL)a9 options:(id)a10
{
  v16 = (void *)MEMORY[0x263F08C38];
  id v17 = a10;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [v16 UUID];
  v24 = [v23 UUIDString];
  LOBYTE(v27) = a9;
  v25 = [(AVTCoreModelMulticolorPicker *)self initWithIdentifier:v24 title:v22 subpickers:v21 subtitles:v20 nestedPresetPickers:v19 auxiliaryPicker:v18 initialState:a8 allowsRemoval:v27 options:v17];

  return v25;
}

- (AVTCoreModelMulticolorPicker)initWithIdentifier:(id)a3 title:(id)a4 subpickers:(id)a5 subtitles:(id)a6 nestedPresetPickers:(id)a7 auxiliaryPicker:(id)a8 initialState:(int64_t)a9 allowsRemoval:(BOOL)a10 options:(id)a11
{
  id v29 = a3;
  id v17 = a4;
  id v18 = a5;
  id v28 = a6;
  id v27 = a7;
  id v19 = a8;
  id v20 = a11;
  v30.receiver = self;
  v30.super_class = (Class)AVTCoreModelMulticolorPicker;
  id v21 = [(AVTCoreModelMulticolorPicker *)&v30 init];
  if (v21)
  {
    uint64_t v22 = [v29 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    title = v21->_title;
    v21->_title = (NSString *)v24;

    objc_storeStrong((id *)&v21->_options, a11);
    objc_storeStrong((id *)&v21->_subpickers, a5);
    objc_storeStrong((id *)&v21->_subtitles, a6);
    objc_storeStrong((id *)&v21->_nestedPresetPickers, a7);
    objc_storeStrong((id *)&v21->_auxiliaryPicker, a8);
    v21->_initialState = a9;
    v21->_allowsRemoval = a10;
  }

  return v21;
}

- (NSString)description
{
  v16.receiver = self;
  v16.super_class = (Class)AVTCoreModelMulticolorPicker;
  v3 = [(AVTCoreModelMulticolorPicker *)&v16 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTCoreModelMulticolorPicker *)self identifier];
  [v4 appendFormat:@" identifier: %@", v5];

  v6 = [(AVTCoreModelMulticolorPicker *)self title];
  [v4 appendFormat:@" title: %@", v6];

  v7 = [(AVTCoreModelMulticolorPicker *)self subpickers];
  v8 = objc_msgSend(v7, "avt_description");
  [v4 appendFormat:@" subpickers: %@", v8];

  v9 = [(AVTCoreModelMulticolorPicker *)self subtitles];
  v10 = objc_msgSend(v9, "avt_description");
  [v4 appendFormat:@" subtitles: %@", v10];

  v11 = [(AVTCoreModelMulticolorPicker *)self nestedPresetPickers];
  [v4 appendFormat:@" nestedPresetPickers: %@", v11];

  v12 = [(AVTCoreModelMulticolorPicker *)self auxiliaryPicker];
  [v4 appendFormat:@" auxiliaryPicker: %@", v12];

  objc_msgSend(v4, "appendFormat:", @" initialState: %lu", -[AVTCoreModelMulticolorPicker initialState](self, "initialState"));
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[AVTCoreModelMulticolorPicker allowsRemoval](self, "allowsRemoval"));
  [v4 appendFormat:@" allowsRemoval: %@", v13];

  v14 = (void *)[v4 copy];
  return (NSString *)v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (AVTCoreModelPickerOptions)options
{
  return self->_options;
}

- (AVTCoreModelPairing)pairing
{
  return self->_pairing;
}

- (AVTCoreModelMulticolorAuxiliaryPicker)auxiliaryPicker
{
  return self->_auxiliaryPicker;
}

- (NSArray)subpickers
{
  return self->_subpickers;
}

- (NSArray)subtitles
{
  return self->_subtitles;
}

- (NSDictionary)nestedPresetPickers
{
  return self->_nestedPresetPickers;
}

- (int64_t)initialState
{
  return self->_initialState;
}

- (BOOL)allowsRemoval
{
  return self->_allowsRemoval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedPresetPickers, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_subpickers, 0);
  objc_storeStrong((id *)&self->_auxiliaryPicker, 0);
  objc_storeStrong((id *)&self->_pairing, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end