@interface NTKAkitaMorph
- (BOOL)isEqualToMorph:(id)a3;
- (NTKAkitaMorphConfig)config;
- (id)configurationString;
- (id)initFromConfigurationString:(id)a3;
- (id)initRandomNotMatching:(id)a3;
- (id)initRandomWithBackgroundColor:(unint64_t)a3 notMatching:(id)a4;
- (id)initStandardWithBackgroundColor:(unint64_t)a3;
@end

@implementation NTKAkitaMorph

- (id)initStandardWithBackgroundColor:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NTKAkitaMorph;
  v4 = [(NTKAkitaMorph *)&v12 init];
  v5 = v4;
  if (v4)
  {
    p_config = &v4->_config;
    if (qword_154A0 != -1) {
      dispatch_once(&qword_154A0, &stru_10318);
    }
    v7 = (long long *)((char *)&unk_154A8 + 64 * (a3 % 0x13));
    long long v8 = *v7;
    long long v9 = v7[1];
    long long v10 = v7[3];
    *(_OWORD *)&v5->_config.hairPathIndex = v7[2];
    *(_OWORD *)&v5->_config.nosePathIndex = v10;
    *(_OWORD *)&p_config->backgroundColor = v8;
    *(_OWORD *)&v5->_config.skinColor = v9;
  }
  return v5;
}

- (id)initRandomWithBackgroundColor:(unint64_t)a3 notMatching:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKAkitaMorph;
  v7 = [(NTKAkitaMorph *)&v18 init];
  if (v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    if (v6)
    {
      [v6 config];
    }
    else
    {
      *(void *)&long long v8 = -1;
      *((void *)&v8 + 1) = -1;
      long long v16 = v8;
      long long v17 = v8;
      long long v14 = v8;
      long long v15 = v8;
    }
    v12[0] = v14;
    v12[1] = v15;
    v12[2] = v16;
    v12[3] = v17;
    sub_4E18(a3, v12, (uint64_t)v13);
    long long v9 = v13[1];
    *(_OWORD *)(v7 + 8) = v13[0];
    *(_OWORD *)(v7 + 24) = v9;
    long long v10 = v13[3];
    *(_OWORD *)(v7 + 40) = v13[2];
    *(_OWORD *)(v7 + 56) = v10;
  }

  return v7;
}

- (id)initRandomNotMatching:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKAkitaMorph;
  v5 = [(NTKAkitaMorph *)&v20 init];
  if (v5)
  {
    if (v4)
    {
      [v4 config];
      uint64_t v6 = *(void *)v15;
      long long v16 = *(_OWORD *)&v15[8];
      long long v17 = *(_OWORD *)&v15[24];
      long long v18 = *(_OWORD *)&v15[40];
      uint64_t v19 = *(void *)&v15[56];
    }
    else
    {
      uint64_t v6 = -1;
      uint64_t v19 = -1;
      *(void *)&long long v7 = -1;
      *((void *)&v7 + 1) = -1;
      long long v17 = v7;
      long long v18 = v7;
      long long v16 = v7;
    }
    do
      uint32_t v8 = arc4random_uniform(0x13u);
    while (v6 == v8);
    uint64_t v10 = v6;
    long long v11 = v16;
    long long v12 = v17;
    long long v13 = v18;
    uint64_t v14 = v19;
    sub_4E18(v8, &v10, (uint64_t)v15);
    *(_OWORD *)(v5 + 8) = *(_OWORD *)v15;
    *(_OWORD *)(v5 + 24) = *(_OWORD *)&v15[16];
    *(_OWORD *)(v5 + 40) = *(_OWORD *)&v15[32];
    *(_OWORD *)(v5 + 56) = *(_OWORD *)&v15[48];
  }

  return v5;
}

