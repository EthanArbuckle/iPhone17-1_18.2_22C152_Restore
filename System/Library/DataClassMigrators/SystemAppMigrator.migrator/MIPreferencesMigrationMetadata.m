@interface MIPreferencesMigrationMetadata
- (MIPreferencesMigrationMetadata)initWithSourceBundleID:(id)a3 destinationBundleID:(id)a4 keyMappings:(id)a5 completion:(id)a6;
- (NSDictionary)capturedPreferences;
- (NSDictionary)keyMappings;
- (NSString)destinationBundleID;
- (NSString)sourceBundleID;
- (id)completion;
- (void)setCapturedPreferences:(id)a3;
@end

@implementation MIPreferencesMigrationMetadata

- (MIPreferencesMigrationMetadata)initWithSourceBundleID:(id)a3 destinationBundleID:(id)a4 keyMappings:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MIPreferencesMigrationMetadata;
  v15 = [(MIPreferencesMigrationMetadata *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sourceBundleID, a3);
    objc_storeStrong((id *)&v16->_destinationBundleID, a4);
    objc_storeStrong((id *)&v16->_keyMappings, a5);
    id v17 = objc_retainBlock(v14);
    id completion = v16->_completion;
    v16->_id completion = v17;
  }
  return v16;
}

- (NSDictionary)capturedPreferences
{
  return self->_capturedPreferences;
}

- (void)setCapturedPreferences:(id)a3
{
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)destinationBundleID
{
  return self->_destinationBundleID;
}

- (NSDictionary)keyMappings
{
  return self->_keyMappings;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_keyMappings, 0);
  objc_storeStrong((id *)&self->_destinationBundleID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);

  objc_storeStrong((id *)&self->_capturedPreferences, 0);
}

@end