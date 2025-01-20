@interface SKTextureAtlas
+ (BOOL)canUseObjectForAtlas:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (CGImage)createCGImageFromCUINamedImage:(CGImage *)a3 withSize:(CGSize)a4 atRect:(CGRect)a5;
+ (SKTextureAtlas)atlasNamed:(NSString *)name;
+ (SKTextureAtlas)atlasWithDictionary:(NSDictionary *)properties;
+ (id)atlasFromCUIImageAtlas:(id)a3 withName:(id)a4;
+ (id)findTextureNamed:(id)a3;
+ (id)getSupportedPostfixes;
+ (id)lookupCachedTextureNamed:(id)a3;
+ (void)_exportAtlasWithDictionary:(id)a3 toFile:(id)a4;
+ (void)_exportAtlasWithDictionary:(id)a3 toFile:(id)a4 forcePOT:(BOOL)a5;
+ (void)preloadTextureAtlases:(NSArray *)textureAtlases withCompletionHandler:(void *)completionHandler;
+ (void)preloadTextureAtlasesNamed:(NSArray *)atlasNames withCompletionHandler:(void *)completionHandler;
- (BOOL)isEqualToTextureAtlas:(id)a3;
- (NSArray)textureNames;
- (SKTexture)textureNamed:(NSString *)name;
- (SKTextureAtlas)init;
- (SKTextureAtlas)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)_copyImageData;
- (id)createSubTextureFromTexture:(id)a3 andCUINamedImage:(id)a4 andOrigin:(CGPoint)a5;
- (id)createTextureFromProvider:(CGImageProvider *)a3 andSource:(CGImage *)a4;
- (id)description;
- (id)findTextureNamedFromAtlas:(id)a3;
- (void)_prePopulateCache;
- (void)commonInit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadTextures;
- (void)loadTexturesFromCUIImageAtlas:(id)a3;
- (void)parseAtlasPropertyList:(id)a3 withPath:(id)a4;
- (void)preloadWithCompletionHandler:(void *)completionHandler;
- (void)unload;
@end

@implementation SKTextureAtlas

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_prePopulateCache
{
  int v3 = [(NSDictionary *)self->_textureDict count];
  if (self->_textureDict) {
    BOOL v4 = v3 < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,SKCTileMapNodeRenderBatch>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,SKCTileMapNodeRenderBatch>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,SKCTileMapNodeRenderBatch>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,SKCTileMapNodeRenderBatch>>>::__rehash<true>((uint64_t)&self->_textureMap, vcvtps_u32_f32((float)v3 / self->_textureMap.__table_.__p3_.__value_));
    textureDict = self->_textureDict;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__SKTextureAtlas__prePopulateCache__block_invoke;
    v6[3] = &unk_263FEA3B0;
    v6[4] = self;
    [(NSDictionary *)textureDict enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __35__SKTextureAtlas__prePopulateCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v7;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
  uint64_t v11 = v9 + 32;
  id v12 = v8;
  id v15 = v12;
  std::__hash_table<std::__hash_value_type<std::string,SKTexture * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SKTexture * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SKTexture * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SKTexture * {__strong}>>>::__emplace_unique_key_args<std::string,std::pair<std::string,SKTexture * {__strong}>>(v11, (unsigned __int8 *)__p, (long long *)__p);

  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

- (void)commonInit
{
  if (-[SKTextureAtlas commonInit]::_atlasInit != -1) {
    dispatch_once(&-[SKTextureAtlas commonInit]::_atlasInit, &__block_literal_global_7);
  }
}

void __28__SKTextureAtlas_commonInit__block_invoke()
{
  v0 = [SKThreadSafeMapTable alloc];
  v1 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  uint64_t v2 = [(SKThreadSafeMapTable *)v0 initWithNSMapTable:v1];
  int v3 = (void *)_atlasDict;
  _atlasDict = v2;

  id v4 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  id v5 = (void *)_offlineAtlasCache;
  _offlineAtlasCache = (uint64_t)v4;
}

- (SKTextureAtlas)init
{
  v7.receiver = self;
  v7.super_class = (Class)SKTextureAtlas;
  uint64_t v2 = [(SKTextureAtlas *)&v7 init];
  int v3 = v2;
  if (v2)
  {
    textureDict = v2->_textureDict;
    v2->_textureDict = 0;

    atlasName = v3->_atlasName;
    v3->_atlasName = 0;

    [(SKTextureAtlas *)v3 commonInit];
  }
  return v3;
}

- (SKTextureAtlas)initWithCoder:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKTextureAtlas;
  id v5 = [(SKTextureAtlas *)&v15 init];
  id v6 = v5;
  if (v5)
  {
    [(SKTextureAtlas *)v5 commonInit];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_atlasName"];
    atlasName = v6->_atlasName;
    v6->_atlasName = (NSString *)v7;

    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
    uint64_t v11 = [v9 setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_textureDict"];
    textureDict = v6->_textureDict;
    v6->_textureDict = (NSDictionary *)v12;

    [(id)_atlasDict setObject:v6 forKey:v6->_atlasName];
    [(SKTextureAtlas *)v6 _prePopulateCache];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_atlasName forKey:@"_atlasName"];
  [v4 encodeObject:self->_textureDict forKey:@"_textureDict"];
}

- (BOOL)isEqualToTextureAtlas:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  atlasName = self->_atlasName;
  uint64_t v6 = *((void *)v4 + 2);
  if (atlasName)
  {
    if (v6 && -[NSString isEqualToString:](atlasName, "isEqualToString:")) {
      goto LABEL_4;
    }
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_20;
  }
  if (v6) {
    goto LABEL_15;
  }
LABEL_4:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->_textureDict;
  uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = -[NSDictionary objectForKey:](self->_textureDict, "objectForKey:", v11, (void)v17);
        v13 = [*((id *)v4 + 1) objectForKey:v11];
        if (!v13)
        {

LABEL_18:
          BOOL v15 = 0;
          goto LABEL_19;
        }
        char v14 = [v12 isEqualToTexture:v13];

        if ((v14 & 1) == 0) {
          goto LABEL_18;
        }
      }
      uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      BOOL v15 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_19:

LABEL_20:
  return v15;
}

- (NSArray)textureNames
{
  textureDict = self->_textureDict;
  if (textureDict) {
    [(NSDictionary *)textureDict allKeys];
  }
  else {
  int v3 = [MEMORY[0x263EFF8C0] array];
  }

  return (NSArray *)v3;
}

+ (BOOL)canUseObjectForAtlas:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (SKTextureAtlas)atlasWithDictionary:(NSDictionary *)properties
{
  id v4 = properties;
  id v5 = [(NSDictionary *)v4 allValues];
  for (unint64_t i = 0; [v5 count] > i; ++i)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:i];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"SKTextures aren't supported in [SKTextureAtlas atlasWithDictionary:].  Use UIImage, NSUrl or NSString instead." format];
