@interface NTKCharacterResourceLoader
+ (id)sharedInstanceForDevice:(id)a3 withPixelFormat:(unint64_t)a4;
+ (void)_deallocInstanceForDevice:(id)a3;
- (MTLBuffer)mtlBuffer;
- (id)_loadBank:(id)a3 toArrays:(unint64_t)a4 allowNewKeys:(BOOL)a5;
- (id)getMTLTexture:(id)a3;
- (id)getPipelineForProgramType:(unint64_t)a3;
- (id)initForDevice:(id)a3 withPixelFormat:(unint64_t)a4;
- (id)mtlTextureWithName:(id)a3;
- (id)mtlTextureWithName:(id)a3 prefix:(id)a4;
- (id)textureWithName:(id)a3;
- (id)textureWithName:(id)a3 prefix:(id)a4;
- (unint64_t)bufferOffsetArm;
- (unint64_t)bufferOffsetBackground;
- (unint64_t)bufferOffsetBody;
- (unint64_t)bufferOffsetFlower;
- (unint64_t)bufferOffsetFoot;
- (unint64_t)bufferOffsetHand;
- (unint64_t)bufferOffsetHead;
- (unint64_t)bufferOffsetSkirt;
- (void)_asyncDeallocInstance;
- (void)_loadMTLBufferData;
- (void)_loadPrograms;
- (void)_loadTextures;
- (void)_setupPipelineForType:(unint64_t)a3 vertex:(id)a4 fragment:(id)a5 blending:(BOOL)a6 inLibrary:(id)a7 librarySPI:(id)a8;
- (void)addClient;
- (void)dealloc;
- (void)localeChanged;
- (void)removeClient;
@end

@implementation NTKCharacterResourceLoader

+ (id)sharedInstanceForDevice:(id)a3 withPixelFormat:(unint64_t)a4
{
  id v6 = a3;
  id v7 = a1;
  objc_sync_enter(v7);
  if (!qword_26210)
  {
    uint64_t v8 = objc_opt_new();
    v9 = (void *)qword_26210;
    qword_26210 = v8;
  }
  v10 = sub_2C00(v6);
  v11 = [(id)qword_26210 objectForKeyedSubscript:v10];
  if (!v11)
  {
    v11 = [[NTKCharacterResourceLoader alloc] initForDevice:v6 withPixelFormat:a4];
    [(id)qword_26210 setObject:v11 forKeyedSubscript:v10];
  }

  objc_sync_exit(v7);
  if (v11[14] != a4) {
    sub_100D0();
  }

  return v11;
}

+ (void)_deallocInstanceForDevice:(id)a3
{
  id v6 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = sub_2C00(v6);
  [(id)qword_26210 setObject:0 forKeyedSubscript:v5];

  objc_sync_exit(v4);
}

- (id)initForDevice:(id)a3 withPixelFormat:(unint64_t)a4
{
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NTKCharacterResourceLoader;
  uint64_t v8 = [(NTKCharacterResourceLoader *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clkDevice, a3);
    uint64_t v10 = +[CLKUIMetalResourceManager sharedDevice];
    mtlDevice = v9->_mtlDevice;
    v9->_mtlDevice = (MTLDevice *)v10;

    uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
    bundle = v9->_bundle;
    v9->_bundle = (NSBundle *)v12;

    v9->_viewMtlPixelFormat = a4;
    uint64_t v14 = objc_opt_new();
    mapping = v9->_mapping;
    v9->_mapping = (NSMutableDictionary *)v14;

    for (uint64_t i = 136; i != 160; i += 8)
    {
      uint64_t v17 = objc_opt_new();
      v18 = *(Class *)((char *)&v9->super.isa + i);
      *(Class *)((char *)&v9->super.isa + i) = (Class)v17;
    }
    [(NTKCharacterResourceLoader *)v9 _loadMTLBufferData];
    [(NTKCharacterResourceLoader *)v9 _loadPrograms];
    [(NTKCharacterResourceLoader *)v9 _loadTextures];
    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v9 selector:"localeChanged" name:NSCurrentLocaleDidChangeNotification object:0];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v9 selector:"_asyncDeallocInstance" name:CLKClearCacheRequestNotification object:0];
  }
  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:CLKClearCacheRequestNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)NTKCharacterResourceLoader;
  [(NTKCharacterResourceLoader *)&v5 dealloc];
}

