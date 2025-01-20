@interface CNContactPosterManagedObject
+ (id)managedObjectToContactPosterTransform;
- (void)setupWithContactPoster:(id)a3 contactIdentifier:(id)a4;
- (void)setupWithContactPoster:(id)a3 pairedImage:(id)a4 contactIdentifier:(id)a5;
- (void)updateWithContactPoster:(id)a3;
- (void)updateWithContactPoster:(id)a3 pairedImage:(id)a4;
@end

@implementation CNContactPosterManagedObject

- (void)updateWithContactPoster:(id)a3
{
  id v4 = a3;
  -[CNContactPosterManagedObject setIgnoredForRevert:](self, "setIgnoredForRevert:", [v4 ignoredForRevert]);
  v5 = [v4 posterData];
  [(CNContactPosterManagedObject *)self setPosterData:v5];

  v6 = [v4 lastUsedDate];
  [(CNContactPosterManagedObject *)self setLastUsedDate:v6];

  [(CNContactPosterManagedObject *)self setPairedImage:0];
  v7 = [v4 visualFingerprintData];
  [(CNContactPosterManagedObject *)self setVisualFingerprintData:v7];

  uint64_t v8 = [v4 contentIsSensitive];

  [(CNContactPosterManagedObject *)self setContentIsSensitive:v8];
}

- (void)updateWithContactPoster:(id)a3 pairedImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[CNContactPosterManagedObject setIgnoredForRevert:](self, "setIgnoredForRevert:", [v7 ignoredForRevert]);
  uint64_t v8 = [v7 posterData];
  [(CNContactPosterManagedObject *)self setPosterData:v8];

  v9 = [v7 lastUsedDate];
  [(CNContactPosterManagedObject *)self setLastUsedDate:v9];

  v10 = [v7 visualFingerprintData];
  [(CNContactPosterManagedObject *)self setVisualFingerprintData:v10];

  [(CNContactPosterManagedObject *)self setPairedImage:v6];
  uint64_t v11 = [v7 contentIsSensitive];

  [(CNContactPosterManagedObject *)self setContentIsSensitive:v11];
}

- (void)setupWithContactPoster:(id)a3 contactIdentifier:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = [v8 identifier];
  id v11 = (id)[v9 initWithUUIDString:v10];

  [(CNContactPosterManagedObject *)self setIdentifier:v11];
  [(CNContactPosterManagedObject *)self setContactIdentifier:v7];

  [(CNContactPosterManagedObject *)self updateWithContactPoster:v8];
}

- (void)setupWithContactPoster:(id)a3 pairedImage:(id)a4 contactIdentifier:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  v13 = [v11 identifier];
  id v14 = (id)[v12 initWithUUIDString:v13];

  [(CNContactPosterManagedObject *)self setIdentifier:v14];
  [(CNContactPosterManagedObject *)self setContactIdentifier:v9];

  [(CNContactPosterManagedObject *)self updateWithContactPoster:v11 pairedImage:v10];
}

+ (id)managedObjectToContactPosterTransform
{
  v2 = (void *)[&__block_literal_global_113 copy];

  return v2;
}

CNContactPoster *__69__CNContactPosterManagedObject_managedObjectToContactPosterTransform__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [CNContactPoster alloc];
  id v4 = [v2 identifier];
  v5 = [v4 UUIDString];
  id v6 = [v2 posterData];
  id v7 = [v2 lastUsedDate];
  id v8 = [(CNContactPoster *)v3 initWithIdentifier:v5 posterData:v6 lastUsedDate:v7];

  id v9 = v8;
  -[CNContactPoster setIgnoredForRevert:](v8, "setIgnoredForRevert:", [v2 ignoredForRevert]);
  id v10 = [v2 visualFingerprintData];
  v43 = v9;
  [(CNContactPoster *)v9 setVisualFingerprintData:v10];

  -[CNContactPoster setContentIsSensitive:](v9, "setContentIsSensitive:", [v2 contentIsSensitive]);
  id v11 = [v2 pairedImage];
  id v12 = [v11 cropRectString];
  NSRect v45 = NSRectFromString(v12);
  double x = v45.origin.x;
  double y = v45.origin.y;
  double width = v45.size.width;
  double height = v45.size.height;

  v17 = [CNContactImage alloc];
  v42 = [v2 pairedImage];
  v41 = [v42 identifier];
  v33 = [v41 UUIDString];
  v40 = [v2 pairedImage];
  v31 = [v40 imageData];
  v39 = [v2 pairedImage];
  v18 = [v39 lastUsedDate];
  v38 = [v2 pairedImage];
  v37 = [v38 source];
  uint64_t v34 = [v37 integerValue];
  v36 = [v2 pairedImage];
  v30 = [v36 sourceIdentifier];
  v32 = [v2 pairedImage];
  v19 = [v32 variant];
  v20 = [v2 pairedImage];
  v21 = [v20 poseConfigurationData];
  v22 = [v2 pairedImage];
  v23 = [v22 displayString];
  v24 = [v2 pairedImage];
  LOBYTE(v29) = [v24 ignoredForRevert];
  v35 = -[CNContactImage initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:](v17, "initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:", v33, v31, v18, v34, v30, v19, x, y, width, height, v21, v23, v29);

  v25 = [v2 pairedImage];

  v26 = [v25 visualFingerprintData];
  v27 = +[CNVisualFingerprint fingerprintFromArchive:v26];
  [(CNContactImage *)v35 setVisualFingerprint:v27];

  [(CNContactPoster *)v43 setPairedImage:v35];

  return v43;
}

@end