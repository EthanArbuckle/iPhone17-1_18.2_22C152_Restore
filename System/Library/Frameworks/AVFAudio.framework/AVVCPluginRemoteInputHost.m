@interface AVVCPluginRemoteInputHost
- (AVVCPluginRemoteInputHost)init;
- (AVVoiceController)mMotherController;
- (id)allBundles:(id *)a3;
- (id)findDeviceWithIdentifier:(id)a3;
- (id)findFirstBluetoothDevice;
- (id)mockPluginEndpoint;
- (void)dealloc;
- (void)inputPlugin:(id)a3 didPublishDevice:(id)a4;
- (void)inputPlugin:(id)a3 didUnpublishDevice:(id)a4;
- (void)invalidatePlugins;
- (void)setMMotherController:(id)a3;
- (void)setParentVoiceController:(id)a3;
@end

@implementation AVVCPluginRemoteInputHost

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mMotherController);

  objc_storeStrong((id *)&self->mPlugins, 0);
}

- (void)setMMotherController:(id)a3
{
}

- (AVVoiceController)mMotherController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mMotherController);

  return (AVVoiceController *)WeakRetained;
}

- (id)mockPluginEndpoint
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mMotherController);
    *(_DWORD *)buf = 136315906;
    v24 = "AVVCPluginRemoteInputHost.mm";
    __int16 v25 = 1024;
    int v26 = 192;
    __int16 v27 = 2048;
    v28 = self;
    __int16 v29 = 2048;
    id v30 = WeakRetained;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d self(%p) controller(%p)", buf, 0x26u);
  }
LABEL_8:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = self->mPlugins;
  uint64_t v8 = [(AVAudioRemoteInputPlugin *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
LABEL_10:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v7);
      }
      v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EEFB71A8, (void)v18)) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(AVAudioRemoteInputPlugin *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
    }
    id v14 = v11;
    v13 = [v14 mockPluginEndpoint];

    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12) {
        goto LABEL_30;
      }
    }
    else
    {
      v12 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "AVVCPluginRemoteInputHost.mm";
      __int16 v25 = 1024;
      int v26 = 209;
      __int16 v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mock plugin endpoint (%@)", buf, 0x1Cu);
    }
  }
  else
  {
LABEL_16:

    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
      {
        v13 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      v12 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "AVVCPluginRemoteInputHost.mm";
      __int16 v25 = 1024;
      int v26 = 206;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d couldn't find mock plugin", buf, 0x12u);
    }
    v13 = 0;
  }

LABEL_30:

  return v13;
}

- (void)inputPlugin:(id)a3 didUnpublishDevice:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  uint64_t v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mMotherController);
    v12 = [v7 deviceIdentifier];
    *(_DWORD *)v24 = 136316674;
    *(void *)&v24[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = 176;
    __int16 v25 = 2048;
    int v26 = self;
    __int16 v27 = 2048;
    id v28 = WeakRetained;
    __int16 v29 = 2048;
    id v30 = v6;
    __int16 v31 = 2048;
    id v32 = v7;
    __int16 v33 = 2112;
    v34 = v12;
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d self(%p) controller(%p) plugin(%p), did UNpublish device(%p) with id(%@)", v24, 0x44u);
  }
