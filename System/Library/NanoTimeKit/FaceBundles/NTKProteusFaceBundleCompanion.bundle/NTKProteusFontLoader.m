@interface NTKProteusFontLoader
+ (id)neptuneSharpFontDescriptorWithWeight:(double)a3 notch:(double)a4;
+ (id)neptuneSoftFontDescriptorWithWeight:(double)a3 notch:(double)a4;
+ (id)sharedInstanceWithSize:(double)a3;
- (NTKProteusFontLoader)initWithSize:(double)a3;
- (double)_discretizeNotch:(double)a3;
- (double)_discretizeWeight:(double)a3;
- (double)size;
- (id)_keyForWeight:(double)a3 notch:(double)a4;
- (id)_neptuneFont:(unint64_t)a3 weight:(double)a4 notch:(double)a5;
- (id)neptuneFont:(unint64_t)a3 weight:(double)a4 notch:(double)a5;
- (void)_logSize;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)cacheFonts:(BOOL)a3 ofType:(unint64_t)a4 forClient:(id)a5;
- (void)clearMotionCache;
- (void)clearStatusCache;
- (void)dealloc;
@end

@implementation NTKProteusFontLoader

+ (id)sharedInstanceWithSize:(double)a3
{
  WeakRetained = (NTKProteusFontLoader *)objc_loadWeakRetained(&qword_164F0);
  if (!WeakRetained)
  {
    WeakRetained = [[NTKProteusFontLoader alloc] initWithSize:a3];
    objc_storeWeak(&qword_164F0, WeakRetained);
  }

  return WeakRetained;
}

+ (id)neptuneSharpFontDescriptorWithWeight:(double)a3 notch:(double)a4
{
  if (qword_16500 != -1) {
    dispatch_once(&qword_16500, &stru_10428);
  }
  v6 = (void *)qword_164F8;
  CFStringRef v17 = kCTFontVariationAttribute;
  v7 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  v15[0] = v7;
  v8 = +[NSNumber numberWithDouble:a3];
  v16[0] = v8;
  v9 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  v15[1] = v9;
  v10 = +[NSNumber numberWithDouble:a4];
  v16[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v13 = [v6 fontDescriptorByAddingAttributes:v12];

  return v13;
}

+ (id)neptuneSoftFontDescriptorWithWeight:(double)a3 notch:(double)a4
{
  if (qword_16510 != -1) {
    dispatch_once(&qword_16510, &stru_10448);
  }
  v6 = (void *)qword_16508;
  CFStringRef v17 = kCTFontVariationAttribute;
  v7 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  v15[0] = v7;
  v8 = +[NSNumber numberWithDouble:a3];
  v16[0] = v8;
  v9 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  v15[1] = v9;
  v10 = +[NSNumber numberWithDouble:a4];
  v16[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v13 = [v6 fontDescriptorByAddingAttributes:v12];

  return v13;
}

- (NTKProteusFontLoader)initWithSize:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NTKProteusFontLoader;
  v4 = [(NTKProteusFontLoader *)&v11 init];
  if (v4)
  {
    v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Proteus font loader-init [%p]", buf, 0xCu);
    }

    v4->_size = a3;
    uint64_t v6 = +[NSHashTable weakObjectsHashTable];
    sharpClients = v4->_sharpClients;
    v4->_sharpClients = (NSHashTable *)v6;

    uint64_t v8 = +[NSHashTable weakObjectsHashTable];
    softClients = v4->_softClients;
    v4->_softClients = (NSHashTable *)v8;
  }
  return v4;
}

- (void)dealloc
{
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v6 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Proteus font loader-going away [%p]", buf, 0xCu);
  }

  [(NSCache *)self->_sharpMotionCache setDelegate:0];
  [(NSCache *)self->_sharpMotionCache setDelegate:0];
  [(NSCache *)self->_softMotionCache setDelegate:0];
  [(NSCache *)self->_softStatusCache setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)NTKProteusFontLoader;
  [(NTKProteusFontLoader *)&v4 dealloc];
}

- (id)_neptuneFont:(unint64_t)a3 weight:(double)a4 notch:(double)a5
{
  double v6 = a4 * a4;
  if (a3 == 1)
  {
    uint64_t v7 = +[NTKProteusFontLoader neptuneSoftFontDescriptorWithWeight:v6 notch:a5];
  }
  else
  {
    if (a3) {
      goto LABEL_7;
    }
    uint64_t v7 = +[NTKProteusFontLoader neptuneSharpFontDescriptorWithWeight:v6 notch:a5];
  }
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    v9 = +[CLKFont fontWithDescriptor:v7 size:self->_size];

    goto LABEL_8;
  }
LABEL_7:
  v9 = 0;
LABEL_8:

  return v9;
}

