@interface AUAudioUnit_XH
+ (void)instantiateWithExtension:(id)a3 componentDescription:(AudioComponentDescription *)a4 instance:(OpaqueAudioComponentInstance *)a5 options:(unsigned int)a6 completionHandler:(id)a7;
- (AUAudioUnit_XPC)strongInstance;
- (id)completionBlock;
- (id)speechSynthesisOutputMetadataBlock;
- (void)_internalInitWithExtension:(id)a3 componentDescription:(AudioComponentDescription *)a4 instance:(OpaqueAudioComponentInstance *)a5 completion:(id)a6;
- (void)_open:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)requestViewControllerWithCompletionHandler:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setSpeechSynthesisOutputMetadataBlock:(id)a3;
- (void)setStrongInstance:(id)a3;
@end

@implementation AUAudioUnit_XH

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_speechSynthesisOutputMetadataBlock, 0);
  objc_storeStrong((id *)&self->_strongInstance, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setStrongInstance:(id)a3
{
}

- (AUAudioUnit_XPC)strongInstance
{
  return self->_strongInstance;
}

- (id)speechSynthesisOutputMetadataBlock
{
  v2 = _Block_copy(self->_speechSynthesisOutputMetadataBlock);
  return v2;
}

- (void)setSpeechSynthesisOutputMetadataBlock:(id)a3
{
  id v4 = a3;
  [(AUAudioUnit *)self componentDescription];
  if (v7 == 1635087216)
  {
    v5 = _Block_copy(v4);
    id speechSynthesisOutputMetadataBlock = self->_speechSynthesisOutputMetadataBlock;
    self->_id speechSynthesisOutputMetadataBlock = v5;
  }
}

- (void)requestViewControllerWithCompletionHandler:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  id v4 = [(AUAudioUnit *)self cachedViewController];
  v5[2](v5, v4);
}

- (void)dealloc
{
  if (self->_requestIdentifier)
  {
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
    v3 = (NSObject **)CADeprecated::TSingleton<AUExtensionInstanceMap>::instance();
    id v4 = self->_requestIdentifier;
    v5 = *v3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN22AUExtensionInstanceMap6removeEPU19objcproto9NSCopying11objc_object_block_invoke;
    block[3] = &unk_1E5688908;
    v11 = v4;
    v12 = v3;
    v6 = v4;
    dispatch_sync(v5, block);

    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = 0;
  }
  id speechSynthesisOutputMetadataBlock = self->_speechSynthesisOutputMetadataBlock;
  self->_id speechSynthesisOutputMetadataBlock = 0;

  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnit_XH;
  [(AUAudioUnit_XPC *)&v9 dealloc];
}

- (void)_open:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (NSUUID *)[v6 copyWithZone:0];
  requestIdentifier = self->_requestIdentifier;
  self->_requestIdentifier = v8;

  v10 = (NSObject **)CADeprecated::TSingleton<AUExtensionInstanceMap>::instance();
  v11 = self->_requestIdentifier;
  v12 = self;
  v13 = *v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN22AUExtensionInstanceMap3addEPU19objcproto9NSCopying11objc_objectP14AUAudioUnit_XH_block_invoke;
  block[3] = &unk_1E5687F50;
  v22 = v11;
  v23 = v10;
  v21 = v12;
  v14 = v11;
  v15 = v12;
  dispatch_sync(v13, block);

  v16 = [v15[125] _extensionContextForUUID:self->_requestIdentifier];
  [v16 setExtension:v15[125]];
  v17 = [v16 delegate];
  [v17 setAudioUnit:v15];

  v18 = [v16 xpcConnection];
  v19.receiver = v15;
  v19.super_class = (Class)AUAudioUnit_XH;
  [(AUAudioUnit_XPC *)&v19 _doOpen:v18 completion:v7];
}