LABEL_8:
  if (v7)
  {
    p_mMotherController = &self->_mMotherController;
    id v14 = objc_loadWeakRetained((id *)&self->_mMotherController);
    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)p_mMotherController);
      [v15 impl];
      if (*(unsigned char *)(*(void *)v24 + 520))
      {
        char v16 = 0;
      }
      else
      {
        id v18 = objc_loadWeakRetained((id *)p_mMotherController);
        char v16 = objc_opt_respondsToSelector();
      }
      if (*(void *)&v24[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v24[8]);
      }

      if (v16)
      {
        v17 = objc_loadWeakRetained((id *)p_mMotherController);
        [v17 handlePluginDidUnpublishDevice:v6 withDevice:v7];
        goto LABEL_30;
      }
    }
    if (kAVVCScope)
    {
      v17 = *(id *)kAVVCScope;
      if (!v17) {
        goto LABEL_31;
      }
    }
    else
    {
      v17 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)v24 = 136315394;
    *(void *)&v24[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = 184;
    long long v20 = "%25s:%-5d WARNING: Not forwarding didUNpublish event to AVVC parent because it does not exist, or is deallocating.";
    long long v21 = v17;
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
LABEL_29:
    _os_log_impl(&dword_19D794000, v21, v22, v20, v24, 0x12u);
    goto LABEL_30;
  }
  if (kAVVCScope)
  {
    v17 = *(id *)kAVVCScope;
    if (!v17) {
      goto LABEL_31;
    }
  }
  else
  {
    v17 = MEMORY[0x1E4F14500];
    id v23 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v24 = 136315394;
    *(void *)&v24[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = 178;
    long long v20 = "%25s:%-5d ERROR: Received didUNpublishDevice with 'nil' device. Not forwarding event to AVVC parent.";
    long long v21 = v17;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    goto LABEL_29;
  }
LABEL_30:

LABEL_31:
}

- (void)inputPlugin:(id)a3 didPublishDevice:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  uint64_t v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mMotherController);
    v12 = [v7 deviceIdentifier];
    *(_DWORD *)v24 = 136316674;
    *(void *)&v24[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = 162;
    __int16 v25 = 2048;
    int v26 = self;
    __int16 v27 = 2048;
    id v28 = WeakRetained;
    __int16 v29 = 2048;
    id v30 = v6;
    __int16 v31 = 2048;
    id v32 = v7;
    __int16 v33 = 2112;
    v34 = v12;
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d self(%p) controller(%p) plugin(%p), did publish device(%p) with id(%@)", v24, 0x44u);
  }
LABEL_8:
  if (v7)
  {
    p_mMotherController = &self->_mMotherController;
    id v14 = objc_loadWeakRetained((id *)&self->_mMotherController);
    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)p_mMotherController);
      [v15 impl];
      if (*(unsigned char *)(*(void *)v24 + 520))
      {
        char v16 = 0;
      }
      else
      {
        id v18 = objc_loadWeakRetained((id *)p_mMotherController);
        char v16 = objc_opt_respondsToSelector();
      }
      if (*(void *)&v24[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v24[8]);
      }

      if (v16)
      {
        v17 = objc_loadWeakRetained((id *)p_mMotherController);
        [v17 handlePluginDidPublishDevice:v6 withDevice:v7];
        goto LABEL_30;
      }
    }
    if (kAVVCScope)
    {
      v17 = *(id *)kAVVCScope;
      if (!v17) {
        goto LABEL_31;
      }
    }
    else
    {
      v17 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)v24 = 136315394;
    *(void *)&v24[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = 170;
    long long v20 = "%25s:%-5d WARNING: Not forwarding didPublish event to AVVC parent because it does not exist, or is deallocating.";
    long long v21 = v17;
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
LABEL_29:
    _os_log_impl(&dword_19D794000, v21, v22, v20, v24, 0x12u);
    goto LABEL_30;
  }
  if (kAVVCScope)
  {
    v17 = *(id *)kAVVCScope;
    if (!v17) {
      goto LABEL_31;
    }
  }
  else
  {
    v17 = MEMORY[0x1E4F14500];
    id v23 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v24 = 136315394;
    *(void *)&v24[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = 164;
    long long v20 = "%25s:%-5d ERROR: Received didPublishDevice with 'nil' device. Not forwarding event to AVVC parent.";
    long long v21 = v17;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    goto LABEL_29;
  }
LABEL_30:

LABEL_31:
}