LABEL_10:

      uint64_t v11 = 0;
      goto LABEL_17;
    }
    if (([a1 canUseObjectForAtlas:v7] & 1) == 0)
    {
      uint64_t v12 = (void *)MEMORY[0x263EFF940];
      v13 = (objc_class *)objc_opt_class();
      char v14 = NSStringFromClass(v13);
      [v12 raise:*MEMORY[0x263EFF4A0], @"Unsupported class:%@ passed into [SKTextureAtlas atlasWithDictionary:].  Use UIImage, NSUrl or NSString instead.", v14 format];

      goto LABEL_10;
    }
  }
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[NSDictionary hash](v4, "hash"));
  uint64_t v9 = [(id)_atlasDict objectForKey:v8];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v11 = objc_alloc_init(SKTextureAtlas);
    objc_storeStrong((id *)&v11->_atlasName, v8);
    BOOL v15 = [(NSDictionary *)v4 objectForKey:@"format"];
    v16 = v15;
    if (v15 && ([v15 isEqualToString:@"APPL"] & 1) != 0)
    {
      [(SKTextureAtlas *)v11 parseAtlasPropertyList:v4 withPath:0];
    }
    else
    {
      long long v17 = objc_alloc_init(SKTextureAtlasPacker);
      id v20 = 0;
      [(SKTextureAtlasPacker *)v17 generateTextureAtlasImages:v4 outputDictionary:&v20 forcePOT:0];
      id v18 = v20;
      [(SKTextureAtlas *)v11 parseAtlasPropertyList:v18 withPath:0];
    }
  }

LABEL_17:

  return v11;
}

- (void)parseAtlasPropertyList:(id)a3 withPath:(id)a4
{
  uint64_t v152 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v103 = a4;
  v104 = v5;
  if (v5)
  {
    v102 = [v5 objectForKey:@"format"];
    if (v102 && [v102 isEqualToString:@"APPL"])
    {
      uint64_t v6 = [v5 objectForKey:@"version"];
      if ([v6 intValue] == 1)
      {
        v97 = v6;
        uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
        [v5 objectForKey:@"images"];
        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [obj countByEnumeratingWithState:&v142 objects:v151 count:16];
        if (!v8) {
          goto LABEL_45;
        }
        uint64_t v100 = *(void *)v143;
        __asm { FMOV            V0.2D, #0.5 }
        float64x2_t v96 = _Q0;
        while (1)
        {
          uint64_t v14 = 0;
          uint64_t v98 = v8;
          do
          {
            if (*(void *)v143 != v100) {
              objc_enumerationMutation(obj);
            }
            BOOL v15 = *(void **)(*((void *)&v142 + 1) + 8 * v14);
            objc_msgSend(v15, "objectForKey:", @"path", *(_OWORD *)&v96);
            id v108 = (id)objc_claimAutoreleasedReturnValue();
            CGSize v141 = (CGSize)0;
            v16 = [v15 objectForKey:@"size"];
            uint64_t v107 = v14;
            CGSize v141 = CGSizeFromString(v16);

            CGSize v140 = v141;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v17 = +[SKTexture textureWithCGImage:](SKTexture, "textureWithCGImage:", [v108 CGImage]);
              goto LABEL_23;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v18 = CGImageSourceCreateWithURL((CFURLRef)v108, 0);
              long long v19 = v18;
              if (v18)
              {
                ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v18, 0, 0);
                CFRelease(v19);
                long long v17 = +[SKTexture textureWithCGImage:ImageAtIndex];
                CGImageRelease(ImageAtIndex);
                goto LABEL_23;
              }
LABEL_18:
              long long v17 = 0;
              goto LABEL_23;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_18;
            }
            id v21 = v108;
            if (v103)
            {
              id v22 = [v103 stringByAppendingPathComponent:v21];
            }
            else
            {
              id v22 = v21;
            }
            v23 = v22;
            long long v17 = +[SKTexture textureWithImageNamed:v22];
            v24 = [v21 lowercaseString];
            BOOL v25 = [v24 rangeOfString:@"@2x"] == 0x7FFFFFFFFFFFFFFFLL;

            if (!v25) {
              CGSize v140 = (CGSize)vmulq_f64((float64x2_t)v140, v96);
            }

LABEL_23:
            [v17 setTextureDimension:&v140 withPixelSize:&v141];
            v26 = [v15 objectForKey:@"subimages"];
            v113 = v17;
            long long v138 = 0u;
            long long v139 = 0u;
            long long v136 = 0u;
            long long v137 = 0u;
            id v109 = v26;
            uint64_t v27 = [v109 countByEnumeratingWithState:&v136 objects:v150 count:16];
            if (v27)
            {
              uint64_t v111 = *(void *)v137;
              do
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v137 != v111) {
                    objc_enumerationMutation(v109);
                  }
                  v29 = *(void **)(*((void *)&v136 + 1) + 8 * i);
                  v30 = [v29 objectForKey:@"aliases"];
                  v31 = [v29 objectForKey:@"textureRect"];
                  CGRect v153 = CGRectFromString(v31);
                  double y = v153.origin.y;
                  double x = v153.origin.x;
                  double width = v153.size.width;
                  double height = v153.size.height;

                  v34 = [v29 objectForKey:@"spriteOffset"];
                  CGPoint v35 = CGPointFromString(v34);

                  v36 = [v29 objectForKey:@"spriteSourceSize"];
                  CGSize v37 = CGSizeFromString(v36);

                  v38 = [v29 objectForKey:@"textureRotated"];
                  uint64_t v39 = [v38 BOOLValue];

                  if (v39) {
                    double v40 = width;
                  }
                  else {
                    double v40 = height;
                  }
                  if (v39) {
                    double v41 = height;
                  }
                  else {
                    double v41 = width;
                  }
                  v42 = +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v113, x / v141.width, (v141.height - (y + height)) / v141.height, width / v141.width, height / v141.height);
                  objc_msgSend(v42, "setCropOffset:", (v35.x - (v37.width - v41) * 0.5) / v41, (v35.y - (v37.height - v40) * 0.5) / v40);
                  [v42 setIsRotated:v39];
                  objc_msgSend(v42, "setCropScale:", v41 / v37.width, v40 / v37.height);
                  v43 = [v29 objectForKey:@"name"];
                  [v42 setSubTextureName:v43];
                  [v42 setOriginalAtlasName:self->_atlasName];
                  [(NSDictionary *)v7 setObject:v42 forKey:v43];
                  long long v134 = 0u;
                  long long v135 = 0u;
                  long long v132 = 0u;
                  long long v133 = 0u;
                  id v44 = v30;
                  uint64_t v45 = [v44 countByEnumeratingWithState:&v132 objects:v149 count:16];
                  if (v45)
                  {
                    uint64_t v46 = *(void *)v133;
                    do
                    {
                      for (uint64_t j = 0; j != v45; ++j)
                      {
                        if (*(void *)v133 != v46) {
                          objc_enumerationMutation(v44);
                        }
                        [(NSDictionary *)v7 setObject:v42 forKey:*(void *)(*((void *)&v132 + 1) + 8 * j)];
                      }
                      uint64_t v45 = [v44 countByEnumeratingWithState:&v132 objects:v149 count:16];
                    }
                    while (v45);
                  }
                }
                uint64_t v27 = [v109 countByEnumeratingWithState:&v136 objects:v150 count:16];
              }
              while (v27);
            }

            uint64_t v14 = v107 + 1;
          }
          while (v107 + 1 != v98);
          uint64_t v8 = [obj countByEnumeratingWithState:&v142 objects:v151 count:16];
          if (!v8)
          {
LABEL_45:

            textureDict = self->_textureDict;
            self->_textureDict = v7;

            uint64_t v6 = v97;
            goto LABEL_80;
          }
        }
      }
      [MEMORY[0x263EFF940] raise:@"Unsupported Texture Atlas Format" format:@"Unsupported Texture Atlas Format Code 3"];
