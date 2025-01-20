@interface DRSTeamTasking
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTeamTasking:(id)a3;
- (DRConfig)config;
- (DRSSamplingParameters)defaultSamplingParameters;
- (DRSTeamTasking)initWithJSONDict:(id)a3 receivedDate:(id)a4;
- (DRSTeamTasking)initWithTeamID:(id)a3 config:(id)a4 defaultSamplingParameters:(id)a5 perTimezoneSamplingParameters:(id)a6 perHardwareModelSamplingParamters:(id)a7;
- (NSDictionary)perHWModelSamplingParameters;
- (NSDictionary)perTimezoneSamplingParameters;
- (NSString)teamID;
- (id)_jsonDictRepresentation:(BOOL)a3;
- (id)debugDescription;
- (id)jsonDictRepresentation;
- (id)jsonDictRepresentationAbbreviated;
- (id)samplingParametersForHWModel:(id)a3 timezoneAbbreviation:(id)a4;
- (id)samplingParametersForHardwareModel:(id)a3;
- (id)samplingParametersForTimezoneAbbreviation:(id)a3;
@end

@implementation DRSTeamTasking

- (DRSTeamTasking)initWithTeamID:(id)a3 config:(id)a4 defaultSamplingParameters:(id)a5 perTimezoneSamplingParameters:(id)a6 perHardwareModelSamplingParamters:(id)a7
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  if (!v12)
  {
    v21 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      v22 = "nil teamID";
      goto LABEL_13;
    }
LABEL_14:

    v23 = 0;
LABEL_18:
    v26 = self;
    goto LABEL_19;
  }
  if (!v13)
  {
    v21 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      v22 = "nil config";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v30 = v15;
  id v31 = v16;
  id v18 = v14;
  v19 = [v13 teamID];
  char v20 = [v19 isEqualToString:v12];

  if ((v20 & 1) == 0)
  {
    v24 = DPLogHandle_TaskingMessageError();
    v17 = v31;
    if (os_signpost_enabled(v24))
    {
      v25 = [v13 teamID];
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      __int16 v36 = 2114;
      id v37 = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSTeamTasking", "Config team ID (%{public}@) does not match TeamTasking team ID (%{public}@)", buf, 0x16u);
    }
    v23 = 0;
    id v14 = v18;
    id v15 = v30;
    goto LABEL_18;
  }
  id v14 = v18;
  id v15 = v30;
  v17 = v31;
  if (!v14 && !v30 && !v31)
  {
    v21 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      v22 = "nil defaultSamplingParameters AND perTimezoneSamplingParameters AND perHWModelSamplingParameters";
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSTeamTasking", v22, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v30 && v31)
  {
    v21 = DPLogHandle_TaskingMessageError();
    if (!os_signpost_enabled(v21)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v22 = "Nonnull perTimezoneSamplingParameters AND perHWModelSamplingParameters";
    goto LABEL_13;
  }
  v33.receiver = self;
  v33.super_class = (Class)DRSTeamTasking;
  v28 = [(DRSTeamTasking *)&v33 init];
  p_isa = (id *)&v28->super.isa;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_teamID, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }
  v26 = p_isa;
  v23 = v26;
  v17 = v31;
LABEL_19:

  return v23;
}

- (id)samplingParametersForTimezoneAbbreviation:(id)a3
{
  id v4 = a3;
  v5 = [(DRSTeamTasking *)self perTimezoneSamplingParameters];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v6 = [(DRSTeamTasking *)self defaultSamplingParameters];
  }

  return v6;
}

- (id)samplingParametersForHardwareModel:(id)a3
{
  id v4 = a3;
  v5 = [(DRSTeamTasking *)self perHWModelSamplingParameters];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v6 = [(DRSTeamTasking *)self defaultSamplingParameters];
  }

  return v6;
}

- (id)samplingParametersForHWModel:(id)a3 timezoneAbbreviation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DRSTeamTasking *)self perTimezoneSamplingParameters];

  if (v8) {
    [(DRSTeamTasking *)self samplingParametersForTimezoneAbbreviation:v7];
  }
  else {
  v9 = [(DRSTeamTasking *)self samplingParametersForHardwareModel:v6];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(DRSTeamTasking *)self isEqualToTeamTasking:v4];

  return v5;
}

