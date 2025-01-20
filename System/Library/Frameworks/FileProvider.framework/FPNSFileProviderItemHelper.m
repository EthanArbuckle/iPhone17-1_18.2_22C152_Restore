@interface FPNSFileProviderItemHelper
- (BOOL)fp_isReadable;
- (BOOL)fp_isWritable;
- (NSString)filename;
- (NSString)itemIdentifier;
- (NSString)parentItemIdentifier;
- (NSString)typeIdentifier;
- (UTType)contentType;
- (id)fp_downloadingStatus;
- (id)fp_sharingCurrentUserPermissions;
- (id)fp_sharingCurrentUserRole;
- (unint64_t)capabilities;
@end

@implementation FPNSFileProviderItemHelper

- (id)fp_downloadingStatus
{
  if (objc_opt_respondsToSelector())
  {
    if ([(FPNSFileProviderItemHelper *)self isDownloaded])
    {
      char v3 = objc_opt_respondsToSelector();
      v4 = (id *)MEMORY[0x1E4F1C748];
      if ((v3 & 1) != 0
        && ![(FPNSFileProviderItemHelper *)self isMostRecentVersionDownloaded])
      {
        v4 = (id *)MEMORY[0x1E4F1C750];
      }
    }
    else
    {
      v4 = (id *)MEMORY[0x1E4F1C760];
    }
    id v5 = *v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)fp_isReadable
{
  if (objc_opt_respondsToSelector()) {
    return [(FPNSFileProviderItemHelper *)self capabilities] & 1;
  }
  else {
    return 0;
  }
}

- (BOOL)fp_isWritable
{
  if (objc_opt_respondsToSelector()) {
    return ([(FPNSFileProviderItemHelper *)self capabilities] >> 1) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)fp_sharingCurrentUserRole
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(FPNSFileProviderItemHelper *)self isShared])
  {
    SEL v3 = NSSelectorFromString(&cfstr_Shareditemrole.isa);
    if (objc_opt_respondsToSelector())
    {
      v4 = [(FPNSFileProviderItemHelper *)self performSelector:v3];
      if ([v4 isEqualToString:*MEMORY[0x1E4F28738]])
      {
        id v5 = (id *)MEMORY[0x1E4F1C7F0];
LABEL_8:
        id v6 = *v5;

        goto LABEL_14;
      }
      if ([v4 isEqualToString:*MEMORY[0x1E4F28740]])
      {
        id v5 = (id *)MEMORY[0x1E4F1C7F8];
        goto LABEL_8;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      if ([(FPNSFileProviderItemHelper *)self isSharedByCurrentUser]) {
        v7 = (id *)MEMORY[0x1E4F1C7F0];
      }
      else {
        v7 = (id *)MEMORY[0x1E4F1C7F8];
      }
      id v6 = *v7;
      goto LABEL_14;
    }
  }
  id v6 = 0;
LABEL_14:

  return v6;
}

- (id)fp_sharingCurrentUserPermissions
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(FPNSFileProviderItemHelper *)self isShared])
  {
    BOOL v3 = [(FPNSFileProviderItemHelper *)self fp_isWritable];
    v4 = (id *)MEMORY[0x1E4F1C7E0];
    if (!v3) {
      v4 = (id *)MEMORY[0x1E4F1C7D8];
    }
    id v5 = *v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (NSString)parentItemIdentifier
{
  return self->parentItemIdentifier;
}

- (NSString)filename
{
  return self->filename;
}

- (NSString)typeIdentifier
{
  return self->typeIdentifier;
}

- (UTType)contentType
{
  return self->contentType;
}

- (unint64_t)capabilities
{
  return self->capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->contentType, 0);
  objc_storeStrong((id *)&self->typeIdentifier, 0);
  objc_storeStrong((id *)&self->filename, 0);
  objc_storeStrong((id *)&self->parentItemIdentifier, 0);

  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end