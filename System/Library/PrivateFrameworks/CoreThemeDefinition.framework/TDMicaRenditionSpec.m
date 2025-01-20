@interface TDMicaRenditionSpec
- (id)copyDataFromAttributes;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (id)debugDescription;
- (void)_logError:(id)a3;
- (void)_logWarning:(id)a3;
@end

@implementation TDMicaRenditionSpec

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"rendition with asset %@ and key %@", objc_msgSend((id)objc_msgSend((id)-[TDMicaRenditionSpec production](self, "production"), "asset"), "name"), objc_msgSend((id)-[TDMicaRenditionSpec keySpec](self, "keySpec"), "debugDescription")];
}

- (void)_logError:(id)a3
{
}

- (void)_logWarning:(id)a3
{
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  __int16 v6 = a4;
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v47 = 0;
  v8 = objc_msgSend((id)-[TDMicaRenditionSpec production](self, "production", a3), "asset");
  v9 = (void *)[v8 fileURLWithDocument:a5];
  if (([v9 checkResourceIsReachableAndReturnError:&v47] & 1) == 0) {
    v9 = objc_msgSend((id)objc_msgSend(v9, "URLByDeletingPathExtension"), "URLByAppendingPathExtension:", @"ca");
  }
  if (([v9 checkResourceIsReachableAndReturnError:&v47] & 1) == 0) {
    v9 = objc_msgSend((id)objc_msgSend(v9, "URLByDeletingPathExtension"), "URLByAppendingPathExtension:", @"caml");
  }
  if ([(TDMicaRenditionSpec *)self parentRendition])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263F38370]), "initWithInternalReferenceRect:layout:", 1000, 0.0, 0.0, 128.0, 128.0);
    [v10 setScaleFactor:1];
    [v10 setUtiType:*MEMORY[0x263F15EE0]];
    objc_msgSend(v10, "addSliceRect:", 0.0, 0.0, 128.0, 128.0);
    id v11 = objc_alloc_init(MEMORY[0x263F383C0]);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x263F383B8]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)-[TDMicaRenditionSpec parentRendition](self, "parentRendition"), "keySpec"), "key"));
    [v11 setReferenceKey:v12];
    [v10 addLayerReference:v11];
    v13 = (void *)[v10 CSIRepresentationWithCompression:1];
  }
  else if (v8)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    uint64_t v47 = 0;
    if (objc_msgSend((id)objc_msgSend(v9, "pathExtension"), "isEqualToString:", @"ca"))
    {
      v14 = (uint64_t *)MEMORY[0x263F15EE8];
    }
    else
    {
      int v15 = objc_msgSend((id)objc_msgSend(v9, "pathExtension"), "isEqualToString:", @"caml");
      v14 = (uint64_t *)MEMORY[0x263F15EE0];
      if (v15) {
        v14 = (uint64_t *)MEMORY[0x263F15EF0];
      }
    }
    uint64_t v16 = *v14;
    v17 = (void *)[MEMORY[0x263F15838] packageWithContentsOfURL:v9 type:*v14 options:MEMORY[0x263EFFA78] error:&v47];
    if (!v17 || v47)
    {
      -[TDMicaRenditionSpec _logError:](self, "_logError:", [NSString stringWithFormat:@"Couldn't find Mica asset at %@ of type %@: %@", v9, v16, v47]);
      v13 = 0;
    }
    else
    {
      v35 = v8;
      __int16 v36 = v6;
      v18 = (void *)[v17 rootLayer];
      v37 = self;
      v19 = (void *)[(TDMicaRenditionSpec *)self layerPath];
      if ([v19 length])
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        obuint64_t j = (id)[v19 componentsSeparatedByString:@"/"];
        uint64_t v20 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v44 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              long long v39 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              v25 = (void *)[v18 sublayers];
              uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = *(void *)v40;
                while (2)
                {
                  for (uint64_t j = 0; j != v27; ++j)
                  {
                    if (*(void *)v40 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    v30 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                    if (objc_msgSend((id)objc_msgSend(v30, "name"), "isEqualToString:", v24))
                    {
                      v18 = v30;
                      goto LABEL_31;
                    }
                  }
                  uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
                  if (v27) {
                    continue;
                  }
                  break;
                }
              }
LABEL_31:
              ;
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
          }
          while (v21);
        }
      }
      uint64_t v31 = CAEncodeLayerTree();
      if (v31)
      {
        v32 = (void *)v31;
        v33 = (void *)[objc_alloc(MEMORY[0x263F38370]) initWithRawData:v31 pixelFormat:1145132097 layout:1000];
        [v33 setScaleFactor:1];
        [v33 setUtiType:*MEMORY[0x263F15EE0]];
        [v33 setName:objc_msgSend(NSString, "stringWithFormat:", @"Mica: %@", objc_msgSend(v35, "name"))];
        [v33 setColorSpaceID:v36];
        [v33 setOpacity:1.0];
        [v33 setBlendMode:0];
        objc_msgSend(v33, "setIsTintable:", -[TDMicaRenditionSpec isTintable](v37, "isTintable"));
        [v33 setCompressionType:2];
        objc_msgSend(v33, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](v37, "propertiesAsDictionary"));
        v13 = (void *)[v33 CSIRepresentationWithCompression:1];
      }
      else
      {
        v13 = 0;
      }
    }
    [MEMORY[0x263F158F8] commit];
  }
  else
  {
    return 0;
  }
  return v13;
}

- (id)copyDataFromAttributes
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v3 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v2 format:200 options:0 error:0];

  return (id)[v3 copy];
}

@end