- (BOOL)isEqualToTeamTasking:(id)a3
{
  id v4 = (DRSTeamTasking *)a3;
  BOOL v5 = v4;
  if (v4)
  {
    if (v4 != self)
    {
      id v6 = [(DRSTeamTasking *)self teamID];
      id v7 = [(DRSTeamTasking *)v5 teamID];
      int v8 = [v6 isEqualToString:v7];

      if (!v8) {
        goto LABEL_12;
      }
      v9 = [(DRSTeamTasking *)self config];
      v10 = [(DRSTeamTasking *)v5 config];
      int v11 = [v9 isEqualToConfig:v10];

      if (!v11) {
        goto LABEL_12;
      }
      id v12 = [(DRSTeamTasking *)self defaultSamplingParameters];
      id v13 = [(DRSTeamTasking *)v5 defaultSamplingParameters];
      char IsNil = _oneIsNil((uint64_t)v12, (uint64_t)v13);

      if (IsNil) {
        goto LABEL_12;
      }
      uint64_t v15 = [(DRSTeamTasking *)self defaultSamplingParameters];
      if (v15)
      {
        id v16 = (void *)v15;
        v17 = [(DRSTeamTasking *)self defaultSamplingParameters];
        id v18 = [(DRSTeamTasking *)v5 defaultSamplingParameters];
        int v19 = [v17 isEqualToSamplingParameters:v18];

        if (!v19) {
          goto LABEL_12;
        }
      }
      char v20 = [(DRSTeamTasking *)self perTimezoneSamplingParameters];
      v21 = [(DRSTeamTasking *)v5 perTimezoneSamplingParameters];
      char v22 = _oneIsNil((uint64_t)v20, (uint64_t)v21);

      if (v22) {
        goto LABEL_12;
      }
      uint64_t v23 = [(DRSTeamTasking *)self perTimezoneSamplingParameters];
      if (v23)
      {
        v24 = (void *)v23;
        v25 = [(DRSTeamTasking *)self perTimezoneSamplingParameters];
        v26 = [(DRSTeamTasking *)v5 perTimezoneSamplingParameters];
        int v27 = [v25 isEqualToDictionary:v26];

        if (!v27) {
          goto LABEL_12;
        }
      }
      v28 = [(DRSTeamTasking *)self perHWModelSamplingParameters];
      v29 = [(DRSTeamTasking *)v5 perHWModelSamplingParameters];
      char v30 = _oneIsNil((uint64_t)v28, (uint64_t)v29);

      if (v30) {
        goto LABEL_12;
      }
      uint64_t v32 = [(DRSTeamTasking *)self perHWModelSamplingParameters];
      if (v32)
      {
        objc_super v33 = (void *)v32;
        v34 = [(DRSTeamTasking *)self perHWModelSamplingParameters];
        v35 = [(DRSTeamTasking *)v5 perHWModelSamplingParameters];
        char v31 = [v34 isEqualToDictionary:v35];

        goto LABEL_16;
      }
    }
    char v31 = 1;
    goto LABEL_16;
  }
LABEL_12:
  char v31 = 0;
LABEL_16:

  return v31;
}

- (id)_jsonDictRepresentation:(BOOL)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [(DRSTeamTasking *)self config];
    BOOL v5 = [v4 jsonDictRepresentation];
  }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = [(DRSTeamTasking *)self defaultSamplingParameters];

  if (v6)
  {
    id v7 = [(DRSTeamTasking *)self defaultSamplingParameters];
    id v6 = [v7 jsonDictRepresentation];
  }
  id v8 = [(DRSTeamTasking *)self perTimezoneSamplingParameters];

  if (v8)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    v10 = [(DRSTeamTasking *)self perTimezoneSamplingParameters];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __42__DRSTeamTasking__jsonDictRepresentation___block_invoke;
    v20[3] = &unk_263FCA540;
    id v8 = v9;
    id v21 = v8;
    [v10 enumerateKeysAndObjectsUsingBlock:v20];
  }
  id v11 = [(DRSTeamTasking *)self perHWModelSamplingParameters];

  if (v11)
  {
    id v12 = [MEMORY[0x263EFF9A0] dictionary];
    id v13 = [(DRSTeamTasking *)self perHWModelSamplingParameters];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __42__DRSTeamTasking__jsonDictRepresentation___block_invoke_2;
    v18[3] = &unk_263FCA540;
    id v11 = v12;
    id v19 = v11;
    [v13 enumerateKeysAndObjectsUsingBlock:v18];
  }
  char v22 = @"teamID";
  id v14 = [(DRSTeamTasking *)self teamID];
  v23[0] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v16 = (void *)[v15 mutableCopy];

  if (v5) {
    [v16 setObject:v5 forKeyedSubscript:@"config"];
  }
  if (v6) {
    [v16 setObject:v6 forKeyedSubscript:@"defaultSamplingParameters"];
  }
  if (v8) {
    [v16 setObject:v8 forKeyedSubscript:@"perTimezoneSamplingParameters"];
  }
  if (v11) {
    [v16 setObject:v11 forKeyedSubscript:@"perHWModelSamplingParameters"];
  }

  return v16;
}

void __42__DRSTeamTasking__jsonDictRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 jsonDictRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __42__DRSTeamTasking__jsonDictRepresentation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 jsonDictRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (id)jsonDictRepresentation
{
  return [(DRSTeamTasking *)self _jsonDictRepresentation:1];
}

- (id)jsonDictRepresentationAbbreviated
{
  return [(DRSTeamTasking *)self _jsonDictRepresentation:0];
}

- (id)debugDescription
{
  v2 = [(DRSTeamTasking *)self jsonDictRepresentation];
  v3 = [v2 description];

  return v3;
}