- (void)_asyncDeallocInstance
{
  unsigned int v3 = +[NSThread isMainThread];
  id v4 = objc_opt_class();
  if (v3)
  {
    clkDevice = self->_clkDevice;
    [v4 _deallocInstanceForDevice:clkDevice];
  }
  else
  {
    objc_msgSend(v4, "performSelectorOnMainThread:withObject:waitUntilDone:", "_deallocInstanceForDevice:");
  }
}

- (void)addClient
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_clients;
  objc_sync_exit(obj);
}

- (void)removeClient
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_clients - 1;
  v2->_clients = v3;
  objc_sync_exit(v2);

  if (!v3)
  {
    [(NTKCharacterResourceLoader *)v2 _asyncDeallocInstance];
  }
}

- (void)_loadMTLBufferData
{
  *(_OWORD *)&self->_bufferOffsetBackground = xmmword_15150;
  *(_OWORD *)&self->_bufferOffsetHand = xmmword_15160;
  *(_OWORD *)&self->_bufferOffsetFoot = xmmword_15170;
  *(_OWORD *)&self->_bufferOffsetSkirt = xmmword_15180;
  uint64_t v3 = (MTLBuffer *)[(MTLDevice *)self->_mtlDevice newBufferWithLength:1456 options:0];
  mtlBuffer = self->_mtlBuffer;
  self->_mtlBuffer = v3;

  objc_super v5 = (char *)[(MTLBuffer *)self->_mtlBuffer contents];
  id v6 = &v5[self->_bufferOffsetBackground];
  *((_OWORD *)v6 + 2) = xmmword_151C0;
  *((_OWORD *)v6 + 3) = unk_151D0;
  *(_OWORD *)id v6 = xmmword_151A0;
  *((_OWORD *)v6 + 1) = unk_151B0;
  id v7 = &v5[self->_bufferOffsetHead];
  *(_OWORD *)id v7 = xmmword_151E0;
  *((_OWORD *)v7 + 1) = unk_151F0;
  *((_OWORD *)v7 + 4) = xmmword_15220;
  *((_OWORD *)v7 + 5) = unk_15230;
  *((_OWORD *)v7 + 2) = xmmword_15200;
  *((_OWORD *)v7 + 3) = unk_15210;
  uint64_t v8 = &v5[self->_bufferOffsetBody];
  *(_OWORD *)uint64_t v8 = xmmword_15240;
  *((_OWORD *)v8 + 1) = unk_15250;
  *((_OWORD *)v8 + 4) = xmmword_15280;
  *((_OWORD *)v8 + 5) = unk_15290;
  *((_OWORD *)v8 + 2) = xmmword_15260;
  *((_OWORD *)v8 + 3) = unk_15270;
  v9 = &v5[self->_bufferOffsetFoot];
  *(_OWORD *)v9 = xmmword_152A0;
  *((_OWORD *)v9 + 1) = unk_152B0;
  *((_OWORD *)v9 + 4) = xmmword_152E0;
  *((_OWORD *)v9 + 5) = unk_152F0;
  *((_OWORD *)v9 + 2) = xmmword_152C0;
  *((_OWORD *)v9 + 3) = unk_152D0;
  uint64_t v10 = &v5[self->_bufferOffsetHand];
  *((_OWORD *)v10 + 2) = xmmword_15320;
  *((_OWORD *)v10 + 3) = unk_15330;
  *((_OWORD *)v10 + 4) = xmmword_15340;
  *((_OWORD *)v10 + 5) = unk_15350;
  *(_OWORD *)uint64_t v10 = xmmword_15300;
  *((_OWORD *)v10 + 1) = unk_15310;
  memcpy(&v5[self->_bufferOffsetArm], &unk_15360, 0x270uLL);
  v11 = &v5[self->_bufferOffsetSkirt];
  *(_OWORD *)v11 = xmmword_155D0;
  *((_OWORD *)v11 + 1) = unk_155E0;
  *((_OWORD *)v11 + 2) = xmmword_155F0;
  *((_OWORD *)v11 + 3) = unk_15600;
  *((_OWORD *)v11 + 6) = xmmword_15630;
  *((_OWORD *)v11 + 7) = unk_15640;
  *((_OWORD *)v11 + 4) = xmmword_15610;
  *((_OWORD *)v11 + 5) = unk_15620;
  *((_OWORD *)v11 + 10) = xmmword_15670;
  *((_OWORD *)v11 + 11) = unk_15680;
  *((_OWORD *)v11 + 8) = xmmword_15650;
  *((_OWORD *)v11 + 9) = unk_15660;
  uint64_t v12 = &v5[self->_bufferOffsetFlower];
  *((_OWORD *)v12 + 2) = xmmword_156B0;
  *((_OWORD *)v12 + 3) = unk_156C0;
  *(_OWORD *)uint64_t v12 = xmmword_15690;
  *((_OWORD *)v12 + 1) = unk_156A0;
  *((_OWORD *)v12 + 6) = xmmword_156F0;
  *((_OWORD *)v12 + 7) = unk_15700;
  *((_OWORD *)v12 + 4) = xmmword_156D0;
  *((_OWORD *)v12 + 5) = unk_156E0;
  *((_OWORD *)v12 + 10) = xmmword_15730;
  *((_OWORD *)v12 + 11) = unk_15740;
  *((_OWORD *)v12 + 8) = xmmword_15710;
  *((_OWORD *)v12 + 9) = unk_15720;
}