- (id)neptuneFont:(unint64_t)a3 weight:(double)a4 notch:(double)a5
{
  [(NTKProteusFontLoader *)self _discretizeWeight:a4];
  double v9 = v8;
  [(NTKProteusFontLoader *)self _discretizeNotch:a5];
  double v11 = v10;
  v12 = [(NTKProteusFontLoader *)self _keyForWeight:v9 notch:v10];
  uint64_t v13 = 16;
  if (a3 == 1) {
    uint64_t v13 = 8;
  }
  id v14 = *(id *)((char *)&self->super.isa + v13);
  uint64_t v15 = [v14 objectForKey:v12];
  if (!v15)
  {
    uint64_t v25 = 24;
    if (a3 == 1) {
      uint64_t v25 = 32;
    }
    id v26 = *(id *)((char *)&self->super.isa + v25);
    uint64_t v27 = [v26 objectForKey:v12];
    if (v27)
    {
      v28 = (void *)v27;
      v29 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        sub_A3E8((uint64_t)v12, v29, v30, v31, v32, v33, v34, v35);
      }

      ++self->_cacheHits;
      id v24 = v28;
      goto LABEL_43;
    }
    uint64_t v36 = 40;
    if (a3 == 1) {
      uint64_t v36 = 48;
    }
    id v37 = *(id *)((char *)&self->super.isa + v36);
    uint64_t v38 = [v37 objectForKey:v12];
    if (v38)
    {
      v39 = (void *)v38;
      v40 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        sub_A37C((uint64_t)v12, v40, v41, v42, v43, v44, v45, v46);
      }

      ++self->_cacheHits;
      goto LABEL_42;
    }
    v39 = [(NTKProteusFontLoader *)self _neptuneFont:a3 weight:v9 notch:v11];
    if (!v39)
    {
LABEL_41:
      [(NTKProteusFontLoader *)self _logSize];
LABEL_42:
      id v24 = v39;

LABEL_43:
      goto LABEL_44;
    }
    v47 = _NTKLoggingObjectForDomain();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    if (a5 == 0.0 || a5 == 1.0)
    {
      if (v48)
      {
        *(_DWORD *)v52 = 138412290;
        *(void *)&v52[4] = v12;
        _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "Proteus font loader-caching font with key %@", v52, 0xCu);
      }

      if (v26)
      {
        [v26 setObject:v39 forKey:v12];
        if (a3 == 1) {
          ++self->_softMotionCacheSize;
        }
        else {
          ++self->_sharpMotionCacheSize;
        }
        goto LABEL_40;
      }
      v49 = _NTKLoggingObjectForDomain();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      *(_WORD *)v52 = 0;
      v50 = "Proteus font loader-! no motion cache";
    }
    else
    {
      if (v48)
      {
        *(_DWORD *)v52 = 138412290;
        *(void *)&v52[4] = v12;
        _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "Proteus font loader-caching notch-transition font with key %@", v52, 0xCu);
      }

      if (v37)
      {
        [v37 setObject:v39 forKey:v12];
        if (a3 == 1) {
          ++self->_softStatusCacheSize;
        }
        else {
          ++self->_sharpStatusCacheSize;
        }
        goto LABEL_40;
      }
      v49 = _NTKLoggingObjectForDomain();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
LABEL_37:

LABEL_40:
        ++self->_cacheMisses;
        goto LABEL_41;
      }
      *(_WORD *)v52 = 0;
      v50 = "Proteus font loader-! no status cache";
    }
    _os_log_impl(&dword_0, v49, OS_LOG_TYPE_DEFAULT, v50, v52, 2u);
    goto LABEL_37;
  }
  v16 = (void *)v15;
  CFStringRef v17 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_A454((uint64_t)v12, v17, v18, v19, v20, v21, v22, v23);
  }

  ++self->_cacheHits;
  id v24 = v16;
LABEL_44:

  return v24;
}

