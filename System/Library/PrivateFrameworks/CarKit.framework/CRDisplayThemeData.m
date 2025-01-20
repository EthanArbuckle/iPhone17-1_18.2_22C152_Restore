@interface CRDisplayThemeData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CRDisplayThemeData)initWithCoder:(id)a3;
- (CRDisplayThemeData)initWithCurrentLayoutID:(id)a3 paletteIDForLayout:(id)a4 wallpaperForLayout:(id)a5;
- (CRDisplayThemeData)initWithDictionary:(id)a3;
- (CRDisplayThemeData)themeDataWithCurrentLayoutID:(id)a3;
- (CRDisplayThemeData)themeDataWithCurrentPaletteID:(id)a3;
- (CRDisplayThemeData)themeDataWithCurrentWallpaper:(id)a3;
- (CRWallpaperData)currentWallpaper;
- (NSDictionary)paletteIDForLayout;
- (NSDictionary)wallpaperForLayout;
- (NSString)currentLayoutID;
- (NSString)currentPaletteID;
- (id)asDictionary;
- (id)description;
- (void)currentPaletteID;
- (void)currentWallpaper;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRDisplayThemeData

- (CRDisplayThemeData)initWithCurrentLayoutID:(id)a3 paletteIDForLayout:(id)a4 wallpaperForLayout:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CRDisplayThemeData;
  v11 = [(CRDisplayThemeData *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    currentLayoutID = v11->_currentLayoutID;
    v11->_currentLayoutID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    paletteIDForLayout = v11->_paletteIDForLayout;
    v11->_paletteIDForLayout = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    wallpaperForLayout = v11->_wallpaperForLayout;
    v11->_wallpaperForLayout = (NSDictionary *)v16;

    v18 = [v10 objectForKeyedSubscript:v8];

    if (!v18)
    {
      v19 = CarGeneralLogging();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[CRDisplayThemeData initWithCurrentLayoutID:paletteIDForLayout:wallpaperForLayout:]((uint64_t)v8, v10, v19);
      }
    }
  }

  return v11;
}

- (CRDisplayThemeData)initWithDictionary:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 objectForKey:@"currentLayoutID"];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  objc_opt_class();
  id v6 = [v3 objectForKey:@"paletteIDForLayout"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  objc_opt_class();
  id v8 = [v3 objectForKey:@"wallpaperForLayout"];
  id v60 = v5;
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v68;
    while (2)
    {
      id v14 = v9;
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v68 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        objc_opt_class();
        id v17 = v16;
        if (!v17 || (objc_opt_isKindOfClass() & 1) == 0)
        {

LABEL_54:
          v44 = CarGeneralLogging();
          v42 = self;
          v41 = v60;
          id v9 = v14;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            if (v17)
            {
              v49 = (objc_class *)objc_opt_class();
              NSStringFromClass(v49);
              v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v50 = (objc_class *)objc_opt_class();
              NSStringFromClass(v50);
              v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v47 = @"nil";
              v48 = @"nil";
            }
            *(_DWORD *)buf = 138412546;
            v73 = v47;
            __int16 v74 = 2112;
            v75 = v48;
            _os_log_error_impl(&dword_1ABB00000, v44, OS_LOG_TYPE_ERROR, "Invalid palette ID, expected strings, found: %@:%@", buf, 0x16u);
            if (v17)
            {
            }
          }

          v43 = 0;
          id v20 = v10;
          goto LABEL_63;
        }
        objc_opt_class();
        id v18 = [v10 objectForKey:v17];
        if (v18 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v19 = v18;
        }
        else {
          id v19 = 0;
        }

        if (!v19) {
          goto LABEL_54;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v67 objects:v76 count:16];
      id v9 = v14;
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v21 = v9;
  uint64_t v58 = [v21 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v58)
  {
    uint64_t v61 = *(void *)v64;
    v62 = v20;
    id v55 = v9;
    id v56 = v3;
    v57 = v21;
    while (2)
    {
      for (uint64_t j = 0; j != v58; ++j)
      {
        if (*(void *)v64 != v61) {
          objc_enumerationMutation(v21);
        }
        v23 = *(void **)(*((void *)&v63 + 1) + 8 * j);
        v24 = objc_msgSend(v21, "objectForKey:", v23, v55, v56);
        objc_opt_class();
        id v25 = v23;
        if (!v25 || (objc_opt_isKindOfClass() & 1) == 0)
        {

LABEL_57:
          v29 = CarGeneralLogging();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v42 = self;
            id v20 = v62;
            if (v25)
            {
              v52 = (objc_class *)objc_opt_class();
              NSStringFromClass(v52);
              v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v51 = @"nil";
            }
            if (v24)
            {
              v54 = (objc_class *)objc_opt_class();
              NSStringFromClass(v54);
              v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v53 = @"nil";
            }
            *(_DWORD *)buf = 138412546;
            v73 = v51;
            __int16 v74 = 2112;
            v75 = v53;
            _os_log_error_impl(&dword_1ABB00000, v29, OS_LOG_TYPE_ERROR, "Invalid palette ID, expected string:dictionary, found: %@:%@", buf, 0x16u);
            if (v24) {

            }
            if (v25) {
          }
            }
          else
          {
            v42 = self;
            id v20 = v62;
          }
LABEL_62:

          v43 = 0;
          id v9 = v55;
          id v3 = v56;
          v41 = v60;
          goto LABEL_63;
        }
        objc_opt_class();
        id v26 = v24;
        if (v26 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v27 = v26;
        }
        else {
          id v27 = 0;
        }

        if (!v27) {
          goto LABEL_57;
        }
        objc_opt_class();
        id v28 = [v26 objectForKey:@"type"];
        if (v28 && (objc_opt_isKindOfClass() & 1) != 0) {
          v29 = v28;
        }
        else {
          v29 = 0;
        }

        objc_opt_class();
        id v30 = [v26 objectForKey:@"data"];
        if (v30 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v31 = v30;
        }
        else {
          id v31 = 0;
        }

        v32 = off_1E5E3A2C8;
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        char v35 = [v29 isEqualToString:v34];

        if ((v35 & 1) == 0
          && (v32 = off_1E5E3A310,
              v36 = (objc_class *)objc_opt_class(),
              NSStringFromClass(v36),
              v37 = objc_claimAutoreleasedReturnValue(),
              int v38 = [v29 isEqualToString:v37],
              v37,
              !v38)
          || (uint64_t v39 = [objc_alloc(*v32) initWithDictionary:v31]) == 0)
        {
          v45 = CarGeneralLogging();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            [(CRDisplayThemeData *)(uint64_t)v25 initWithDictionary:v45];
          }

          v42 = self;
          id v20 = v62;
          id v21 = v57;
          goto LABEL_62;
        }
        v40 = (void *)v39;
        id v20 = v62;
        [v62 setObject:v39 forKey:v25];

        id v21 = v57;
      }
      id v9 = v55;
      id v3 = v56;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v63 objects:v71 count:16];
      if (v58) {
        continue;
      }
      break;
    }
  }

  v41 = v60;
  v42 = [(CRDisplayThemeData *)self initWithCurrentLayoutID:v60 paletteIDForLayout:v10 wallpaperForLayout:v20];
  v43 = v42;
