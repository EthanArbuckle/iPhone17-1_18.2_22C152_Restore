@interface PUPhotoPickerRemoteViewControllerRequestOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsMultipleSelection;
- (BOOL)convertAutoloopsToGIF;
- (BOOL)onboardingHeaderDismissedBefore;
- (BOOL)requiresPickingConfirmation;
- (BOOL)showsFileSizePicker;
- (BOOL)showsPrompt;
- (NSArray)mediaTypes;
- (NSDictionary)photoPickerProperties;
- (NSString)requestedClassName;
- (NSUUID)requestedIdentifier;
- (PUPhotoPickerRemoteViewControllerRequestOptions)initWithCoder:(id)a3;
- (PUPhotoPickerRemoteViewControllerRequestOptions)initWithRequestedClassName:(id)a3 photoPickerProperties:(id)a4;
- (PUPhotoPickerRemoteViewControllerRequestOptions)initWithRequestedIdentifier:(id)a3 photoPickerProperties:(id)a4;
- (id)description;
- (int64_t)modalPresentationStyle;
- (int64_t)sourceType;
- (unint64_t)multipleSelectionLimit;
- (unint64_t)savingOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setPhotoPickerProperties:(id)a3;
- (void)setRequestedClassName:(id)a3;
- (void)setRequestedIdentifier:(id)a3;
@end

@implementation PUPhotoPickerRemoteViewControllerRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoPickerProperties, 0);
  objc_storeStrong((id *)&self->_requestedClassName, 0);

  objc_storeStrong((id *)&self->_requestedIdentifier, 0);
}

- (void)setPhotoPickerProperties:(id)a3
{
}

- (NSDictionary)photoPickerProperties
{
  return self->_photoPickerProperties;
}

- (BOOL)onboardingHeaderDismissedBefore
{
  return self->_onboardingHeaderDismissedBefore;
}

- (void)setRequestedClassName:(id)a3
{
}

- (NSString)requestedClassName
{
  return self->_requestedClassName;
}

- (void)setRequestedIdentifier:(id)a3
{
}

- (NSUUID)requestedIdentifier
{
  return self->_requestedIdentifier;
}

- (int64_t)sourceType
{
  v2 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self photoPickerProperties];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F83D78]];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)modalPresentationStyle
{
  v2 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self photoPickerProperties];
  v3 = [v2 objectForKeyedSubscript:@"_UIImagePickerControllerModalPresentationStyle"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)convertAutoloopsToGIF
{
  v2 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self photoPickerProperties];
  v3 = [v2 objectForKey:@"_UIImagePickerControllerConvertAutoloopsToGIF"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (BOOL)showsPrompt
{
  v2 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self photoPickerProperties];
  v3 = [v2 objectForKey:*MEMORY[0x263F83D70]];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (BOOL)showsFileSizePicker
{
  v2 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self photoPickerProperties];
  v3 = [v2 objectForKeyedSubscript:@"_UIImagePickerControllerShowsFileSizePicker"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (BOOL)requiresPickingConfirmation
{
  if ([(PUPhotoPickerRemoteViewControllerRequestOptions *)self showsFileSizePicker]) {
    return 1;
  }
  int64_t v4 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self photoPickerProperties];
  v5 = [v4 objectForKeyedSubscript:@"_UIImagePickerControllerRequiresPickingConfirmation"];

  LOBYTE(v4) = [v5 BOOLValue];
  return (char)v4;
}

- (unint64_t)multipleSelectionLimit
{
  v2 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self photoPickerProperties];
  v3 = [v2 objectForKey:*MEMORY[0x263F83D48]];

  unint64_t v4 = [v3 unsignedIntegerValue];
  return v4;
}

- (BOOL)allowsMultipleSelection
{
  v2 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self photoPickerProperties];
  v3 = [v2 objectForKey:*MEMORY[0x263F83CD0]];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (NSArray)mediaTypes
{
  v2 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self photoPickerProperties];
  v3 = [v2 objectForKey:*MEMORY[0x263F83D40]];

  return (NSArray *)v3;
}

- (unint64_t)savingOptions
{
  v2 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self photoPickerProperties];
  v3 = [v2 objectForKey:*MEMORY[0x263F83DA8]];

  unint64_t v4 = [v3 integerValue];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  requestedIdentifier = self->_requestedIdentifier;
  id v5 = a3;
  [v5 encodeObject:requestedIdentifier forKey:@"requestedIdentifier"];
  [v5 encodeObject:self->_requestedClassName forKey:@"requestedClassName"];
  [v5 encodeObject:self->_photoPickerProperties forKey:@"photoPickerProperties"];
  [v5 encodeBool:self->_onboardingHeaderDismissedBefore forKey:@"onboardingHeader"];
}

- (PUPhotoPickerRemoteViewControllerRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUPhotoPickerRemoteViewControllerRequestOptions;
  id v5 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedIdentifier"];
    requestedIdentifier = v5->_requestedIdentifier;
    v5->_requestedIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedClassName"];
    requestedClassName = v5->_requestedClassName;
    v5->_requestedClassName = (NSString *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"photoPickerProperties"];
    photoPickerProperties = v5->_photoPickerProperties;
    v5->_photoPickerProperties = (NSDictionary *)v16;

    v5->_onboardingHeaderDismissedBefore = [v4 decodeBoolForKey:@"onboardingHeader"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self requestedClassName];
  v7 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)self requestedIdentifier];
  uint64_t v8 = [v3 stringWithFormat:@"%@ requestedClassName %@ requestedIdentifier %@", v5, v6, v7];

  return v8;
}

- (PUPhotoPickerRemoteViewControllerRequestOptions)initWithRequestedIdentifier:(id)a3 photoPickerProperties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUPhotoPickerRemoteViewControllerRequestOptions;
  v9 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestedIdentifier, a3);
    objc_storeStrong((id *)&v10->_photoPickerProperties, a4);
    uint64_t v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v10->_onboardingHeaderDismissedBefore = [v11 BOOLForKey:@"com.apple.photos.picker.header"];
  }
  return v10;
}

- (PUPhotoPickerRemoteViewControllerRequestOptions)initWithRequestedClassName:(id)a3 photoPickerProperties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUPhotoPickerRemoteViewControllerRequestOptions;
  v9 = [(PUPhotoPickerRemoteViewControllerRequestOptions *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestedClassName, a3);
    objc_storeStrong((id *)&v10->_photoPickerProperties, a4);
    uint64_t v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v10->_onboardingHeaderDismissedBefore = [v11 BOOLForKey:@"com.apple.photos.picker.header"];
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end