- (void)_setupPipelineForType:(unint64_t)a3 vertex:(id)a4 fragment:(id)a5 blending:(BOOL)a6 inLibrary:(id)a7 librarySPI:(id)a8
{
  BOOL v9 = a6;
  id v13 = a5;
  id v14 = a7;
  id v15 = a4;
  id v16 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v16 setLabel:v13];
  id v17 = [v14 newFunctionWithName:v15];

  [v16 setVertexFunction:v17];
  id v18 = [v14 newFunctionWithName:v13];

  [v16 setFragmentFunction:v18];
  unint64_t viewMtlPixelFormat = self->_viewMtlPixelFormat;
  v20 = [v16 colorAttachments];
  v21 = [v20 objectAtIndexedSubscript:0];
  [v21 setPixelFormat:viewMtlPixelFormat];

  if (v9)
  {
    objc_super v22 = [v16 colorAttachments];
    v23 = [v22 objectAtIndexedSubscript:0];
    [v23 setBlendingEnabled:1];

    v24 = [v16 colorAttachments];
    v25 = [v24 objectAtIndexedSubscript:0];
    [v25 setRgbBlendOperation:0];

    v26 = [v16 colorAttachments];
    v27 = [v26 objectAtIndexedSubscript:0];
    [v27 setAlphaBlendOperation:0];

    v28 = [v16 colorAttachments];
    v29 = [v28 objectAtIndexedSubscript:0];
    [v29 setSourceRGBBlendFactor:4];

    v30 = [v16 colorAttachments];
    v31 = [v30 objectAtIndexedSubscript:0];
    [v31 setSourceAlphaBlendFactor:4];

    v32 = [v16 colorAttachments];
    v33 = [v32 objectAtIndexedSubscript:0];
    [v33 setDestinationRGBBlendFactor:5];

    v34 = [v16 colorAttachments];
    v35 = [v34 objectAtIndexedSubscript:0];
    [v35 setDestinationAlphaBlendFactor:5];
  }
  mtlDevice = self->_mtlDevice;
  id v43 = 0;
  v37 = (objc_class *)[(MTLDevice *)mtlDevice newRenderPipelineStateWithDescriptor:v16 error:&v43];
  id v38 = v43;
  v39 = &self->super.isa + a3;
  Class v40 = v39[10];
  v39[10] = v37;

  if (!v39[10])
  {
    v41 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
    {
      v42 = self->_mtlDevice;
      *(_DWORD *)buf = 138412802;
      id v45 = v13;
      __int16 v46 = 2112;
      v47 = v42;
      __int16 v48 = 2112;
      id v49 = v38;
      _os_log_fault_impl(&dword_0, v41, OS_LOG_TYPE_FAULT, "Character Metal compilation failure: Shader=%@ Device=%@ Error=%@", buf, 0x20u);
    }
  }
}