- (void)setParentVoiceController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  id v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mMotherController);
    int v9 = 136316162;
    uint64_t v10 = "AVVCPluginRemoteInputHost.mm";
    __int16 v11 = 1024;
    int v12 = 156;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2048;
    id v16 = WeakRetained;
    __int16 v17 = 2048;
    id v18 = v4;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d self(%p) oldController(%p) newController(%p)", (uint8_t *)&v9, 0x30u);
  }
LABEL_8:
  objc_storeWeak((id *)&self->_mMotherController, v4);
}

- (id)findFirstBluetoothDevice
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->mPlugins;
  uint64_t v2 = [(AVAudioRemoteInputPlugin *)obj countByEnumeratingWithState:&v26 objects:v41 count:16];
  if (!v2) {
    goto LABEL_25;
  }
  uint64_t v19 = *(void *)v27;
  uint64_t v20 = v2;
  do
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v27 != v19) {
        objc_enumerationMutation(obj);
      }
      id v3 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v4 = [v3 devices];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v40 count:16];
      if (!v5)
      {
LABEL_21:

        continue;
      }
      uint64_t v6 = *(void *)v23;
LABEL_8:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * v7);
        if (kAVVCScope)
        {
          id v9 = *(id *)kAVVCScope;
          if (!v9) {
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v10 = (void *)MEMORY[0x1E4F14500];
          id v11 = MEMORY[0x1E4F14500];
          id v9 = v10;
        }
        int v12 = v9;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          __int16 v13 = [v8 deviceIdentifier];
          id v14 = [v3 devices];
          int v15 = [v14 count];
          *(_DWORD *)buf = 136316162;
          __int16 v31 = "AVVCPluginRemoteInputHost.mm";
          __int16 v32 = 1024;
          int v33 = 143;
          __int16 v34 = 2048;
          uint64_t v35 = v8;
          __int16 v36 = 2112;
          v37 = v13;
          __int16 v38 = 1024;
          int v39 = v15;
          _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Device(%p). Identifier: %@ (num devices = %d)", buf, 0x2Cu);
        }
LABEL_18:
        if ([v8 deviceCategory] == 1919510644) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v40 count:16];
          if (v5) {
            goto LABEL_8;
          }
          goto LABEL_21;
        }
      }
      id v16 = v8;

      if (v16) {
        goto LABEL_26;
      }
    }
    uint64_t v20 = [(AVAudioRemoteInputPlugin *)obj countByEnumeratingWithState:&v26 objects:v41 count:16];
  }
  while (v20);
LABEL_25:
  id v16 = 0;
LABEL_26:

  return v16;
}