LABEL_80:

      goto LABEL_81;
    }
    v49 = [v5 objectForKey:@"metadata"];
    v50 = v49;
    if (!v49)
    {
      [MEMORY[0x263EFF940] raise:@"Unsupported Texture Atlas Format" format:@"Unsupported Texture Atlas Format Code 2"];
LABEL_82:

      goto LABEL_83;
    }
    v51 = [v49 objectForKey:@"format"];
    if (v51)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v51 intValue] == 3)
      {
        v99 = v51;
        v101 = v50;
        v52 = [MEMORY[0x263EFF9A0] dictionary];
        v117 = +[SKTexture textureWithImageNamed:self->_atlasName];
        v53 = [v50 objectForKey:@"size"];
        CGSize v54 = CGSizeFromString(v53);

        v119 = [v104 objectForKey:@"frames"];
        [v119 allKeys];
        long long v130 = 0u;
        long long v131 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        id v110 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v55 = [v110 countByEnumeratingWithState:&v128 objects:v148 count:16];
        if (v55)
        {
          id obja = *(id *)v129;
          do
          {
            for (uint64_t k = 0; k != v55; ++k)
            {
              if (*(id *)v129 != obja) {
                objc_enumerationMutation(v110);
              }
              uint64_t v57 = *(void *)(*((void *)&v128 + 1) + 8 * k);
              v58 = [v119 objectForKey:v57];
              v59 = [v58 objectForKey:@"aliases"];
              v60 = [v58 objectForKey:@"textureRect"];
              CGRect v154 = CGRectFromString(v60);
              double v112 = v154.origin.x;
              double v114 = v154.size.width;
              double v61 = v154.origin.y;
              double v62 = v154.size.height;

              v63 = [v58 objectForKey:@"spriteSize"];
              CGSize v64 = CGSizeFromString(v63);

              v65 = [v58 objectForKey:@"spriteOffset"];
              CGPoint v66 = CGPointFromString(v65);

              v67 = [v58 objectForKey:@"spriteSourceSize"];
              CGSize v68 = CGSizeFromString(v67);

              v69 = [v58 objectForKey:@"textureRotated"];
              uint64_t v70 = [v69 BOOLValue];

              v71 = +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v117, v112 / v54.width, (v54.height - (v61 + v62)) / v54.height, v114 / v54.width, v62 / v54.height);
              objc_msgSend(v71, "setCropOffset:", v66.x / v64.width, v66.y / v64.height);
              [v71 setIsRotated:v70];
              objc_msgSend(v71, "setCropScale:", v64.width / v68.width, v64.height / v68.height);
              [v71 setSubTextureName:v57];
              [v71 setOriginalAtlasName:self->_atlasName];
              [(NSDictionary *)v52 setObject:v71 forKey:v57];
              long long v126 = 0u;
              long long v127 = 0u;
              long long v124 = 0u;
              long long v125 = 0u;
              id v72 = v59;
              uint64_t v73 = [v72 countByEnumeratingWithState:&v124 objects:v147 count:16];
              if (v73)
              {
                uint64_t v74 = *(void *)v125;
                do
                {
                  for (uint64_t m = 0; m != v73; ++m)
                  {
                    if (*(void *)v125 != v74) {
                      objc_enumerationMutation(v72);
                    }
                    [(NSDictionary *)v52 setObject:v71 forKey:*(void *)(*((void *)&v124 + 1) + 8 * m)];
                  }
                  uint64_t v73 = [v72 countByEnumeratingWithState:&v124 objects:v147 count:16];
                }
                while (v73);
              }
            }
            uint64_t v55 = [v110 countByEnumeratingWithState:&v128 objects:v148 count:16];
          }
          while (v55);
        }

        v76 = self->_textureDict;
        self->_textureDict = v52;
LABEL_77:

