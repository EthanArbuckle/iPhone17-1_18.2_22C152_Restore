@interface _NSBundleODRDataForApplications
+ (_NSBundleODRDataForApplications)dataForBundle:(int)a3 createIfRequired:;
- (BOOL)assetPacksBecameAvailable:(id)a3 error:(id *)a4;
- (BOOL)assetPacksBecameUnavailable:(id)a3 error:(id *)a4;
- (_NSBundleODRDataForApplications)initWithBundle:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation _NSBundleODRDataForApplications

+ (_NSBundleODRDataForApplications)dataForBundle:(int)a3 createIfRequired:
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_1_0);
  v5 = (NSMapTable *)qword_1EB1E85A8;
  if (!qword_1EB1E85A8)
  {
    if (!a3)
    {
      v7 = 0;
      goto LABEL_8;
    }
    v5 = +[NSMapTable strongToStrongObjectsMapTable];
    qword_1EB1E85A8 = (uint64_t)v5;
  }
  uint64_t v6 = [(NSMapTable *)v5 objectForKey:a2];
  v7 = (_NSBundleODRDataForApplications *)v6;
  if (a3 && !v6)
  {
    v7 = [[_NSBundleODRDataForApplications alloc] initWithBundle:a2];
    [(id)qword_1EB1E85A8 setObject:v7 forKey:a2];
    v8 = v7;
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1_0);
  return v7;
}

- (_NSBundleODRDataForApplications)initWithBundle:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_NSBundleODRDataForApplications;
  id v4 = -[_NSBundleODRDataCommon initWithBundle:](&v17, sel_initWithBundle_);
  v5 = dispatch_group_create();
  *((void *)v4 + 8) = v5;
  dispatch_group_enter(v5);
  dispatch_group_enter(*((dispatch_group_t *)v4 + 8));
  id v6 = +[NSBundleResourceRequest _connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke;
  v16[3] = &unk_1E51F7FF8;
  v16[4] = v4;
  v7 = (void *)[v6 remoteObjectProxyWithErrorHandler:v16];
  uint64_t v8 = [a3 bundleURL];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_192;
  v15[3] = &unk_1E51FA578;
  v15[4] = v4;
  [v7 tagStateInBundle:v8 completionHandler:v15];
  id v9 = +[NSBundleResourceRequest _connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_194;
  v14[3] = &unk_1E51F7FF8;
  v14[4] = v4;
  v10 = (void *)[v9 remoteObjectProxyWithErrorHandler:v14];
  uint64_t v11 = [a3 bundleURL];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_195;
  v13[3] = &unk_1E51FA5C8;
  v13[4] = v4;
  v13[5] = a3;
  [v10 beginWithBundleURL:v11 completionHandler:v13];
  return (_NSBundleODRDataForApplications *)v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  extensionConnections = self->_extensionConnections;
  if (extensionConnections)
  {
    [(NSMutableSet *)extensionConnections enumerateObjectsUsingBlock:&__block_literal_global_47];
  }
  dispatch_release((dispatch_object_t)self->_initialStateGroup);
  v4.receiver = self;
  v4.super_class = (Class)_NSBundleODRDataForApplications;
  [(_NSBundleODRDataCommon *)&v4 dealloc];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSBundleODRDataForApplications;
  return +[NSString stringWithFormat:@"%@\n\tTags State: %@\n\tAsset Packs to URL: %@", [(_NSBundleODRDataForApplications *)&v3 description], self->_tagToTagState, self->super._assetPackToURL];
}

- (BOOL)assetPacksBecameAvailable:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_NSBundleODRDataForApplications;
  BOOL v6 = [(_NSBundleODRDataCommon *)&v10 assetPacksBecameAvailable:a3 error:a4];
  if (v6)
  {
    [(NSLock *)self->super._lock lock];
    extensionConnections = self->_extensionConnections;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67___NSBundleODRDataForApplications_assetPacksBecameAvailable_error___block_invoke;
    v9[3] = &unk_1E51FA5A0;
    v9[4] = a3;
    [(NSMutableSet *)extensionConnections enumerateObjectsUsingBlock:v9];
    [(NSLock *)self->super._lock unlock];
  }
  return v6;
}

- (BOOL)assetPacksBecameUnavailable:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_NSBundleODRDataForApplications;
  BOOL v6 = [(_NSBundleODRDataCommon *)&v10 assetPacksBecameUnavailable:a3 error:a4];
  if (v6)
  {
    [(NSLock *)self->super._lock lock];
    extensionConnections = self->_extensionConnections;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69___NSBundleODRDataForApplications_assetPacksBecameUnavailable_error___block_invoke;
    v9[3] = &unk_1E51FA5A0;
    v9[4] = a3;
    [(NSMutableSet *)extensionConnections enumerateObjectsUsingBlock:v9];
    [(NSLock *)self->super._lock unlock];
  }
  return v6;
}

@end