- (void)_loadPrograms
{
  mtlDevice = self->_mtlDevice;
  id v4 = NTKGetCharacterFaceBundle();
  id v5 = [(MTLDevice *)mtlDevice newDefaultLibraryWithBundle:v4 error:0];

  [(NTKCharacterResourceLoader *)self _setupPipelineForType:0 vertex:@"simpleSpriteVSH" fragment:@"rgbaSpriteFSH" blending:1 inLibrary:v5 librarySPI:0];
  [(NTKCharacterResourceLoader *)self _setupPipelineForType:1 vertex:@"simpleSpriteVSH" fragment:@"redSpriteFSH" blending:0 inLibrary:v5 librarySPI:0];
  [(NTKCharacterResourceLoader *)self _setupPipelineForType:2 vertex:@"simpleSpriteVSH" fragment:@"alphaSpriteFSH" blending:1 inLibrary:v5 librarySPI:0];
  [(NTKCharacterResourceLoader *)self _setupPipelineForType:3 vertex:@"boneSpriteVSH" fragment:@"recoloringFSH" blending:1 inLibrary:v5 librarySPI:0];
}

- (id)getPipelineForProgramType:(unint64_t)a3
{
  return self->_renderPipelines[a3];
}

- (id)_loadBank:(id)a3 toArrays:(unint64_t)a4 allowNewKeys:(BOOL)a5
{
  BOOL v46 = a5;
  int v5 = a4;
  id v47 = a3;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v50 = self;
  CLKUIOrderedSuffixesForDevice();
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  id v55 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (!v55)
  {
    uint64_t v8 = 0;
    id v7 = 0;
    goto LABEL_42;
  }
  id v7 = 0;
  uint64_t v8 = 0;
  id v53 = *(id *)v62;
LABEL_3:
  BOOL v9 = 0;
  uint64_t v10 = v7;
  v11 = v8;
  while (1)
  {
    if (*(id *)v62 != v53) {
      objc_enumerationMutation(obj);
    }
    uint64_t v12 = *(void *)(*((void *)&v61 + 1) + 8 * (void)v9);
    bundle = v50->_bundle;
    id v14 = +[NSString stringWithFormat:@"%@%@@2x", v47, v12];
    uint64_t v15 = [(NSBundle *)bundle pathForResource:v14 ofType:@"plist"];

    id v16 = v50->_bundle;
    uint64_t v8 = (void *)v15;
    id v17 = +[NSString stringWithFormat:@"%@%@@2x", v47, v12];
    id v7 = [(NSBundle *)v16 pathForResource:v17 ofType:@"baf"];

    if (v8 && v7 != 0) {
      break;
    }
    BOOL v9 = (char *)v9 + 1;
    uint64_t v10 = v7;
    v11 = v8;
    if (v55 == v9)
    {
      id v55 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
      if (v55) {
        goto LABEL_3;
      }
      break;
    }
  }

  v19 = 0;
  if (v8 && v7)
  {
    obuint64_t j = [objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:v8];
    if (obj)
    {
      v19 = +[CLKUIMmapFile mmapFileWithPath:v7];
      if (v19)
      {
        id v43 = v7;
        v44 = v8;
        v20 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v67 = v47;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Mapping texture bank for %@", buf, 0xCu);
        }

        v42 = v19;
        id v21 = v19;
        id v49 = (char *)[v21 bytes];
        v41 = v21;
        signed int v22 = [v21 length];
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v54 = obj;
        id v52 = [v54 countByEnumeratingWithState:&v57 objects:v65 count:16];
        if (v52)
        {
          uint64_t v51 = *(void *)v58;
          arrayByLocale = v50->_arrayByLocale;
          signed int v48 = v22;
          do
          {
            for (uint64_t i = 0; i != v52; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v58 != v51) {
                objc_enumerationMutation(v54);
              }
              v25 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              v26 = [v54 objectForKeyedSubscript:v25];
              v27 = [v26 objectForKeyedSubscript:@"offset"];
              v28 = [v26 objectForKeyedSubscript:@"size"];
              v56 = v27;
              signed int v29 = [v27 intValue];
              id v30 = [v28 intValue];
              if ((int)v30 + v29 <= v22)
              {
                id v32 = v30;
                v33 = &v49[v29];
                v31 = [(NSMutableDictionary *)v50->_mapping objectForKey:v25];
                v34 = [[NTKCharacterTexture alloc] initWithData:v33 length:v32];
                if (v31)
                {
                  id v35 = [v31 unsignedIntegerValue];
                  for (uint64_t j = 0; j != 3; ++j)
                  {
                    if (((1 << j) & v5) != 0) {
                      [(NSMutableArray *)arrayByLocale[j] setObject:v34 atIndexedSubscript:v35];
                    }
                  }
                }
                else if (v46)
                {
                  v37 = +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)v50->_mapping count]];
                  [(NSMutableDictionary *)v50->_mapping setObject:v37 forKeyedSubscript:v25];

                  for (uint64_t k = 0; k != 3; ++k)
                    [(NSMutableArray *)arrayByLocale[k] addObject:v34];
                }

                signed int v22 = v48;
              }
              else
              {
                v31 = _NTKLoggingObjectForDomain();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v67 = v25;
                  _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, "Asset %@ exceeds map file", buf, 0xCu);
                }
              }
            }
            id v52 = [v54 countByEnumeratingWithState:&v57 objects:v65 count:16];
          }
          while (v52);
        }

        id v39 = v41;
        id v7 = v43;
        uint64_t v8 = v44;
        v19 = v42;
      }

      goto LABEL_43;
    }