LABEL_81:
        [(SKTextureAtlas *)self _prePopulateCache];
        goto LABEL_82;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v51 intValue] == 1)
      {
        v99 = v51;
        v101 = v50;
        v77 = [MEMORY[0x263EFF9A0] dictionary];
        v78 = [v50 objectForKey:@"textureFileName"];
        v117 = +[SKTexture textureWithImageNamed:v78];

        v79 = [v101 objectForKey:@"size"];
        CGSize v80 = CGSizeFromString(v79);

        v119 = [v104 objectForKey:@"frames"];
        [v119 allKeys];
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        id v110 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v81 = [v110 countByEnumeratingWithState:&v120 objects:v146 count:16];
        if (v81)
        {
          uint64_t v82 = *(void *)v121;
          do
          {
            for (uint64_t n = 0; n != v81; ++n)
            {
              if (*(void *)v121 != v82) {
                objc_enumerationMutation(v110);
              }
              uint64_t v84 = *(void *)(*((void *)&v120 + 1) + 8 * n);
              v85 = [v119 objectForKey:v84];
              v86 = [v85 objectForKey:@"frame"];
              CGRect v155 = CGRectFromString(v86);
              double v87 = v155.origin.x;
              double v88 = v155.origin.y;
              double v89 = v155.size.width;
              double v90 = v155.size.height;

              v91 = [v85 objectForKey:@"offset"];
              CGPoint v92 = CGPointFromString(v91);

              v93 = [v85 objectForKey:@"sourceSize"];
              CGSize v94 = CGSizeFromString(v93);

              v95 = +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v117, v87 / v80.width, (v80.height - (v88 + v90)) / v80.height, v89 / v80.width, v90 / v80.height);
              objc_msgSend(v95, "setCropOffset:", v92.x, v92.y);
              [v95 setIsRotated:0];
              objc_msgSend(v95, "setCropScale:", v89 / v94.width, v90 / v94.height);
              [(NSDictionary *)v77 setObject:v95 forKey:v84];
            }
            uint64_t v81 = [v110 countByEnumeratingWithState:&v120 objects:v146 count:16];
          }
          while (v81);
        }

        v76 = self->_textureDict;
        self->_textureDict = v77;
        goto LABEL_77;
      }
    }

    goto LABEL_81;
  }
  [MEMORY[0x263EFF940] raise:@"Unsupported Texture Atlas Format" format:@"Unsupported Texture Atlas Format Code 1"];
LABEL_83:
}

- (void)loadTextures
{
  id v26 = [MEMORY[0x263F38378] defaultUICatalogForBundle:0];
  id v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];
  double v5 = v4;

  uint64_t v6 = [MEMORY[0x263F1C5C0] currentDevice];
  unint64_t v7 = [v6 userInterfaceIdiom];

  uint64_t v8 = [v26 namedImageAtlasWithName:self->_atlasName scaleFactor:__deviceClassForInterfaceIdiom(v7) deviceIdiom:v5];
  if (v8)
  {
    uint64_t v9 = +[SKAnalytics instance];
    [v9 sendAnalyticsDataWithKey:@"com.apple.spritekit.atlas.coreui"];

    [(SKTextureAtlas *)self loadTexturesFromCUIImageAtlas:v8];
LABEL_15:
    [(id)_atlasDict setObject:self forKey:self->_atlasName];
    goto LABEL_16;
  }
  id v10 = +[SKAnalytics instance];
  [v10 sendAnalyticsDataWithKey:@"com.apple.spritekit.atlas.local"];

  uint64_t v11 = SKGetResourceBundle();
  uint64_t v12 = [v11 pathForResource:self->_atlasName ofType:@"plist"];

  if (!v12)
  {
    v13 = [(NSString *)self->_atlasName pathExtension];
    uint64_t v14 = [v13 caseInsensitiveCompare:@"plist"];

    atlasName = self->_atlasName;
    if (v14)
    {
      v16 = [(NSString *)atlasName pathExtension];
      uint64_t v17 = [v16 caseInsensitiveCompare:@"atlasc"];

      id v18 = self->_atlasName;
      if (v17)
      {
        long long v19 = [(NSString *)self->_atlasName stringByAppendingString:@".atlasc"];
        id v20 = [(NSString *)self->_atlasName lastPathComponent];
        id v21 = [v19 stringByAppendingPathComponent:v20];
      }
      else
      {
        long long v19 = [(NSString *)self->_atlasName lastPathComponent];
        id v22 = [v19 stringByDeletingPathExtension];
        id v21 = [(NSString *)v18 stringByAppendingPathComponent:v22];
      }
    }
    else
    {
      id v21 = atlasName;
    }
    v23 = SKGetResourceBundle();
    uint64_t v12 = [v23 pathForResource:v21 ofType:@"plist"];
  }
  v24 = [v12 stringByDeletingLastPathComponent];
  if (v12)
  {
    BOOL v25 = [(id)_offlineAtlasCache objectForKey:v12];
    if (!v25)
    {
      BOOL v25 = [NSDictionary dictionaryWithContentsOfFile:v12];
    }
    [(SKTextureAtlas *)self parseAtlasPropertyList:v25 withPath:v24];
    [(id)_offlineAtlasCache removeObjectForKey:v12];

    goto LABEL_15;
  }
  NSLog(&cfstr_TextureAtlasCa.isa, self->_atlasName);

LABEL_16:
}

+ (SKTextureAtlas)atlasNamed:(NSString *)name
{
  id v3 = name;
  double v4 = [(id)_atlasDict objectForKey:v3];
  double v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = objc_alloc_init(SKTextureAtlas);
    uint64_t v7 = [(NSString *)v3 stringByDeletingPathExtension];
    atlasName = v6->_atlasName;
    v6->_atlasName = (NSString *)v7;

    [(SKTextureAtlas *)v6 loadTextures];
  }

  return v6;
}