- (void)_logSize
{
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = self->_softPermanentSet != 0;
    BOOL v5 = self->_sharpPermanentSet != 0;
    NSUInteger v6 = [(NSHashTable *)self->_softClients count];
    NSUInteger v7 = [(NSHashTable *)self->_sharpClients count];
    id v8 = [(NSMutableDictionary *)self->_softPermanentSet count];
    id v9 = [(NSMutableDictionary *)self->_sharpPermanentSet count];
    unint64_t softMotionCacheSize = self->_softMotionCacheSize;
    unint64_t softStatusCacheSize = self->_softStatusCacheSize;
    unint64_t sharpMotionCacheSize = self->_sharpMotionCacheSize;
    unint64_t sharpStatusCacheSize = self->_sharpStatusCacheSize;
    unint64_t evictions = self->_evictions;
    unint64_t cacheHits = self->_cacheHits;
    double v16 = (double)cacheHits;
    unint64_t v17 = self->_cacheMisses + cacheHits;
    v18[0] = 67112192;
    v18[1] = v4;
    __int16 v19 = 1024;
    BOOL v20 = v5;
    __int16 v21 = 2048;
    NSUInteger v22 = v6;
    __int16 v23 = 2048;
    NSUInteger v24 = v7;
    __int16 v25 = 2048;
    id v26 = v8;
    __int16 v27 = 2048;
    id v28 = v9;
    __int16 v29 = 2048;
    unint64_t v30 = softStatusCacheSize;
    __int16 v31 = 2048;
    unint64_t v32 = sharpStatusCacheSize;
    __int16 v33 = 2048;
    unint64_t v34 = softMotionCacheSize;
    __int16 v35 = 2048;
    unint64_t v36 = sharpMotionCacheSize;
    __int16 v37 = 2048;
    unint64_t v38 = evictions;
    __int16 v39 = 2048;
    double v40 = v16 / (double)v17;
    __int16 v41 = 2048;
    uint64_t v42 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Proteus font loader-cache size: active?%d/%d clients %lu/%lu perm %lu/%lu status %lu/%lu motion %lu/%lu evict %lu hitrate %f [%p]", (uint8_t *)v18, 0x7Cu);
  }
}

- (void)cacheFonts:(BOOL)a3 ofType:(unint64_t)a4 forClient:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v51 = 67109376;
    LODWORD(v52[0]) = v6;
    WORD2(v52[0]) = 2048;
    *(void *)((char *)v52 + 6) = a4;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Proteus font loader-cache %d for style %lu", (uint8_t *)&v51, 0x12u);
  }

  if (a4)
  {
    if (a4 == 1)
    {
      softClients = self->_softClients;
      if (v6)
      {
        [(NSHashTable *)softClients addObject:v8];
        double v11 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v51 = 134217984;
          v52[0] = v8;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Proteus font loader-added soft client [%p]", (uint8_t *)&v51, 0xCu);
        }

        if (!self->_softPermanentSet)
        {
          v12 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:24];
          softPermanentSet = self->_softPermanentSet;
          self->_softPermanentSet = v12;

          double v14 = 0.0;
          int v15 = 12;
          do
          {
            double v16 = self->_softPermanentSet;
            unint64_t v17 = [(NTKProteusFontLoader *)self _neptuneFont:1 weight:v14 / 11.0 notch:0.0];
            uint64_t v18 = [(NTKProteusFontLoader *)self _keyForWeight:v14 / 11.0 notch:0.0];
            [(NSMutableDictionary *)v16 setObject:v17 forKey:v18];

            __int16 v19 = self->_softPermanentSet;
            BOOL v20 = [(NTKProteusFontLoader *)self _neptuneFont:1 weight:v14 / 11.0 notch:1.0];
            __int16 v21 = [(NTKProteusFontLoader *)self _keyForWeight:v14 / 11.0 notch:1.0];
            [(NSMutableDictionary *)v19 setObject:v20 forKey:v21];

            double v14 = v14 + 1.0;
            --v15;
          }
          while (v15);
          NSUInteger v22 = (NSCache *)objc_alloc_init((Class)NSCache);
          softStatusCache = self->_softStatusCache;
          self->_softStatusCache = v22;

          [(NSCache *)self->_softStatusCache setDelegate:self];
          NSUInteger v24 = (NSCache *)objc_alloc_init((Class)NSCache);
          softMotionCache = self->_softMotionCache;
          self->_softMotionCache = v24;

          id v26 = self->_softMotionCache;
LABEL_19:
          [(NSCache *)v26 setDelegate:self];
        }
      }
      else
      {
        [(NSHashTable *)softClients removeObject:v8];
        if (![(NSHashTable *)self->_softClients count])
        {
          uint64_t v43 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v51) = 0;
            _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "Proteus font loader-Soft cache purge", (uint8_t *)&v51, 2u);
          }

          uint64_t v44 = self->_softPermanentSet;
          self->_softPermanentSet = 0;

          [(NSCache *)self->_softStatusCache removeAllObjects];
          uint64_t v45 = self->_softStatusCache;
          self->_softStatusCache = 0;

          self->_unint64_t softStatusCacheSize = 0;
          [(NSCache *)self->_softMotionCache removeAllObjects];
          uint64_t v46 = self->_softMotionCache;
          self->_softMotionCache = 0;

          self->_unint64_t softMotionCacheSize = 0;
        }
      }
    }
  }
  else
  {
    sharpClients = self->_sharpClients;
    if (v6)
    {
      [(NSHashTable *)sharpClients addObject:v8];
      id v28 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v51 = 134217984;
        v52[0] = v8;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Proteus font loader-added sharp client [%p]", (uint8_t *)&v51, 0xCu);
      }

      if (!self->_sharpPermanentSet)
      {
        __int16 v29 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:24];
        sharpPermanentSet = self->_sharpPermanentSet;
        self->_sharpPermanentSet = v29;

        double v31 = 0.0;
        int v32 = 12;
        do
        {
          __int16 v33 = self->_sharpPermanentSet;
          unint64_t v34 = [(NTKProteusFontLoader *)self _neptuneFont:0 weight:v31 / 11.0 notch:0.0];
          __int16 v35 = [(NTKProteusFontLoader *)self _keyForWeight:v31 / 11.0 notch:0.0];
          [(NSMutableDictionary *)v33 setObject:v34 forKey:v35];

          unint64_t v36 = self->_sharpPermanentSet;
          __int16 v37 = [(NTKProteusFontLoader *)self _neptuneFont:0 weight:v31 / 11.0 notch:1.0];
          unint64_t v38 = [(NTKProteusFontLoader *)self _keyForWeight:v31 / 11.0 notch:1.0];
          [(NSMutableDictionary *)v36 setObject:v37 forKey:v38];

          double v31 = v31 + 1.0;
          --v32;
        }
        while (v32);
        __int16 v39 = (NSCache *)objc_alloc_init((Class)NSCache);
        sharpStatusCache = self->_sharpStatusCache;
        self->_sharpStatusCache = v39;

        [(NSCache *)self->_sharpStatusCache setDelegate:self];
        __int16 v41 = (NSCache *)objc_alloc_init((Class)NSCache);
        sharpMotionCache = self->_sharpMotionCache;
        self->_sharpMotionCache = v41;

        id v26 = self->_sharpMotionCache;
        goto LABEL_19;
      }
    }
    else
    {
      [(NSHashTable *)sharpClients removeObject:v8];
      if (![(NSHashTable *)self->_sharpClients count])
      {
        v47 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v51) = 0;
          _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "Proteus font loader-Sharp cache purge", (uint8_t *)&v51, 2u);
        }

        BOOL v48 = self->_sharpPermanentSet;
        self->_sharpPermanentSet = 0;

        [(NSCache *)self->_sharpStatusCache removeAllObjects];
        v49 = self->_sharpStatusCache;
        self->_sharpStatusCache = 0;

        self->_unint64_t sharpStatusCacheSize = 0;
        [(NSCache *)self->_sharpMotionCache removeAllObjects];
        v50 = self->_sharpMotionCache;
        self->_sharpMotionCache = 0;

        self->_unint64_t sharpMotionCacheSize = 0;
      }
    }
  }
  [(NTKProteusFontLoader *)self _logSize];
}