LABEL_63:

  return v43;
}

- (id)asDictionary
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(CRDisplayThemeData *)self currentLayoutID];
  if (v4
    && (id v5 = (void *)v4,
        [(CRDisplayThemeData *)self paletteIDForLayout],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = [(CRDisplayThemeData *)self currentLayoutID];
    [v3 setObject:v7 forKey:@"currentLayoutID"];

    id v8 = [(CRDisplayThemeData *)self paletteIDForLayout];
    v24 = v3;
    [v3 setObject:v8 forKey:@"paletteIDForLayout"];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = [(CRDisplayThemeData *)self wallpaperForLayout];
    uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v15 = [(CRDisplayThemeData *)self wallpaperForLayout];
          uint64_t v16 = [v15 objectForKey:v14];

          uint64_t v17 = [v16 asDictionary];
          if (!v17)
          {

            v22 = 0;
            id v3 = v24;
            goto LABEL_14;
          }
          id v18 = (void *)v17;
          v30[0] = @"type";
          id v19 = (objc_class *)objc_opt_class();
          id v20 = NSStringFromClass(v19);
          v30[1] = @"data";
          v31[0] = v20;
          v31[1] = v18;
          id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
          [v9 setObject:v21 forKeyedSubscript:v14];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v3 = v24;
    [v24 setObject:v9 forKey:@"wallpaperForLayout"];
    v22 = (void *)[v24 copy];
LABEL_14:
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (CRDisplayThemeData)themeDataWithCurrentLayoutID:(id)a3
{
  id v4 = a3;
  id v5 = [CRDisplayThemeData alloc];
  id v6 = [(CRDisplayThemeData *)self paletteIDForLayout];
  id v7 = [(CRDisplayThemeData *)self wallpaperForLayout];
  id v8 = [(CRDisplayThemeData *)v5 initWithCurrentLayoutID:v4 paletteIDForLayout:v6 wallpaperForLayout:v7];

  return v8;
}

- (CRDisplayThemeData)themeDataWithCurrentPaletteID:(id)a3
{
  id v4 = a3;
  id v5 = [(CRDisplayThemeData *)self paletteIDForLayout];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [(CRDisplayThemeData *)self currentLayoutID];
  [v6 setObject:v4 forKeyedSubscript:v7];

  id v8 = [CRDisplayThemeData alloc];
  id v9 = [(CRDisplayThemeData *)self currentLayoutID];
  uint64_t v10 = [(CRDisplayThemeData *)self wallpaperForLayout];
  uint64_t v11 = [(CRDisplayThemeData *)v8 initWithCurrentLayoutID:v9 paletteIDForLayout:v6 wallpaperForLayout:v10];

  return v11;
}

- (CRDisplayThemeData)themeDataWithCurrentWallpaper:(id)a3
{
  id v4 = a3;
  id v5 = [(CRDisplayThemeData *)self wallpaperForLayout];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [(CRDisplayThemeData *)self currentLayoutID];
  [v6 setObject:v4 forKeyedSubscript:v7];

  id v8 = [CRDisplayThemeData alloc];
  id v9 = [(CRDisplayThemeData *)self currentLayoutID];
  uint64_t v10 = [(CRDisplayThemeData *)self paletteIDForLayout];
  uint64_t v11 = [(CRDisplayThemeData *)v8 initWithCurrentLayoutID:v9 paletteIDForLayout:v10 wallpaperForLayout:v6];

  return v11;
}

- (NSString)currentPaletteID
{
  id v3 = [(CRDisplayThemeData *)self paletteIDForLayout];
  id v4 = [(CRDisplayThemeData *)self currentLayoutID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5) {
    -[CRDisplayThemeData currentPaletteID]();
  }
  return (NSString *)v5;
}

- (CRWallpaperData)currentWallpaper
{
  id v3 = [(CRDisplayThemeData *)self wallpaperForLayout];
  id v4 = [(CRDisplayThemeData *)self currentLayoutID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5) {
    -[CRDisplayThemeData currentWallpaper]();
  }
  return (CRWallpaperData *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = [(CRDisplayThemeData *)self currentLayoutID];
    id v7 = [v5 currentLayoutID];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(CRDisplayThemeData *)self paletteIDForLayout];
      id v9 = [v5 paletteIDForLayout];
      if ([v8 isEqualToDictionary:v9])
      {
        uint64_t v10 = [(CRDisplayThemeData *)self wallpaperForLayout];
        uint64_t v11 = [v5 wallpaperForLayout];
        char v12 = [v10 isEqualToDictionary:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CRDisplayThemeData;
  id v4 = [(CRDisplayThemeData *)&v10 description];
  id v5 = [(CRDisplayThemeData *)self currentLayoutID];
  id v6 = [(CRDisplayThemeData *)self paletteIDForLayout];
  id v7 = [(CRDisplayThemeData *)self wallpaperForLayout];
  id v8 = [v3 stringWithFormat:@"%@ {currentLayoutID: %@ paletteIDForLayout: %@ wallpaperForLayout: %@}", v4, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CRDisplayThemeData *)self currentLayoutID];
  [v4 encodeObject:v5 forKey:@"currentLayoutID"];

  id v6 = [(CRDisplayThemeData *)self paletteIDForLayout];
  [v4 encodeObject:v6 forKey:@"paletteIDForLayout"];

  id v7 = [(CRDisplayThemeData *)self wallpaperForLayout];
  [v4 encodeObject:v7 forKey:@"wallpaperForLayout"];
}

- (CRDisplayThemeData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentLayoutID"];
  uint64_t v6 = objc_opt_class();
  id v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"paletteIDForLayout"];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  char v12 = [v4 decodeDictionaryWithKeysOfClasses:v8 objectsOfClasses:v11 forKey:@"wallpaperForLayout"];

  uint64_t v13 = 0;
  if (v5 && v7 && v12)
  {
    self = [(CRDisplayThemeData *)self initWithCurrentLayoutID:v5 paletteIDForLayout:v7 wallpaperForLayout:v12];
    uint64_t v13 = self;
  }

  return v13;
}

- (NSString)currentLayoutID
{
  return self->_currentLayoutID;
}

- (NSDictionary)paletteIDForLayout
{
  return self->_paletteIDForLayout;
}

- (NSDictionary)wallpaperForLayout
{
  return self->_wallpaperForLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperForLayout, 0);
  objc_storeStrong((id *)&self->_paletteIDForLayout, 0);
  objc_storeStrong((id *)&self->_currentLayoutID, 0);
}

- (void)initWithCurrentLayoutID:(uint64_t)a1 paletteIDForLayout:(void *)a2 wallpaperForLayout:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 allKeys];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_fault_impl(&dword_1ABB00000, a3, OS_LOG_TYPE_FAULT, "Unknown wallpaper for layout: %@. Wallpapers are available for layouts: %@", (uint8_t *)&v6, 0x16u);
}

- (void)initWithDictionary:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "Failed to initialize wallpaper, %@, from data: %@", (uint8_t *)&v3, 0x16u);
}

- (void)currentPaletteID
{
}

- (void)currentWallpaper
{
}

@end