- (id)createTextureFromProvider:(CGImageProvider *)a3 andSource:(CGImage *)a4
{
  double v5 = (__IOSurface *)CGImageProviderCopyIOSurface();
  if (!v5)
  {
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  uint64_t v6 = v5;
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(v5);
  ColorSpace = CGImageGetColorSpace(a4);
  int ProcessColorModel = CGColorSpaceGetProcessColorModel();
  BOOL v10 = CGColorSpaceUsesExtendedRange(ColorSpace);
  switch(PixelFormat)
  {
    case 0x52476841:
      if (ProcessColorModel != 1 || !v10)
      {
        uint64_t v12 = 0;
        goto LABEL_16;
      }
      uint64_t v11 = 10;
      break;
    case 0x52474241:
      uint64_t v11 = 3;
      break;
    case 0x42475241:
      uint64_t v11 = 4;
      break;
    default:
      uint64_t v12 = 0;
      NSLog(&cfstr_SktexturePixel.isa, PixelFormat);
      goto LABEL_16;
  }
  uint64_t ID = IOSurfaceGetID(v6);
  size_t Width = IOSurfaceGetWidth(v6);
  uint64_t v12 = +[SKTexture textureWithIOSurfaceID:ID width:Width height:IOSurfaceGetHeight(v6) format:v11];
LABEL_16:
  CFRelease(v6);
LABEL_17:

  return v12;
}

- (id)createSubTextureFromTexture:(id)a3 andCUINamedImage:(id)a4 andOrigin:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (CGImage *)[v9 croppedImage];
  [v9 size];
  double v12 = v11;
  [v9 scale];
  double v14 = v13;
  [v9 size];
  double v16 = v15;
  [v9 scale];
  double v17 = v12 * v14;
  double v19 = v16 * v18;
  double v60 = v17;
  *(double *)v65 = v17;
  *(double *)&v65[1] = v16 * v18;
  double Width = (double)CGImageGetWidth(v10);
  double Height = (double)CGImageGetHeight(v10);
  v64[0] = Width;
  v64[1] = Height;
  if (v8)
  {
    [v8 pixelSize];
    double v23 = v22;
    [v9 scale];
    double v25 = v24;
    [v8 pixelSize];
    double v27 = v26;
    [v9 scale];
    double v62 = v23 / v25;
    double v63 = v27 / v28;
    [v8 pixelSize];
    double v30 = v29;
    [v8 pixelSize];
    double v32 = v31;
    [v8 pixelSize];
    double v34 = v33;
    [v8 pixelSize];
    v36 = +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v8, x / v30, y / v32, Width / v34, Height / v35);
    [v36 setIsFlipped:1];
    if ([v9 isAlphaCropped])
    {
      [v9 alphaCroppedRect];
      double v38 = v37;
      [v9 alphaCroppedRect];
      double v40 = v39;
      [v9 alphaCroppedRect];
      objc_msgSend(v36, "setCropOffset:", (v38 - (v60 - (v38 + Width))) * 0.5 / Width, (v19 - (v40 + v41) - (v19 - (v19 - (v40 + v41) + Height))) * 0.5 / Height);
      objc_msgSend(v36, "setCropScale:", Width / v60, Height / v19);
    }
    [v8 pixelSize];
    v61[0] = v42;
    v61[1] = v43;
    [v36 setTextureDimension:&v62 withPixelSize:v61];
  }
  else if ([v9 isAlphaCropped])
  {
    [v9 alphaCroppedRect];
    double v45 = v44;
    [v9 alphaCroppedRect];
    double v47 = v46;
    [v9 alphaCroppedRect];
    double v49 = v48;
    [v9 alphaCroppedRect];
    double v51 = v50;
    [v9 alphaCroppedRect];
    v53 = +[SKTextureAtlas createCGImageFromCUINamedImage:withSize:atRect:](SKTextureAtlas, "createCGImageFromCUINamedImage:withSize:atRect:", v10, v60, v19, v45, v19 - (v47 + v49), v51, v52);
    v36 = +[SKTexture textureWithCGImage:v53];
    CGImageRelease(v53);
    [v9 scale];
    double v55 = v54;
    [v9 scale];
    double v62 = v60 / v55;
    double v63 = v19 / v56;
    [v36 setTextureDimension:&v62 withPixelSize:v65];
  }
  else
  {
    v36 = +[SKTexture textureWithCGImage:v10];
    [v9 size];
    double v62 = v57;
    double v63 = v58;
    [v36 setTextureDimension:&v62 withPixelSize:v64];
  }

  return v36;
}

- (void)loadTexturesFromCUIImageAtlas:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v21 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  memset(v29, 0, sizeof(v29));
  int v30 = 1065353216;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [v3 imageNames];
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v8 = [v3 imageWithName:v7];
        uint64_t v9 = [v8 croppedImage];
        if (v7) {
          BOOL v10 = v9 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          v24[0] = 0;
          int IsSubimage = CGImageIsSubimage();
          if (v24[0]) {
            int v12 = IsSubimage;
          }
          else {
            int v12 = 0;
          }
          if (v12 == 1)
          {
            double v13 = std::__hash_table<std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::__unordered_map_hasher<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::hash<CGImage *>,std::equal_to<CGImage *>,true>,std::__unordered_map_equal<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::equal_to<CGImage *>,std::hash<CGImage *>,true>,std::allocator<std::__hash_value_type<CGImage *,SKTexture * {__strong}>>>::find<CGImage *>(v29, v24);
            if (v13)
            {
              id v14 = (id)v13[3];
            }
            else
            {
              id v14 = [(SKTextureAtlas *)self createTextureFromProvider:CGImageGetImageProvider() andSource:v24[0]];
              if (v14)
              {
                double v31 = v24;
                double v15 = (id *)std::__hash_table<std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::__unordered_map_hasher<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::hash<CGImage *>,std::equal_to<CGImage *>,true>,std::__unordered_map_equal<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::equal_to<CGImage *>,std::hash<CGImage *>,true>,std::allocator<std::__hash_value_type<CGImage *,SKTexture * {__strong}>>>::__emplace_unique_key_args<CGImage *,std::piecewise_construct_t const&,std::tuple<CGImage * const&>,std::tuple<>>((uint64_t)v29, v24, (uint64_t)&std::piecewise_construct, &v31);
                objc_storeStrong(v15 + 3, v14);
                id v16 = v14;
              }
            }
          }
          else
          {
            id v14 = 0;
          }
          double v17 = -[SKTextureAtlas createSubTextureFromTexture:andCUINamedImage:andOrigin:](self, "createSubTextureFromTexture:andCUINamedImage:andOrigin:", v14, v8, *(double *)&v24[1], *(double *)&v24[2]);
          if (objc_opt_respondsToSelector()) {
            uint64_t v18 = [v3 completeTextureExtrusion] ^ 1;
          }
          else {
            uint64_t v18 = 1;
          }
          [v17 setNeedsExtrusionWorkaround:v18];
          double v19 = [v7 stringByDeletingPathExtension];
          [v17 _setImageName:v19];

          [(NSDictionary *)v21 setObject:v17 forKey:v7];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v4);
  }

  self->_isCUIImageAtlas = 1;
  textureDict = self->_textureDict;
  self->_textureDict = v21;

  std::__hash_table<std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::__unordered_map_hasher<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::hash<CGImage *>,std::equal_to<CGImage *>,true>,std::__unordered_map_equal<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::equal_to<CGImage *>,std::hash<CGImage *>,true>,std::allocator<std::__hash_value_type<CGImage *,SKTexture * {__strong}>>>::~__hash_table((uint64_t)v29);
}