- (void)clearStatusCache
{
  [(NSCache *)self->_sharpStatusCache removeAllObjects];
  [(NSCache *)self->_softStatusCache removeAllObjects];

  [(NTKProteusFontLoader *)self _logSize];
}

- (void)clearMotionCache
{
  [(NSCache *)self->_sharpMotionCache removeAllObjects];
  [(NSCache *)self->_softMotionCache removeAllObjects];

  [(NTKProteusFontLoader *)self _logSize];
}

- (id)_keyForWeight:(double)a3 notch:(double)a4
{
  return +[NSNumber numberWithUnsignedInteger:(int)(a4 * 40.0) + 1000 * (int)(a3 * 200.0)];
}

- (double)_discretizeWeight:(double)a3
{
  return floor(a3 * 200.0) / 200.0;
}

- (double)_discretizeNotch:(double)a3
{
  return floor(a3 * 40.0) / 40.0;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  BOOL v5 = (NSCache *)a3;
  BOOL v6 = v5;
  ++self->_evictions;
  if (self->_softMotionCache == v5)
  {
    --self->_softMotionCacheSize;
  }
  else if (self->_sharpMotionCache == v5)
  {
    --self->_sharpMotionCacheSize;
  }
  else if (self->_softStatusCache == v5)
  {
    --self->_softStatusCacheSize;
  }
  else if (self->_sharpStatusCache == v5)
  {
    --self->_sharpStatusCacheSize;
  }
  else
  {
    NSUInteger v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      id v9 = self;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Proteus font loader-! evicting from unrecognized cache [%p]", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (double)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softClients, 0);
  objc_storeStrong((id *)&self->_sharpClients, 0);
  objc_storeStrong((id *)&self->_softStatusCache, 0);
  objc_storeStrong((id *)&self->_sharpStatusCache, 0);
  objc_storeStrong((id *)&self->_softMotionCache, 0);
  objc_storeStrong((id *)&self->_sharpMotionCache, 0);
  objc_storeStrong((id *)&self->_sharpPermanentSet, 0);

  objc_storeStrong((id *)&self->_softPermanentSet, 0);
}

@end