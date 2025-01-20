@interface MIStashedBundleContainer
- (BOOL)saveStashMetadata:(id)a3 withError:(id *)a4;
- (MIStashMetadata)stashMetadata;
- (NSURL)stashMetadataURL;
- (id)newStashMetadata;
- (id)stashMetadataWithError:(id *)a3;
- (void)setStashMetadata:(id)a3;
@end

@implementation MIStashedBundleContainer

- (NSURL)stashMetadataURL
{
  v2 = [(MIContainer *)self containerURL];
  v3 = [v2 URLByAppendingPathComponent:@"StashMetadata.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (id)newStashMetadata
{
  v3 = objc_alloc_init(MIStashMetadata);
  [(MIStashedBundleContainer *)self setStashMetadata:v3];

  [(MIStashedBundleContainer *)self stashMetadata];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stashMetadataWithError:(id *)a3
{
  v5 = [(MIStashedBundleContainer *)self stashMetadata];
  v6 = [(MIStashedBundleContainer *)self stashMetadata];

  if (v6)
  {
    id v7 = 0;
LABEL_5:
    v10 = (void *)[v5 copy];
    v8 = v5;
    goto LABEL_6;
  }
  v8 = [(MIStashedBundleContainer *)self stashMetadataURL];
  id v14 = 0;
  v9 = +[MIStashMetadata metadataFromURL:v8 error:&v14];
  id v7 = v14;

  if (v9)
  {
LABEL_4:
    [(MIStashedBundleContainer *)self setStashMetadata:v9];

    v5 = v9;
    goto LABEL_5;
  }
  v12 = [v7 domain];
  if ([v12 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v13 = [v7 code];

    if (v13 == 260)
    {
      v9 = objc_alloc_init(MIStashMetadata);
      goto LABEL_4;
    }
  }
  else
  {
  }
  if (a3)
  {
    id v7 = v7;
    v10 = 0;
    *a3 = v7;
  }
  else
  {
    v10 = 0;
  }
LABEL_6:

  return v10;
}

- (BOOL)saveStashMetadata:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [(MIStashedBundleContainer *)self stashMetadataURL];
  id v12 = 0;
  int v8 = [v6 serializeToURL:v7 error:&v12];
  id v9 = v12;
  v10 = v9;
  if (v8)
  {
    [(MIStashedBundleContainer *)self setStashMetadata:v6];
  }
  else if (a4)
  {
    *a4 = v9;
  }

  return v8;
}

- (MIStashMetadata)stashMetadata
{
  return self->_stashMetadata;
}

- (void)setStashMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end