+ (id)atlasFromCUIImageAtlas:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [(id)_atlasDict objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v9 = objc_alloc_init(SKTextureAtlas);
    uint64_t v10 = [v6 stringByDeletingPathExtension];
    atlasName = v9->_atlasName;
    v9->_atlasName = (NSString *)v10;

    [(id)_atlasDict setObject:v9 forKey:v9->_atlasName];
    if (v5) {
      [(SKTextureAtlas *)v9 loadTexturesFromCUIImageAtlas:v5];
    }
  }

  return v9;
}

- (void)preloadWithCompletionHandler:(void *)completionHandler
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = completionHandler;
  v6[0] = self;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  +[SKTextureAtlas preloadTextureAtlases:v5 withCompletionHandler:v4];
}

+ (void)preloadTextureAtlases:(NSArray *)textureAtlases withCompletionHandler:(void *)completionHandler
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = textureAtlases;
  id v6 = completionHandler;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        if (*(void *)(v12 + 8))
        {
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          double v13 = [*(id *)(v12 + 8) objectEnumerator];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v18;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v18 != v15) {
                  objc_enumerationMutation(v13);
                }
                [v7 addObject:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
              }
              while (v14 != v16);
              uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v14);
          }
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  +[SKTexture preloadTextures:v7 withCompletionHandler:v6];
}

+ (void)preloadTextureAtlasesNamed:(NSArray *)atlasNames withCompletionHandler:(void *)completionHandler
{
  id v5 = atlasNames;
  id v6 = completionHandler;
  id v7 = dispatch_get_global_queue(17, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke;
  v10[3] = &unk_263FEA428;
  uint64_t v11 = v5;
  id v12 = v6;
  id v8 = v6;
  uint64_t v9 = v5;
  dispatch_async(v7, v10);
}

void __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];
  double v4 = v3;

  id v5 = [MEMORY[0x263F38378] defaultUICatalogForBundle:0];
  id v6 = (void *)[*(id *)(a1 + 32) mutableCopy];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_263FEA3D8;
  id v8 = v6;
  id v17 = v8;
  id v9 = v7;
  id v18 = v9;
  id v19 = *(id *)(a1 + 40);
  uint64_t v10 = (void (**)(void, void))MEMORY[0x21052F3F0](v16);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke_3;
    v12[3] = &unk_263FEA400;
    id v13 = v8;
    id v14 = v9;
    uint64_t v15 = v10;
    [v5 preloadNamedAtlasWithScaleFactor:v11 andNames:v12 completionHandler:v4];
  }
  else
  {
    v10[2](v10, 0);
  }
}

void __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = +[SKTextureAtlas atlasNamed:](SKTextureAtlas, "atlasNamed:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10);
        if (v8) {
          [*(id *)(a1 + 40) addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v3, *(void *)(a1 + 40));
  }
}

void __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke_3(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v15 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v10 = (void *)a1[4];
        long long v11 = [v9 name];
        [v10 removeObject:v11];

        long long v12 = (void *)a1[5];
        long long v13 = [v9 name];
        id v14 = +[SKTextureAtlas atlasFromCUIImageAtlas:v9 withName:v13];
        [v12 addObject:v14];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (id)description
{
  textureDict = self->_textureDict;
  if (textureDict && (uint64_t v4 = [(NSDictionary *)textureDict count]) != 0)
  {
    uint64_t v5 = v4;
    uint64_t v6 = NSString;
    atlasName = self->_atlasName;
    id v8 = [(NSDictionary *)self->_textureDict allValues];
    uint64_t v9 = [v8 description];
    long long v10 = [v6 stringWithFormat:@"<SKTextureAtlas> '%@' %ld textures:\n %@", atlasName, v5, v9];
  }
  else
  {
    long long v10 = [NSString stringWithFormat:@"<SKTextureAtlas> '%@' 0 textures", self->_atlasName];
  }

  return v10;
}

- (void)dealloc
{
  [(SKTextureAtlas *)self unload];
  v3.receiver = self;
  v3.super_class = (Class)SKTextureAtlas;
  [(SKTextureAtlas *)&v3 dealloc];
}

- (id)findTextureNamedFromAtlas:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  uint64_t v5 = std::__hash_table<std::__hash_value_type<std::string,SKTexture * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SKTexture * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SKTexture * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SKTexture * {__strong}>>>::find<std::string>(&self->_textureMap.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
  if (v5)
  {
    id v6 = *((id *)v5 + 5);
  }
  else
  {
    uint64_t v7 = [v4 pathExtension];
    double v31 = self;
    uint64_t v8 = [v7 length];

    int v30 = +[SKTextureAtlas getSupportedPostfixes];
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v30, "count"));
    if (v8)
    {
      uint64_t v10 = [v4 stringByDeletingPathExtension];

      id v4 = (id)v10;
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v11 = v30;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = [v4 stringByAppendingString:*(void *)(*((void *)&v41 + 1) + 8 * i)];
          [v9 addObject:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v12);
    }

    if (v31->_textureDict)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v16 = v9;
      long long v28 = v16;
      uint64_t v26 = [v16 countByEnumeratingWithState:&v37 objects:v48 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v38 != v27) {
              objc_enumerationMutation(v16);
            }
            uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * j);
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v18 = [(NSDictionary *)v31->_textureDict allKeys];
            obuint64_t j = v18;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v47 count:16];
            if (v19)
            {
              uint64_t v20 = *(void *)v34;
              while (2)
              {
                for (uint64_t k = 0; k != v19; ++k)
                {
                  if (*(void *)v34 != v20) {
                    objc_enumerationMutation(obj);
                  }
                  id v22 = *(id *)(*((void *)&v33 + 1) + 8 * k);
                  long long v23 = [v22 stringByDeletingPathExtension];

                  if (![v23 caseInsensitiveCompare:v17])
                  {
                    long long v24 = [(NSDictionary *)v31->_textureDict objectForKey:v22];
                    id v6 = (id)[v24 copy];
                    [v6 setRootAtlas:v31];

                    goto LABEL_31;
                  }
                }
                long long v18 = obj;
                uint64_t v19 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }

            id v16 = v28;
          }
          uint64_t v26 = [v28 countByEnumeratingWithState:&v37 objects:v48 count:16];
        }
        while (v26);
      }
    }
    id v6 = (id)[0 copy];
    [v6 setRootAtlas:v31];