LABEL_42:
    v19 = 0;
LABEL_43:
  }

  return v19;
}

- (void)localeChanged
{
  uint64_t v3 = CLKLocaleCurrentNumberSystem();
  uint64_t v4 = v3 == 1;
  if (v3 == 2) {
    uint64_t v4 = 2;
  }
  int v5 = self->_arrayByLocale[v4];

  objc_storeStrong((id *)&self->_array, v5);
}

- (void)_loadTextures
{
  uint64_t v3 = [(NTKCharacterResourceLoader *)self _loadBank:@"Mickey" toArrays:-1 allowNewKeys:1];
  mickeyBanuint64_t k = self->_mickeyBank;
  self->_mickeyBanuint64_t k = v3;

  int v5 = [(NTKCharacterResourceLoader *)self _loadBank:@"Minnie" toArrays:-1 allowNewKeys:1];
  minnieBanuint64_t k = self->_minnieBank;
  self->_minnieBanuint64_t k = v5;

  id v7 = [(NTKCharacterResourceLoader *)self _loadBank:@"Common-latn" toArrays:-1 allowNewKeys:1];
  commonBankLatn = self->_commonBankLatn;
  self->_commonBankLatn = v7;

  BOOL v9 = [(NTKCharacterResourceLoader *)self _loadBank:@"Common-arab" toArrays:2 allowNewKeys:0];
  commonBankArab = self->_commonBankArab;
  self->_commonBankArab = v9;

  v11 = [(NTKCharacterResourceLoader *)self _loadBank:@"Common-deva" toArrays:4 allowNewKeys:0];
  commonBankDeva = self->_commonBankDeva;
  self->_commonBankDeva = v11;

  [(NTKCharacterResourceLoader *)self localeChanged];
}

