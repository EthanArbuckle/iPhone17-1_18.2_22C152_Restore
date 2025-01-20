@interface DUPersonalIDDocument
+ (BOOL)supportsSecureCoding;
- (DUPersonalIDDocument)initWithCoder:(id)a3;
- (DUPersonalIDDocument)initWithOCRContents:(id)a3 documentType:(int64_t)a4;
- (DUPersonalIDDocument)initWithText:(id)a3 documentType:(int64_t)a4;
- (DUPersonalIDDocument)initWithTextLines:(id)a3 boundingBoxes:(id)a4 confidenceScores:(id)a5 documentType:(int64_t)a6;
- (NSArray)lines;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DUPersonalIDDocument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_confidenceScores, 0);
  objc_storeStrong((id *)&self->_boundingBoxes, 0);
}

- (NSArray)lines
{
  return self->_lines;
}

- (int64_t)type
{
  return self->_type;
}

- (DUPersonalIDDocument)initWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"documentType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lines"];
  id v36 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v6 error:&v36];
  id v8 = v36;
  id v9 = v8;
  if (v8 || !v7)
  {
    if (!v8)
    {
      id v9 = [v7 error];
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v9;
      _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[DUInformationExtractor] failed to decode DUPersonalIDDocument: %@", buf, 0xCu);
    }
    v27 = 0;
  }
  else
  {
    uint64_t v30 = v5;
    v31 = self;
    v33 = v6;
    id v10 = objc_alloc(MEMORY[0x263EFFA08]);
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
    v12 = (void *)[v10 initWithArray:v11];

    uint64_t v13 = *MEMORY[0x263F081D0];
    uint64_t v32 = [v7 decodeObjectOfClasses:v12 forKey:*MEMORY[0x263F081D0]];
    [v7 finishDecoding];
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boundingBoxes"];
    id v35 = 0;
    v15 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v14 error:&v35];
    id v9 = v35;

    if (v9 || !v15)
    {
      if (!v9)
      {
        id v9 = [v15 error];
      }
      v24 = (void *)v32;
      v6 = v33;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v9;
        _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[DUInformationExtractor] failed to decode DUPersonalIDDocument: %@", buf, 0xCu);
      }
      v27 = 0;
      v7 = v15;
      self = v31;
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x263EFFA08]);
      v38[0] = objc_opt_class();
      v38[1] = objc_opt_class();
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
      v18 = (void *)[v16 initWithArray:v17];

      uint64_t v29 = [v15 decodeObjectOfClasses:v18 forKey:v13];
      [v15 finishDecoding];
      v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confidenceScores"];
      id v34 = 0;
      v7 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v19 error:&v34];
      id v9 = v34;

      if (v9 || !v7)
      {
        v24 = (void *)v32;
        if (!v9)
        {
          id v9 = [v7 error];
        }
        self = v31;
        v26 = (void *)v29;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v9;
          _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[DUInformationExtractor] failed to decode DUPersonalIDDocument: %@", buf, 0xCu);
        }
        v27 = 0;
      }
      else
      {
        id v20 = objc_alloc(MEMORY[0x263EFFA08]);
        v37[0] = objc_opt_class();
        v37[1] = objc_opt_class();
        v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
        uint64_t v22 = [v20 initWithArray:v21];

        v23 = [v7 decodeObjectOfClasses:v22 forKey:v13];
        [v7 finishDecoding];
        v24 = (void *)v32;
        v25 = [(DUPersonalIDDocument *)v31 initWithTextLines:v32 boundingBoxes:v29 confidenceScores:v23 documentType:v30];

        id v9 = 0;
        v18 = (void *)v22;
        self = v25;
        v26 = (void *)v29;
        v27 = self;
      }

      v12 = v18;
      v6 = v33;
    }
  }
  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"documentType"];
  lines = self->_lines;
  id v17 = 0;
  v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:lines requiringSecureCoding:1 error:&v17];
  id v8 = v17;
  boundingBoxes = self->_boundingBoxes;
  id v16 = v8;
  id v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:boundingBoxes requiringSecureCoding:1 error:&v16];
  id v11 = v16;

  confidenceScores = self->_confidenceScores;
  id v15 = v11;
  uint64_t v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:confidenceScores requiringSecureCoding:1 error:&v15];
  id v14 = v15;

  if (v14 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v14;
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[DUInformationExtractor] failed to decode DUPersonalIDDocument: %@", buf, 0xCu);
  }
  [v5 encodeObject:v7 forKey:@"lines"];
  [v5 encodeObject:v10 forKey:@"boundingBoxes"];
  [v5 encodeObject:v13 forKey:@"confidenceScores"];
}

- (DUPersonalIDDocument)initWithText:(id)a3 documentType:(int64_t)a4
{
  v6 = [a3 componentsSeparatedByString:@"\n"];
  v7 = [(DUPersonalIDDocument *)self initWithTextLines:v6 boundingBoxes:MEMORY[0x263EFFA68] confidenceScores:MEMORY[0x263EFFA68] documentType:a4];

  return v7;
}

- (DUPersonalIDDocument)initWithOCRContents:(id)a3 documentType:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  v7 = [MEMORY[0x263EFF980] array];
  id v8 = [MEMORY[0x263EFF980] array];
  id v9 = [(DUPersonalIDDocument *)self initWithTextLines:v6 boundingBoxes:v7 confidenceScores:v8 documentType:a4];

  return v9;
}

- (DUPersonalIDDocument)initWithTextLines:(id)a3 boundingBoxes:(id)a4 confidenceScores:(id)a5 documentType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DUPersonalIDDocument;
  id v14 = [(DUPersonalIDDocument *)&v17 init];
  id v15 = v14;
  if (v14)
  {
    v14->_int64_t type = a6;
    objc_storeStrong((id *)&v14->_lines, a3);
    objc_storeStrong((id *)&v15->_boundingBoxes, a4);
    objc_storeStrong((id *)&v15->_confidenceScores, a5);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end