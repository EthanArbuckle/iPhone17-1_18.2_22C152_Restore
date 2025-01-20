@interface CNContactImageManagedObject
+ (id)managedObjectToContactImageTransform;
- (void)setupWithContactImage:(id)a3 contactIdentifier:(id)a4;
- (void)setupWithContactImage:(id)a3 pairedPoster:(id)a4 contactIdentifier:(id)a5;
- (void)updateWithContactImage:(id)a3;
- (void)updateWithContactImage:(id)a3 pairedPoster:(id)a4;
@end

@implementation CNContactImageManagedObject

- (void)updateWithContactImage:(id)a3
{
  id v4 = a3;
  v5 = [v4 imageData];
  [(CNContactImageManagedObject *)self setImageData:v5];

  v6 = [v4 lastUsedDate];
  [(CNContactImageManagedObject *)self setLastUsedDate:v6];

  [v4 cropRect];
  v7 = -[CNContactImageManagedObject cropRectStringFromCGRect:](self, "cropRectStringFromCGRect:");
  [(CNContactImageManagedObject *)self setCropRectString:v7];

  v8 = [v4 displayString];
  [(CNContactImageManagedObject *)self setDisplayString:v8];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "source"));
  [(CNContactImageManagedObject *)self setSource:v9];

  v10 = [v4 sourceIdentifier];
  [(CNContactImageManagedObject *)self setSourceIdentifier:v10];

  v11 = [v4 variant];
  [(CNContactImageManagedObject *)self setVariant:v11];

  v12 = [v4 poseConfigurationData];
  [(CNContactImageManagedObject *)self setPoseConfigurationData:v12];

  -[CNContactImageManagedObject setIgnoredForRevert:](self, "setIgnoredForRevert:", [v4 ignoredForRevert]);
  id v14 = [v4 visualFingerprint];

  v13 = +[CNVisualFingerprint archiveWithFingerprint:v14];
  [(CNContactImageManagedObject *)self setVisualFingerprintData:v13];
}

- (void)updateWithContactImage:(id)a3 pairedPoster:(id)a4
{
  id v17 = a4;
  id v6 = a3;
  v7 = [v6 imageData];
  [(CNContactImageManagedObject *)self setImageData:v7];

  v8 = [v6 lastUsedDate];
  [(CNContactImageManagedObject *)self setLastUsedDate:v8];

  [v6 cropRect];
  v9 = -[CNContactImageManagedObject cropRectStringFromCGRect:](self, "cropRectStringFromCGRect:");
  [(CNContactImageManagedObject *)self setCropRectString:v9];

  v10 = [v6 displayString];
  [(CNContactImageManagedObject *)self setDisplayString:v10];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "source"));
  [(CNContactImageManagedObject *)self setSource:v11];

  v12 = [v6 sourceIdentifier];
  [(CNContactImageManagedObject *)self setSourceIdentifier:v12];

  v13 = [v6 variant];
  [(CNContactImageManagedObject *)self setVariant:v13];

  id v14 = [v6 poseConfigurationData];
  [(CNContactImageManagedObject *)self setPoseConfigurationData:v14];

  -[CNContactImageManagedObject setIgnoredForRevert:](self, "setIgnoredForRevert:", [v6 ignoredForRevert]);
  v15 = [v6 visualFingerprint];

  v16 = +[CNVisualFingerprint archiveWithFingerprint:v15];
  [(CNContactImageManagedObject *)self setVisualFingerprintData:v16];

  [(CNContactImageManagedObject *)self setPairedPoster:v17];
}

- (void)setupWithContactImage:(id)a3 contactIdentifier:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = [v8 identifier];
  id v11 = (id)[v9 initWithUUIDString:v10];

  [(CNContactImageManagedObject *)self setIdentifier:v11];
  [(CNContactImageManagedObject *)self setContactIdentifier:v7];

  [(CNContactImageManagedObject *)self updateWithContactImage:v8];
}

- (void)setupWithContactImage:(id)a3 pairedPoster:(id)a4 contactIdentifier:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  v13 = [v11 identifier];
  id v14 = (id)[v12 initWithUUIDString:v13];

  [(CNContactImageManagedObject *)self setIdentifier:v14];
  [(CNContactImageManagedObject *)self setContactIdentifier:v9];

  [(CNContactImageManagedObject *)self updateWithContactImage:v11 pairedPoster:v10];
}

+ (id)managedObjectToContactImageTransform
{
  v2 = (void *)[&__block_literal_global_31 copy];

  return v2;
}

CNContactImage *__67__CNContactImageManagedObject_managedObjectToContactImageTransform__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 cropRectString];
  NSRect v35 = NSRectFromString(v3);
  double x = v35.origin.x;
  double y = v35.origin.y;
  double width = v35.size.width;
  double height = v35.size.height;

  id v8 = [CNContactImage alloc];
  id v9 = [v2 identifier];
  id v10 = [v9 UUIDString];
  id v11 = [v2 imageData];
  id v12 = [v2 lastUsedDate];
  v13 = -[CNContactImage initWithIdentifier:imageData:cropRect:lastUsedDate:](v8, "initWithIdentifier:imageData:cropRect:lastUsedDate:", v10, v11, v12, x, y, width, height);

  id v14 = [v2 source];
  -[CNContactImage setSource:](v13, "setSource:", [v14 integerValue]);

  v15 = [v2 sourceIdentifier];
  [(CNContactImage *)v13 setSourceIdentifier:v15];

  v16 = [v2 variant];
  [(CNContactImage *)v13 setVariant:v16];

  id v17 = [v2 displayString];
  [(CNContactImage *)v13 setDisplayString:v17];

  v18 = [v2 poseConfigurationData];
  [(CNContactImage *)v13 setPoseConfigurationData:v18];

  -[CNContactImage setIgnoredForRevert:](v13, "setIgnoredForRevert:", [v2 ignoredForRevert]);
  v19 = [v2 visualFingerprintData];
  v20 = +[CNVisualFingerprint fingerprintFromArchive:v19];
  [(CNContactImage *)v13 setVisualFingerprint:v20];

  v21 = [CNContactPoster alloc];
  v22 = [v2 pairedPoster];
  v23 = [v22 identifier];
  v24 = [v23 UUIDString];
  v25 = [v2 pairedPoster];
  v26 = [v25 posterData];
  v27 = [v2 pairedPoster];
  v28 = [v27 lastUsedDate];
  v29 = [(CNContactPoster *)v21 initWithIdentifier:v24 posterData:v26 lastUsedDate:v28];
  [(CNContactImage *)v13 setPairedPoster:v29];

  v30 = [v2 pairedPoster];

  uint64_t v31 = [v30 contentIsSensitive];
  v32 = [(CNContactImage *)v13 pairedPoster];
  [v32 setContentIsSensitive:v31];

  return v13;
}

@end