- (DRSTeamTasking)initWithJSONDict:(id)a3 receivedDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"teamID"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v10 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid team ID", buf, 2u);
      }
      goto LABEL_13;
    }
    v9 = [v6 objectForKeyedSubscript:@"config"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v16 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid configDict", buf, 2u);
      }

      uint64_t v15 = 0;
      v10 = v9;
      goto LABEL_45;
    }
    v10 = [objc_alloc(MEMORY[0x263F3A180]) initWithJSONDict:v9 receivedDate:v7];

    id v11 = [v6 objectForKeyedSubscript:@"defaultSamplingParameters"];
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v13 = DPLogHandle_TaskingMessageError();
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)buf = 0;
          id v14 = "Invalid defaultSamplingParametersDict";
          goto LABEL_27;
        }
LABEL_28:

LABEL_13:
        uint64_t v15 = 0;
LABEL_45:

        goto LABEL_46;
      }
      id v12 = [[DRSSamplingParameters alloc] initWithJSONDict:v11];
      if (!v12)
      {
        id v13 = DPLogHandle_TaskingMessageError();
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)buf = 0;
          id v14 = "Invalid defaultSamplingParameters";
LABEL_27:
          _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", v14, buf, 2u);
          goto LABEL_28;
        }
        goto LABEL_28;
      }
    }
    else
    {
      id v12 = 0;
    }

    id v17 = [v6 objectForKeyedSubscript:@"perTimezoneSamplingParameters"];
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = DPLogHandle_TaskingMessageError();
        if (os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perTimezoneSamplingParametersDict", buf, 2u);
        }

        id v19 = 0;
        goto LABEL_43;
      }
      *(void *)buf = 0;
      v34 = buf;
      uint64_t v35 = 0x2020000000;
      char v36 = 0;
      id v18 = [MEMORY[0x263EFF9A0] dictionary];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __48__DRSTeamTasking_initWithJSONDict_receivedDate___block_invoke;
      v30[3] = &unk_263FCA568;
      uint64_t v32 = buf;
      id v19 = v18;
      id v31 = v19;
      [v17 enumerateKeysAndObjectsUsingBlock:v30];
      int v20 = v34[24];

      _Block_object_dispose(buf, 8);
      if (v20)
      {
LABEL_43:
        uint64_t v15 = 0;
        goto LABEL_44;
      }
    }
    else
    {
      id v19 = 0;
    }

    id v21 = [v6 objectForKeyedSubscript:@"perHWModelSamplingParameters"];
    if (!v21)
    {
      id v17 = 0;
LABEL_38:

      self = [(DRSTeamTasking *)self initWithTeamID:v8 config:v10 defaultSamplingParameters:v12 perTimezoneSamplingParameters:v19 perHardwareModelSamplingParamters:v17];
      uint64_t v15 = self;
LABEL_44:

      goto LABEL_45;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(void *)buf = 0;
      v34 = buf;
      uint64_t v35 = 0x2020000000;
      char v36 = 0;
      char v22 = [MEMORY[0x263EFF9A0] dictionary];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __48__DRSTeamTasking_initWithJSONDict_receivedDate___block_invoke_62;
      v27[3] = &unk_263FCA568;
      v29 = buf;
      id v17 = v22;
      id v28 = v17;
      [v21 enumerateKeysAndObjectsUsingBlock:v27];
      int v23 = v34[24];

      _Block_object_dispose(buf, 8);
      if (!v23) {
        goto LABEL_38;
      }
    }
    else
    {
      v25 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perHWModelSamplingParametersDict", buf, 2u);
      }

      id v17 = 0;
    }

    goto LABEL_43;
  }
  id v8 = DPLogHandle_TaskingMessageError();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "nil JSON dict", buf, 2u);
  }
  uint64_t v15 = 0;
LABEL_46:

  return v15;
}

void __48__DRSTeamTasking_initWithJSONDict_receivedDate___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [[DRSSamplingParameters alloc] initWithJSONDict:v8];
    if (v9)
    {
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
    }
    else
    {
      id v11 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)id v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perTimezoneSamplingParameters value", v12, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    v10 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perTimezoneSamplingParametersDict value", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __48__DRSTeamTasking_initWithJSONDict_receivedDate___block_invoke_62(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [[DRSSamplingParameters alloc] initWithJSONDict:v8];
    if (v9)
    {
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
    }
    else
    {
      id v11 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)id v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perHWModelSamplingParametersDict value", v12, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    v10 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perHWModelSamplingParametersDict value", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (NSString)teamID
{
  return self->_teamID;
}

- (DRConfig)config
{
  return self->_config;
}

- (DRSSamplingParameters)defaultSamplingParameters
{
  return self->_defaultSamplingParameters;
}

- (NSDictionary)perTimezoneSamplingParameters
{
  return self->_perTimezoneSamplingParameters;
}

- (NSDictionary)perHWModelSamplingParameters
{
  return self->_perHWModelSamplingParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perHWModelSamplingParameters, 0);
  objc_storeStrong((id *)&self->_perTimezoneSamplingParameters, 0);
  objc_storeStrong((id *)&self->_defaultSamplingParameters, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_teamID, 0);
}

@end