- (id)findDeviceWithIdentifier:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVVCPluginRemoteInputHost_findDeviceWithIdentifier___block_invoke;
  block[3] = &unk_1E5965AD8;
  block[4] = self;
  if (-[AVVCPluginRemoteInputHost findDeviceWithIdentifier:]::once != -1) {
    dispatch_once(&-[AVVCPluginRemoteInputHost findDeviceWithIdentifier:]::once, block);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = self->mPlugins;
  uint64_t v5 = [(AVAudioRemoteInputPlugin *)obj countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (!v5)
  {
LABEL_28:

    if (kAVVCScope)
    {
      long long v21 = *(id *)kAVVCScope;
      if (!v21)
      {
        id v20 = 0;
        goto LABEL_42;
      }
    }
    else
    {
      long long v21 = MEMORY[0x1E4F14500];
      id v23 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v38 = "AVVCPluginRemoteInputHost.mm";
      __int16 v39 = 1024;
      int v40 = 128;
      __int16 v41 = 2112;
      id v42 = v4;
      _os_log_impl(&dword_19D794000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot find Remote Input device %@", buf, 0x1Cu);
    }
    id v20 = 0;
    goto LABEL_41;
  }
  uint64_t v26 = *(void *)v33;
LABEL_5:
  uint64_t v6 = 0;
  uint64_t v27 = v5;
  while (1)
  {
    if (*(void *)v33 != v26) {
      objc_enumerationMutation(obj);
    }
    uint64_t v7 = *(void **)(*((void *)&v32 + 1) + 8 * v6);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = [v7 devices];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v45 count:16];
    if (v9) {
      break;
    }
LABEL_24:

LABEL_26:
    if (++v6 == v27)
    {
      uint64_t v5 = [(AVAudioRemoteInputPlugin *)obj countByEnumeratingWithState:&v32 objects:v46 count:16];
      if (!v5) {
        goto LABEL_28;
      }
      goto LABEL_5;
    }
  }
  uint64_t v10 = *(void *)v29;
LABEL_10:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v29 != v10) {
      objc_enumerationMutation(v8);
    }
    int v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
    if (v12)
    {
      if (kAVVCScope)
      {
        id v13 = *(id *)kAVVCScope;
        if (!v13) {
          goto LABEL_21;
        }
      }
      else
      {
        id v14 = (void *)MEMORY[0x1E4F14500];
        id v15 = MEMORY[0x1E4F14500];
        id v13 = v14;
      }
      id v16 = v13;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        __int16 v17 = [v12 deviceIdentifier];
        *(_DWORD *)buf = 136315906;
        __int16 v38 = "AVVCPluginRemoteInputHost.mm";
        __int16 v39 = 1024;
        int v40 = 117;
        __int16 v41 = 2048;
        id v42 = v12;
        __int16 v43 = 2112;
        v44 = v17;
        _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d Device(%p). Identifier: %@", buf, 0x26u);
      }
    }
LABEL_21:
    id v18 = [v12 deviceIdentifier];
    char v19 = [v18 isEqualToString:v4];

    if (v19) {
      break;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v45 count:16];
      if (v9) {
        goto LABEL_10;
      }
      goto LABEL_24;
    }
  }
  id v20 = v12;

  if (!v12) {
    goto LABEL_26;
  }

  if (kAVVCScope)
  {
    long long v21 = *(id *)kAVVCScope;
    if (!v21) {
      goto LABEL_42;
    }
  }
  else
  {
    long long v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v38 = "AVVCPluginRemoteInputHost.mm";
    __int16 v39 = 1024;
    int v40 = 131;
    __int16 v41 = 2112;
    id v42 = v4;
    _os_log_impl(&dword_19D794000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d findDeviceWithIdentifier: found the device %@", buf, 0x1Cu);
  }
LABEL_41:

LABEL_42:

  return v20;
}

void __54__AVVCPluginRemoteInputHost_findDeviceWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v14 = [obj countByEnumeratingWithState:&v20 objects:v35 count:16];
  if (v14)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(obj);
        }
        v1 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v2 = [v1 devices];
        uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v34 count:16];
        if (v3)
        {
          uint64_t v4 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v3; ++j)
            {
              if (*(void *)v17 != v4) {
                objc_enumerationMutation(v2);
              }
              uint64_t v6 = *(void **)(*((void *)&v16 + 1) + 8 * j);
              if (kAVVCScope)
              {
                id v7 = *(id *)kAVVCScope;
                if (!v7) {
                  continue;
                }
              }
              else
              {
                id v8 = (void *)MEMORY[0x1E4F14500];
                id v9 = MEMORY[0x1E4F14500];
                id v7 = v8;
              }
              uint64_t v10 = v7;
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v11 = [v6 deviceIdentifier];
                *(_DWORD *)buf = 136316162;
                long long v25 = "AVVCPluginRemoteInputHost.mm";
                __int16 v26 = 1024;
                int v27 = 106;
                __int16 v28 = 2048;
                long long v29 = v1;
                __int16 v30 = 2048;
                long long v31 = v6;
                __int16 v32 = 2112;
                long long v33 = v11;
                _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d plugin(%p) - device(%p) - id: %@", buf, 0x30u);
              }
            }
            uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v34 count:16];
          }
          while (v3);
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v20 objects:v35 count:16];
    }
    while (v14);
  }
}