LABEL_31:
  }
  if (v46 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (SKTexture)textureNamed:(NSString *)name
{
  objc_super v3 = [(SKTextureAtlas *)self findTextureNamedFromAtlas:name];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[SKTexture _textureWithImageNamed:@"MissingResource.png"];
  }
  id v6 = v5;

  return (SKTexture *)v6;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SKAttributeValue * {__strong}>>>::~__hash_table((uint64_t)&self->_textureMap);
  objc_storeStrong((id *)&self->_atlasName, 0);

  objc_storeStrong((id *)&self->_textureDict, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  return self;
}

+ (CGImage)createCGImageFromCUINamedImage:(CGImage *)a3 withSize:(CGSize)a4 atRect:(CGRect)a5
{
  if (!a3) {
    return 0;
  }
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v9 = a4.height;
  CGFloat v10 = a4.width;
  size_t v12 = a4.width;
  size_t v13 = a4.height;
  id v14 = malloc_type_malloc((4 * v13 * v12), 0x4C290508uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v16 = CGBitmapContextCreate(v14, v12, v13, 8uLL, (4 * v12), DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  v19.origin.CGFloat x = 0.0;
  v19.origin.CGFloat y = 0.0;
  v19.size.CGFloat width = v10;
  v19.size.CGFloat height = v9;
  CGContextClearRect(v16, v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGContextDrawImage(v16, v20, a3);
  Image = CGBitmapContextCreateImage(v16);
  CGContextRelease(v16);
  free(v14);
  return Image;
}

+ (id)getSupportedPostfixes
{
  if (!+[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes)
  {
    uint64_t v2 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v3 = [v2 userInterfaceIdiom];

    id v4 = [MEMORY[0x263F1C920] mainScreen];
    [v4 scale];
    double v6 = v5;

    if (v3 == 1)
    {
      uint64_t v7 = &unk_26BF04810;
      uint64_t v8 = (void *)+[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes;
      if (v6 >= 2.0) {
        uint64_t v7 = &unk_26BF047F8;
      }
    }
    else if (v6 < 2.0)
    {
      uint64_t v8 = (void *)+[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes;
      uint64_t v7 = &unk_26BF04870;
    }
    else
    {
      CGFloat v9 = [MEMORY[0x263F1C920] mainScreen];
      CGFloat v10 = [v9 currentMode];
      [v10 size];
      double v12 = v11;

      size_t v13 = [MEMORY[0x263F1C920] mainScreen];
      [v13 bounds];
      double v15 = v14;

      id v16 = [MEMORY[0x263F1C920] mainScreen];
      [v16 bounds];
      double v18 = v17;

      if (v15 >= v18) {
        double v19 = v15;
      }
      else {
        double v19 = v18;
      }
      uint64_t v8 = (void *)+[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes;
      if (v19 == 736.0)
      {
        uint64_t v7 = &unk_26BF04828;
      }
      else
      {
        uint64_t v7 = &unk_26BF04858;
        if (v12 == 1136.0) {
          uint64_t v7 = &unk_26BF04840;
        }
      }
    }
    +[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes = (uint64_t)v7;
  }
  CGRect v20 = (void *)+[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes;

  return v20;
}

+ (id)findTextureNamed:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 pathExtension];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [v3 stringByDeletingPathExtension];

    id v3 = (id)v6;
  }
  if (_atlasDict)
  {
    uint64_t v7 = [(id)_atlasDict keyEnumerator];
    for (uint64_t i = 0; ; uint64_t i = v9)
    {
      CGFloat v9 = [v7 nextObject];

      if (!v9)
      {

        goto LABEL_9;
      }
      CGFloat v10 = [(id)_atlasDict objectForKey:v9];
      double v11 = [v10 findTextureNamedFromAtlas:v3];
      if (v11) {
        break;
      }
    }
    id v13 = v11;

    id v36 = v13;
  }
  else
  {
LABEL_9:
    double v12 = SKGetResourceBundle();
    id v13 = [v12 pathsForResourcesOfType:@".atlasc" inDirectory:&stru_26BEEFD10];

    if (v13)
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      obuint64_t j = v13;
      uint64_t v14 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
      if (v14)
      {
        uint64_t v47 = *(void *)v71;
        do
        {
          uint64_t v45 = v14;
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v71 != v47) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(void **)(*((void *)&v70 + 1) + 8 * j);
            v53 = [v16 lastPathComponent];
            double v17 = objc_msgSend((id)_atlasDict, "objectForKey:");
            BOOL v18 = v17 == 0;

            if (v18)
            {
              double v19 = [v53 stringByDeletingPathExtension];
              CGRect v20 = [v16 stringByAppendingPathComponent:v19];

              double v51 = [v20 stringByAppendingString:@".plist"];

              uint64_t v21 = [(id)_offlineAtlasCache objectForKey:v51];
              if (!v21)
              {
                uint64_t v21 = [NSDictionary dictionaryWithContentsOfFile:v51];
                if (v21) {
                  [(id)_offlineAtlasCache setObject:v21 forKey:v51];
                }
              }
              char v46 = v21;
              double v48 = +[SKTextureAtlas getSupportedPostfixes];
              id v22 = [v21 objectForKey:@"images"];
              long long v68 = 0u;
              long long v69 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              id v49 = v22;
              uint64_t v39 = [v49 countByEnumeratingWithState:&v66 objects:v77 count:16];
              if (v39)
              {
                uint64_t v41 = *(void *)v67;
                do
                {
                  for (uint64_t k = 0; k != v39; ++k)
                  {
                    if (*(void *)v67 != v41) {
                      objc_enumerationMutation(v49);
                    }
                    long long v23 = [*(id *)(*((void *)&v66 + 1) + 8 * k) objectForKey:@"subimages"];
                    long long v64 = 0u;
                    long long v65 = 0u;
                    long long v62 = 0u;
                    long long v63 = 0u;
                    id v50 = v23;
                    uint64_t v40 = [v50 countByEnumeratingWithState:&v62 objects:v76 count:16];
                    if (v40)
                    {
                      uint64_t v42 = *(void *)v63;
                      do
                      {
                        for (uint64_t m = 0; m != v40; ++m)
                        {
                          if (*(void *)v63 != v42) {
                            objc_enumerationMutation(v50);
                          }
                          long long v24 = [*(id *)(*((void *)&v62 + 1) + 8 * m) objectForKey:@"name"];
                          long long v25 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v48, "count"));
                          long long v60 = 0u;
                          long long v61 = 0u;
                          long long v58 = 0u;
                          long long v59 = 0u;
                          id v26 = v48;
                          uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v75 count:16];
                          if (v27)
                          {
                            uint64_t v28 = *(void *)v59;
                            do
                            {
                              for (uint64_t n = 0; n != v27; ++n)
                              {
                                if (*(void *)v59 != v28) {
                                  objc_enumerationMutation(v26);
                                }
                                int v30 = [v3 stringByAppendingString:*(void *)(*((void *)&v58 + 1) + 8 * n)];
                                [v25 addObject:v30];
                              }
                              uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v75 count:16];
                            }
                            while (v27);
                          }

                          double v31 = [v24 stringByDeletingPathExtension];

                          long long v56 = 0u;
                          long long v57 = 0u;
                          long long v54 = 0u;
                          long long v55 = 0u;
                          id v32 = v25;
                          uint64_t v33 = [v32 countByEnumeratingWithState:&v54 objects:v74 count:16];
                          if (v33)
                          {
                            uint64_t v34 = *(void *)v55;
                            while (2)
                            {
                              for (iuint64_t i = 0; ii != v33; ++ii)
                              {
                                if (*(void *)v55 != v34) {
                                  objc_enumerationMutation(v32);
                                }
                                if (![v31 caseInsensitiveCompare:*(void *)(*((void *)&v54 + 1) + 8 * ii)])
                                {
                                  long long v37 = +[SKTextureAtlas atlasNamed:v53];
                                  id v36 = [v37 textureNamed:v3];

                                  id v13 = v36;
                                  goto LABEL_56;
                                }
                              }
                              uint64_t v33 = [v32 countByEnumeratingWithState:&v54 objects:v74 count:16];
                              if (v33) {
                                continue;
                              }
                              break;
                            }
                          }
                        }
                        uint64_t v40 = [v50 countByEnumeratingWithState:&v62 objects:v76 count:16];
                      }
                      while (v40);
                    }
                  }
                  uint64_t v39 = [v49 countByEnumeratingWithState:&v66 objects:v77 count:16];
                }
                while (v39);
              }
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
        }
        while (v14);
      }

      id v36 = 0;
      id v13 = obj;
    }
    else
    {
      id v36 = 0;
    }
  }
LABEL_56:

  return v36;
}

+ (id)lookupCachedTextureNamed:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 pathExtension];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [v3 stringByDeletingPathExtension];

    id v3 = (id)v6;
  }
  uint64_t v7 = [(id)_atlasDict objectEnumerator];
  uint64_t v8 = [v7 allObjects];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  CGFloat v10 = (void *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "findTextureNamedFromAtlas:", v3, (void)v16);
        if (v13)
        {
          id v14 = v13;

          CGFloat v10 = v14;
          goto LABEL_13;
        }
      }
      CGFloat v10 = (void *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = v9;
LABEL_13:

  return v10;
}