- (id)initFromConfigurationString:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NTKAkitaMorph;
  v5 = [(NTKAkitaMorph *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 dataUsingEncoding:4];
    if (qword_154A0 != -1) {
      dispatch_once(&qword_154A0, &stru_10318);
    }
    long long v27 = xmmword_15568;
    long long v28 = unk_15578;
    long long v29 = xmmword_15588;
    long long v30 = unk_15598;
    long long v33 = xmmword_15568;
    long long v34 = unk_15578;
    long long v35 = xmmword_15588;
    long long v36 = unk_15598;
    id v32 = 0;
    long long v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v32];
    id v8 = v32;
    id v9 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v25 = v6;
      id v26 = v8;
      id v10 = v9;
      objc_opt_class();
      objc_opt_class();
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v11 = [v10 allKeys];
      id v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v42;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v42 != v14) {
              objc_enumerationMutation(v11);
            }
            if (!*(void *)(*((void *)&v41 + 1) + 8 * i) || (objc_opt_isKindOfClass() & 1) == 0)
            {

              id v21 = 0;
              uint64_t v6 = v25;
              goto LABEL_28;
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v16 = [v10 allValues];
      id v17 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
      uint64_t v6 = v25;
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v38;
        while (2)
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v16);
            }
            if (!*(void *)(*((void *)&v37 + 1) + 8 * (void)j) || (objc_opt_isKindOfClass() & 1) == 0)
            {

              id v21 = 0;
              goto LABEL_28;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      id v21 = v10;
LABEL_28:

      id v8 = v26;
    }
    else
    {
      id v21 = 0;
    }

    if (!v8
      && v21
      && (!sub_5C58(&v27, v21, @"backgroundColor", 0x13uLL)
       || !sub_5C58((void *)&v27 + 1, v21, @"hairColor", 0x13uLL)
       || !sub_5C58(&v28, v21, @"skinColor", 0x13uLL)
       || !sub_5C58((void *)&v28 + 1, v21, @"shirtColor", 0x13uLL)
       || !sub_5C58(&v29, v21, @"hairPathIndex", 0xCuLL)
       || !sub_5C58((void *)&v29 + 1, v21, @"bodyPathIndex", 0xAuLL)
       || !sub_5C58(&v30, v21, @"nosePathIndex", 6uLL)
       || (sub_5C58((void *)&v30 + 1, v21, @"lipsPathIndex", 9uLL) & 1) == 0))
    {
      long long v27 = v33;
      long long v28 = v34;
      long long v29 = v35;
      long long v30 = v36;
    }

    long long v22 = v28;
    *(_OWORD *)(v5 + 8) = v27;
    *(_OWORD *)(v5 + 24) = v22;
    long long v23 = v30;
    *(_OWORD *)(v5 + 40) = v29;
    *(_OWORD *)(v5 + 56) = v23;
  }

  return v5;
}

- (BOOL)isEqualToMorph:(id)a3
{
  if (!a3) {
    return 0;
  }
  memset(v5, 0, 40);
  [a3 config];
  return *(_OWORD *)&self->_config.backgroundColor == 0
      && self->_config.skinColor == *(void *)&v5[0]
      && *(_OWORD *)&self->_config.shirtColor == *(_OWORD *)((char *)v5 + 8)
      && *(_OWORD *)&self->_config.bodyPathIndex == *(_OWORD *)((char *)&v5[1] + 8)
      && self->_config.lipsPathIndex == 0;
}

- (id)configurationString
{
  long long v2 = *(_OWORD *)&self->_config.skinColor;
  v6[0] = *(_OWORD *)&self->_config.backgroundColor;
  v6[1] = v2;
  long long v3 = *(_OWORD *)&self->_config.nosePathIndex;
  v6[2] = *(_OWORD *)&self->_config.hairPathIndex;
  v6[3] = v3;
  id v4 = sub_4A58(v6);

  return v4;
}

- (NTKAkitaMorphConfig)config
{
  long long v3 = *(_OWORD *)&self->shirtColor;
  *(_OWORD *)&retstr->backgroundColor = *(_OWORD *)&self->hairColor;
  *(_OWORD *)&retstr->skinColor = v3;
  long long v4 = *(_OWORD *)&self->lipsPathIndex;
  *(_OWORD *)&retstr->hairPathIndex = *(_OWORD *)&self->bodyPathIndex;
  *(_OWORD *)&retstr->nosePathIndex = v4;
  return self;
}

@end