- (id)mtlTextureWithName:(id)a3 prefix:(id)a4
{
  int v5 = [a4 stringByAppendingString:a3];
  id v6 = [(NTKCharacterResourceLoader *)self mtlTextureWithName:v5];

  return v6;
}

- (id)mtlTextureWithName:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableDictionary *)self->_mapping objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@ texture is missing", (uint8_t *)&v16, 0xCu);
    }

    id v7 = +[NSNumber numberWithUnsignedInteger:-1];
  }
  BOOL v9 = v7;
  id v10 = [v7 unsignedIntegerValue];
  if (v10 >= [(NSMutableArray *)self->_array count])
  {
    id v14 = 0;
  }
  else
  {
    v11 = [(NSMutableArray *)self->_array objectAtIndexedSubscript:v10];
    uint64_t v12 = [v11 mtlTexture];

    if (!v12)
    {
      [v11 data];
      [v11 length];
      id v13 = NUNILoadMtlTextureFromMemory();
      [v11 setMtlTexture:v13];
    }
    id v14 = [v11 mtlTexture];
  }

  return v14;
}

- (id)textureWithName:(id)a3 prefix:(id)a4
{
  int v5 = [a4 stringByAppendingString:a3];
  id v6 = [(NTKCharacterResourceLoader *)self textureWithName:v5];

  return v6;
}

- (id)textureWithName:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableDictionary *)self->_mapping objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@ texture is missing", (uint8_t *)&v11, 0xCu);
    }

    id v7 = +[NSNumber numberWithUnsignedInteger:-1];
  }
  BOOL v9 = v7;

  return v9;
}

- (id)getMTLTexture:(id)a3
{
  id v4 = [a3 unsignedIntegerValue];
  if (v4 >= [(NSMutableArray *)self->_array count])
  {
    uint64_t v8 = 0;
  }
  else
  {
    int v5 = [(NSMutableArray *)self->_array objectAtIndexedSubscript:v4];
    id v6 = [v5 mtlTexture];

    if (!v6)
    {
      [v5 data];
      [v5 length];
      id v7 = NUNILoadMtlTextureFromMemory();
      [v5 setMtlTexture:v7];
    }
    uint64_t v8 = [v5 mtlTexture];
  }

  return v8;
}

- (MTLBuffer)mtlBuffer
{
  return self->_mtlBuffer;
}

- (unint64_t)bufferOffsetBackground
{
  return self->_bufferOffsetBackground;
}

- (unint64_t)bufferOffsetBody
{
  return self->_bufferOffsetBody;
}

- (unint64_t)bufferOffsetFoot
{
  return self->_bufferOffsetFoot;
}

- (unint64_t)bufferOffsetArm
{
  return self->_bufferOffsetArm;
}

- (unint64_t)bufferOffsetHand
{
  return self->_bufferOffsetHand;
}

- (unint64_t)bufferOffsetHead
{
  return self->_bufferOffsetHead;
}

- (unint64_t)bufferOffsetSkirt
{
  return self->_bufferOffsetSkirt;
}

- (unint64_t)bufferOffsetFlower
{
  return self->_bufferOffsetFlower;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlBuffer, 0);
  for (uint64_t i = 0; i != -3; --i)
    objc_storeStrong((id *)&self->_arrayByLocale[i + 2], 0);
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
  for (uint64_t j = 0; j != -4; --j)
    objc_storeStrong((id *)&self->_renderPipelines[j + 3], 0);
  objc_storeStrong((id *)&self->_mickeyBank, 0);
  objc_storeStrong((id *)&self->_minnieBank, 0);
  objc_storeStrong((id *)&self->_commonBankDeva, 0);
  objc_storeStrong((id *)&self->_commonBankArab, 0);
  objc_storeStrong((id *)&self->_commonBankLatn, 0);
  objc_storeStrong((id *)&self->_mtlDevice, 0);
  objc_storeStrong((id *)&self->_bundle, 0);

  objc_storeStrong((id *)&self->_clkDevice, 0);
}

@end