- (void)_internalInitWithExtension:(id)a3 componentDescription:(AudioComponentDescription *)a4 instance:(OpaqueAudioComponentInstance *)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  p_extension = &self->_extension;
  objc_storeStrong((id *)&self->_extension, a3);
  [(AUAudioUnit_XPC *)self _setComponentInstance:a5];
  v13 = (NSObject **)CADeprecated::TSingleton<AUExtensionInstanceMap>::instance();
  v14 = self->_extension;
  v15 = *v13;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v40 = 3221225472;
  v41 = ___ZN22AUExtensionInstanceMap29setExtensionInterruptionBlockEP11NSExtension_block_invoke;
  v42 = &unk_1E5688908;
  v43 = v14;
  v44 = v13;
  v16 = v14;
  dispatch_sync(v15, &block);

  v17 = [(NSExtension *)self->_extension extensionPointIdentifier];
  int v18 = [v17 isEqualToString:@"com.apple.AudioUnit-UI"];

  objc_initWeak(&location, self);
  [(AUAudioUnit_XH *)self setStrongInstance:self];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke;
  aBlock[3] = &unk_1E5687C00;
  objc_copyWeak(&v33, &location);
  id v19 = v11;
  id v32 = v19;
  v20 = _Block_copy(aBlock);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v20;

  if (v18)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    v22 = (void *)getAUAudioUnitRemoteViewControllerClass(void)::softClass;
    uint64_t v38 = getAUAudioUnitRemoteViewControllerClass(void)::softClass;
    if (!getAUAudioUnitRemoteViewControllerClass(void)::softClass)
    {
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      v41 = ___ZL39getAUAudioUnitRemoteViewControllerClassv_block_invoke;
      v42 = &unk_1E5688B80;
      v43 = (NSExtension *)&v35;
      ___ZL39getAUAudioUnitRemoteViewControllerClassv_block_invoke((uint64_t)&block);
      v22 = (void *)v36[3];
    }
    id v23 = v22;
    _Block_object_dispose(&v35, 8);
    v24 = *p_extension;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke_2;
    v29[3] = &unk_1E5687C28;
    v25 = &v30;
    objc_copyWeak(&v30, &location);
    [v23 _fetchViewControllerForExtension:v24 inputItems:0 completion:v29];
  }
  else
  {
    v26 = *p_extension;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __86__AUAudioUnit_XH__internalInitWithExtension_componentDescription_instance_completion___block_invoke_3;
    v27[3] = &unk_1E5687C50;
    v25 = &v28;
    objc_copyWeak(&v28, &location);
    [(NSExtension *)v26 beginExtensionRequestWithInputItems:0 completion:v27];
  }
  objc_destroyWeak(v25);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

+ (void)instantiateWithExtension:(id)a3 componentDescription:(AudioComponentDescription *)a4 instance:(OpaqueAudioComponentInstance *)a5 options:(unsigned int)a6 completionHandler:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v11 = a3;
  id v12 = a7;
  id v13 = objc_alloc((Class)objc_opt_class());
  AudioComponentDescription v26 = *a4;
  id v25 = 0;
  v14 = (void *)[v13 initWithComponentDescription:&v26 options:v8 error:&v25];
  id v15 = v25;
  v16 = v15;
  if (v14) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    if ([v14 isMemberOfClass:objc_opt_class()])
    {
      id v18 = objc_initWeak(&location, v14);
      long long v22 = *(_OWORD *)&a4->componentType;
      UInt32 componentFlagsMask = a4->componentFlagsMask;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __99__AUAudioUnit_XH_instantiateWithExtension_componentDescription_instance_options_completionHandler___block_invoke;
      v19[3] = &unk_1E5687C00;
      id v20 = v12;
      objc_copyWeak(&v21, &location);
      [v14 _internalInitWithExtension:v11 componentDescription:&v22 instance:a5 completion:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void *, void))v12 + 2))(v12, v14, 0);
    }
  }
  else
  {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v15);
  }
}

@end