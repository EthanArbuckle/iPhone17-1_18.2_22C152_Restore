@interface _SWCollaborationServiceSource
- (id)requiredEntitlement;
- (id)serviceName;
- (void)collaborationMetadataWithCompletionHandler:(id)a3;
@end

@implementation _SWCollaborationServiceSource

- (id)serviceName
{
  return @"com.apple.SocialServices.MessagesCollaborationService";
}

- (id)requiredEntitlement
{
  return 0;
}

- (void)collaborationMetadataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(_SWBaseCollaborationSource *)self extension];
  v6 = [(_SWBaseCollaborationSource *)self itemIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76___SWCollaborationServiceSource_collaborationMetadataWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E54D8400;
  id v9 = v4;
  id v7 = v4;
  [v5 collaborationMetadataForItemWithIdentifier:v6 completionHandler:v8];
}

@end