- (void)unload
{
  [(id)_atlasDict removeObjectForKey:self->_atlasName];
  textureDict = self->_textureDict;
  self->_textureDict = 0;

  std::__hash_table<std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SKAttributeValue * {__strong}>>>::clear((uint64_t)&self->_textureMap);
}

+ (void)_exportAtlasWithDictionary:(id)a3 toFile:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [(id)objc_opt_class() _exportAtlasWithDictionary:v6 toFile:v5 forcePOT:0];
}

+ (void)_exportAtlasWithDictionary:(id)a3 toFile:(id)a4 forcePOT:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v29 = a4;
  long long v25 = v7;
  id v35 = 0;
  id v26 = objc_alloc_init(SKTextureAtlasPacker);
  [(SKTextureAtlasPacker *)v26 generateTextureAtlasImages:v7 outputDictionary:&v35 forcePOT:v5];
  id v27 = v35;
  uint64_t v8 = [v29 pathExtension];
  LOBYTE(a4) = [v8 caseInsensitiveCompare:@"plist"] == 0;

  if ((a4 & 1) == 0)
  {
    uint64_t v9 = [v29 stringByAppendingPathExtension:@"plist"];

    id v29 = (id)v9;
  }
  if (v27)
  {
    [v27 objectForKey:@"images"];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v14 = [v13 objectForKey:@"path"];
          double v15 = objc_msgSend([NSString alloc], "initWithFormat:", @".%ld.png", 1);
          long long v16 = [v29 lastPathComponent];
          long long v17 = [v16 stringByDeletingPathExtension];

          long long v18 = [v17 stringByAppendingString:v15];

          long long v19 = [v29 stringByDeletingLastPathComponent];
          CGRect v20 = [v19 stringByAppendingPathComponent:v18];

          uint64_t v21 = UIImagePNGRepresentation(v14);
          [v21 writeToFile:v20 atomically:1];

          [v13 setObject:v18 forKey:@"path"];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    id v30 = 0;
    id v22 = [MEMORY[0x263F08AC0] dataWithPropertyList:v27 format:200 options:0 error:&v30];
    id v23 = v30;
    if (v22)
    {
      long long v24 = [MEMORY[0x263F08850] defaultManager];
      [v24 createFileAtPath:v29 contents:v22 attributes:0];
    }
  }
}

- (id)_copyImageData
{
  textureDict = self->_textureDict;
  if (!textureDict) {
    return 0;
  }
  id v3 = [(NSDictionary *)textureDict allValues];
  id v4 = [v3 objectAtIndex:0];
  BOOL v5 = (void *)[v4 _copyImageData];

  return v5;
}

@end