- (id)allBundles:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v24 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", a3);
  long long v22 = [v24 URLsForDirectory:5 inDomains:10];
  id v23 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v22;
  uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v3)
  {
    id v4 = 0;
    uint64_t v5 = *(void *)v29;
    while (1)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);

        id v8 = [v7 URLByAppendingPathComponent:@"Audio/Plug-Ins/RemoteInput/"];
        id v27 = 0;
        LODWORD(v7) = [v8 checkResourceIsReachableAndReturnError:&v27];
        id v9 = v27;
        uint64_t v10 = v9;
        if (!v7)
        {
          id v4 = v9;
          goto LABEL_24;
        }
        if (kAVVCScope)
        {
          if (*(unsigned char *)(kAVVCScope + 8))
          {
            id v11 = *(id *)kAVVCScope;
            if (v11)
            {
              int v12 = v11;
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v13 = [v8 absoluteString];
                *(_DWORD *)buf = 136315650;
                long long v33 = "AVVCPluginRemoteInputHost.mm";
                __int16 v34 = 1024;
                int v35 = 84;
                __int16 v36 = 2112;
                v37 = v13;
                _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Searching plugin path %@", buf, 0x1Cu);
              }
            }
          }
        }
        id v26 = v10;
        uint64_t v14 = [v24 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:0 options:4 error:&v26];
        id v4 = v26;

        if (v4)
        {
          if (!kAVVCScope)
          {
            long long v16 = (void *)MEMORY[0x1E4F14500];
            id v17 = MEMORY[0x1E4F14500];
            id v15 = v16;
LABEL_20:
            long long v18 = v15;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              long long v19 = [v8 absoluteString];
              long long v20 = [v4 debugDescription];
              *(_DWORD *)buf = 136315906;
              long long v33 = "AVVCPluginRemoteInputHost.mm";
              __int16 v34 = 1024;
              int v35 = 87;
              __int16 v36 = 2112;
              v37 = v19;
              __int16 v38 = 2112;
              __int16 v39 = v20;
              _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d Error enumerating the remote input bundles at %@: %@", buf, 0x26u);
            }
            goto LABEL_23;
          }
          id v15 = *(id *)kAVVCScope;
          if (v15) {
            goto LABEL_20;
          }
        }
        else
        {
          [v23 addObjectsFromArray:v14];
        }
LABEL_23:

LABEL_24:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (!v3)
      {

        break;
      }
    }
  }

  return v23;
}

- (void)invalidatePlugins
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    uint64_t v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v21 = "AVVCPluginRemoteInputHost.mm";
    __int16 v22 = 1024;
    int v23 = 60;
    __int16 v24 = 2048;
    long long v25 = self;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d invalidatePlugins : invalidating all plugins *** %p", buf, 0x1Cu);
  }

