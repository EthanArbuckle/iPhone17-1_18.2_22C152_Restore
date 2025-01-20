@interface AXMAudioDataSourceMixer
- (AXMAudioDataSourceMixer)initWithName:(id)a3 sampleRate:(double)a4 circular:(BOOL)a5;
- (BOOL)isMonoOutput;
- (NSSet)dataSources;
- (NSString)name;
- (double)panning;
- (id)description;
- (void)addDataSource:(id)a3;
- (void)prepareNextSamples:(unint64_t)a3;
- (void)removeAllDataSources;
- (void)removeDataSource:(id)a3;
- (void)setCurrentSampleIndex:(unint64_t)a3;
- (void)setDataSources:(id)a3;
- (void)setName:(id)a3;
- (void)setPanning:(double)a3;
@end

@implementation AXMAudioDataSourceMixer

- (AXMAudioDataSourceMixer)initWithName:(id)a3 sampleRate:(double)a4 circular:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXMAudioDataSourceMixer;
  v9 = [(AXMAudioDataSource *)&v14 initWithName:v8 sampleRate:v5 circular:a4];
  v10 = v9;
  if (v9)
  {
    v9->_panning = 0.5;
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
    dataSources = v10->_dataSources;
    v10->_dataSources = (NSSet *)v11;
  }
  return v10;
}

- (void)setCurrentSampleIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(AXMAudioDataSource *)self currentSampleIndex];
  if ([(AXMAudioDataSource *)self isCircular])
  {
    unint64_t v6 = a3 % [(AXMAudioDataSource *)self length];
  }
  else if ((a3 & 0x8000000000000000) != 0)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v7 = [(AXMAudioDataSource *)self length] - 1;
    unint64_t v6 = a3;
    if (v7 < a3) {
      unint64_t v6 = [(AXMAudioDataSource *)self length] - 1;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)AXMAudioDataSourceMixer;
  [(AXMAudioDataSource *)&v17 setCurrentSampleIndex:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(AXMAudioDataSourceMixer *)self dataSources];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    unint64_t v10 = a3 - v5;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setCurrentSampleIndex:", v10 + objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "currentSampleIndex"));
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)addDataSource:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "setCurrentSampleIndex:", -[AXMAudioDataSource currentSampleIndex](self, "currentSampleIndex"));
  v4 = (void *)MEMORY[0x1E4F1CA80];
  unint64_t v5 = [(AXMAudioDataSourceMixer *)self dataSources];
  unint64_t v6 = [v4 setWithSet:v5];

  [v6 addObject:v9];
  unint64_t v7 = (NSSet *)[v6 copy];
  dataSources = self->_dataSources;
  self->_dataSources = v7;
}

- (void)removeDataSource:(id)a3
{
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1CA80];
  unint64_t v5 = [(AXMAudioDataSourceMixer *)self dataSources];
  unint64_t v6 = [v4 setWithSet:v5];

  [v6 removeObject:v9];
  unint64_t v7 = (NSSet *)[v6 copy];
  dataSources = self->_dataSources;
  self->_dataSources = v7;
}

- (void)removeAllDataSources
{
  v3 = [MEMORY[0x1E4F1CAD0] set];
  dataSources = self->_dataSources;
  self->_dataSources = v3;
}

- (void)prepareNextSamples:(unint64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v26 = [(AXMAudioDataSource *)self sampleBuffer];
  if (a3)
  {
    uint64_t v4 = 0;
    do
    {
      BOOL v5 = [(AXMAudioDataSource *)self isCircular];
      unint64_t v6 = [(AXMAudioDataSource *)self currentSampleIndex] + v4;
      if (v5) {
        v6 %= [(AXMAudioDataSource *)self length];
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      unint64_t v7 = [(AXMAudioDataSourceMixer *)self dataSources];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
      unint64_t v27 = v6;
      uint64_t v9 = 0;
      if (v8)
      {
        uint64_t v10 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if ([v12 isCircular])
            {
              uint64_t v13 = [v12 currentSampleIndex];
              unint64_t v14 = (v13 + v4) % (unint64_t)[v12 length];
            }
            else
            {
              unint64_t v14 = [v12 currentSampleIndex] + v4;
            }
            long long v15 = (void *)[v12 sampleBuffer];
            if (v14 < [v12 length])
            {
              [v12 level];
              double v17 = v16;
              int v18 = *(_DWORD *)(*v15 + 4 * v14);
              [(AXMAudioDataSource *)self level];
              double v20 = v19 * (double)(uint64_t)((double)v9 + v17 * (double)v18);
              uint64_t v9 = (uint64_t)v20;
              unint64_t v21 = (uint64_t)v20 >= 0 ? (uint64_t)v20 : -v9;
              if (v21 >= 0x7EF5)
              {
                if (v9 > 0) {
                  uint64_t v9 = 32500;
                }
                else {
                  uint64_t v9 = -32500;
                }
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v8);
      }

      if (v27 < (uint64_t)(v26[1] - *v26) >> 2)
      {
        if ([(AXMAudioDataSourceMixer *)self isMonoOutput])
        {
          *(_DWORD *)(*v26 + 4 * v27) = v9;
        }
        else
        {
          [(AXMAudioDataSourceMixer *)self panning];
          double v23 = v22;
          [(AXMAudioDataSourceMixer *)self panning];
          *(_DWORD *)(*v26 + 4 * v27) = (int)((1.0 - v23) * (double)v9) + ((int)(v24 * (double)v9) << 16);
        }
      }
      ++v4;
    }
    while (v4 != a3);
  }
}

- (BOOL)isMonoOutput
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(AXMAudioDataSourceMixer *)self name];
  BOOL v6 = [(AXMAudioDataSource *)self isCircular];
  unint64_t v7 = [(AXMAudioDataSource *)self currentSampleIndex];
  unint64_t v8 = [(AXMAudioDataSource *)self length];
  uint64_t v9 = [(AXMAudioDataSourceMixer *)self dataSources];
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p name=%@ circular=%d currentSample=%lu length=%lu sources=\n%@>", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)panning
{
  return self->_panning;
}

- (void)setPanning:(double)a3
{
  self->_panning = a3;
}

- (NSSet)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSources, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end