LABEL_8:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->mPlugins;
  uint64_t v6 = [(AVAudioRemoteInputPlugin *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v16;
    id v9 = MEMORY[0x1E4F14500];
    *(void *)&long long v7 = 136315650;
    long long v14 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(AVVCPluginRemoteInputHost **)(*((void *)&v15 + 1) + 8 * i);
        if (kAVVCScope)
        {
          int v12 = *(id *)kAVVCScope;
          if (!v12) {
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v13 = v9;
          int v12 = v9;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          long long v21 = "AVVCPluginRemoteInputHost.mm";
          __int16 v22 = 1024;
          int v23 = 62;
          __int16 v24 = 2048;
          long long v25 = v11;
          _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d -----> calling invalidate on plugin instance %p", buf, 0x1Cu);
        }

LABEL_20:
        [(AVVCPluginRemoteInputHost *)v11 invalidate];
      }
      uint64_t v6 = [(AVAudioRemoteInputPlugin *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    uint64_t v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    long long v7 = "AVVCPluginRemoteInputHost.mm";
    __int16 v8 = 1024;
    int v9 = 55;
    __int16 v10 = 2048;
    id v11 = self;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d dealloc : releasing all plugins *** %p", buf, 0x1Cu);
  }

LABEL_8:
  v5.receiver = self;
  v5.super_class = (Class)AVVCPluginRemoteInputHost;
  [(AVVCPluginRemoteInputHost *)&v5 dealloc];
}

- (AVVCPluginRemoteInputHost)init
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)AVVCPluginRemoteInputHost;
  result = [(AVVCPluginRemoteInputHost *)&v34 init];
  if (result)
  {
    id v27 = result;
    if (kAVVCScope)
    {
      uint64_t v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_9:
        objc_super v5 = (AVAudioRemoteInputPlugin *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        mPlugins = v27->mPlugins;
        v27->mPlugins = v5;

        id v33 = 0;
        long long v7 = [(AVVCPluginRemoteInputHost *)v27 allBundles:&v33];
        id v26 = v33;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        obuint64_t j = v7;
        uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (!v8) {
          goto LABEL_39;
        }
        uint64_t v9 = *(void *)v30;
        __int16 v10 = MEMORY[0x1E4F14500];
        while (1)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v30 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (kAVVCScope)
            {
              uint64_t v13 = *(id *)kAVVCScope;
              if (!v13) {
                goto LABEL_21;
              }
            }
            else
            {
              long long v14 = v10;
              uint64_t v13 = v10;
            }
            long long v15 = v13;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              long long v16 = [v12 absoluteString];
              *(_DWORD *)buf = 136315650;
              v37 = "AVVCPluginRemoteInputHost.mm";
              __int16 v38 = 1024;
              int v39 = 33;
              __int16 v40 = 2112;
              uint64_t v41 = v16;
              _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d Plugin Bundle URL: %@", buf, 0x1Cu);
            }
LABEL_21:
            long long v17 = [MEMORY[0x1E4F28B50] bundleWithURL:v12];
            long long v18 = v17;
            if (v17)
            {
              long long v19 = (void *)[v17 principalClass];
              if (![v19 conformsToProtocol:&unk_1EEFC7580]) {
                goto LABEL_37;
              }
              long long v20 = [objc_alloc((Class)v19) initWithPluginDelegate:v27];
              [(AVAudioRemoteInputPlugin *)v27->mPlugins addObject:v20];
              if (kAVVCScope)
              {
                long long v21 = *(id *)kAVVCScope;
                if (!v21) {
                  goto LABEL_36;
                }
              }
              else
              {
                int v23 = v10;
                long long v21 = v10;
              }
              __int16 v24 = v21;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                NSStringFromClass((Class)v19);
                long long v25 = (AVVCPluginRemoteInputHost *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v37 = "AVVCPluginRemoteInputHost.mm";
                __int16 v38 = 1024;
                int v39 = 42;
                __int16 v40 = 2112;
                uint64_t v41 = v25;
                _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d initialized plugin class %@", buf, 0x1Cu);
              }
              goto LABEL_36;
            }
            if (!kAVVCScope)
            {
              __int16 v22 = v10;
              long long v20 = v10;
LABEL_30:
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v37 = "AVVCPluginRemoteInputHost.mm";
                __int16 v38 = 1024;
                int v39 = 46;
                _os_log_impl(&dword_19D794000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d Unable to create the plugin bundle", buf, 0x12u);
              }
LABEL_36:

              goto LABEL_37;
            }
            long long v20 = *(id *)kAVVCScope;
            if (v20) {
              goto LABEL_30;
            }
LABEL_37:
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (!v8)
          {
LABEL_39:

            return v27;
          }
        }
      }
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v37 = "AVVCPluginRemoteInputHost.mm";
      __int16 v38 = 1024;
      int v39 = 25;
      __int16 v40 = 2048;
      uint64_t v41 = v27;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d *** InitializePlugins *** %p ", buf, 0x1Cu);
    }

    goto LABEL_9;
  }
  return result;
}

@end