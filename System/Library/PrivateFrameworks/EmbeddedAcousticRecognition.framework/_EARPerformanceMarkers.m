@interface _EARPerformanceMarkers
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)correctAlignedPartialResultIndexList;
- (NSArray)correctPartialResultIndexList;
- (NSArray)tokenDelayInMilliSeconds;
- (_EARPerformanceMarkers)initWithCoder:(id)a3;
- (_EARPerformanceMarkers)initWithCorrectPartialResultIndexList:(id)a3 correctAlignedPartialResultIndexList:(id)a4 tokenDelayInMilliseconds:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EARPerformanceMarkers

- (_EARPerformanceMarkers)initWithCorrectPartialResultIndexList:(id)a3 correctAlignedPartialResultIndexList:(id)a4 tokenDelayInMilliseconds:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_EARPerformanceMarkers;
  v12 = [(_EARPerformanceMarkers *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_correctPartialResultIndexList, a3);
    objc_storeStrong((id *)&v13->_correctAlignedPartialResultIndexList, a4);
    objc_storeStrong((id *)&v13->_tokenDelayInMilliSeconds, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_correctPartialResultIndexList forKey:@"correctPartialResultIndexList"];
  [v4 encodeObject:self->_correctAlignedPartialResultIndexList forKey:@"correctAlignedPartialResultIndexList"];
  [v4 encodeObject:self->_tokenDelayInMilliSeconds forKey:@"tokenDelayInMilliSeconds"];
}

- (_EARPerformanceMarkers)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_EARPerformanceMarkers;
  v5 = [(_EARPerformanceMarkers *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"correctPartialResultIndexList"];
    correctPartialResultIndexList = v5->_correctPartialResultIndexList;
    v5->_correctPartialResultIndexList = (NSArray *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"correctAlignedPartialResultIndexList"];
    correctAlignedPartialResultIndexList = v5->_correctAlignedPartialResultIndexList;
    v5->_correctAlignedPartialResultIndexList = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"tokenDelayInMilliSeconds"];
    tokenDelayInMilliSeconds = v5->_tokenDelayInMilliSeconds;
    v5->_tokenDelayInMilliSeconds = (NSArray *)v19;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (_EARPerformanceMarkers *)a3;
  v6 = v5;
  if (v5 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = v6;
        correctPartialResultIndexList = self->_correctPartialResultIndexList;
        uint64_t v9 = [(_EARPerformanceMarkers *)v7 correctPartialResultIndexList];
        if (correctPartialResultIndexList != v9)
        {
          id v10 = self->_correctPartialResultIndexList;
          id v11 = [(_EARPerformanceMarkers *)v7 correctPartialResultIndexList];
          if (![(NSArray *)v10 isEqualToArray:v11])
          {
            char v12 = 0;
            goto LABEL_19;
          }
          v21 = v11;
        }
        correctAlignedPartialResultIndexList = self->_correctAlignedPartialResultIndexList;
        uint64_t v14 = [(_EARPerformanceMarkers *)v7 correctAlignedPartialResultIndexList];
        if (correctAlignedPartialResultIndexList == v14
          || (objc_super v15 = self->_correctAlignedPartialResultIndexList,
              [(_EARPerformanceMarkers *)v7 correctAlignedPartialResultIndexList],
              v3 = objc_claimAutoreleasedReturnValue(),
              [(NSArray *)v15 isEqualToArray:v3]))
        {
          tokenDelayInMilliSeconds = self->_tokenDelayInMilliSeconds;
          v17 = [(_EARPerformanceMarkers *)v7 tokenDelayInMilliSeconds];
          if (tokenDelayInMilliSeconds == v17)
          {

            char v12 = 1;
          }
          else
          {
            v18 = self->_tokenDelayInMilliSeconds;
            uint64_t v19 = [(_EARPerformanceMarkers *)v7 tokenDelayInMilliSeconds];
            char v12 = [(NSArray *)v18 isEqualToArray:v19];
          }
          if (correctAlignedPartialResultIndexList == v14)
          {
LABEL_18:

            id v11 = v21;
            if (correctPartialResultIndexList == v9)
            {
LABEL_20:

              goto LABEL_21;
            }
LABEL_19:

            goto LABEL_20;
          }
        }
        else
        {
          char v12 = 0;
        }

        goto LABEL_18;
      }
    }
    char v12 = 0;
  }
LABEL_21:

  return v12;
}

- (NSArray)correctPartialResultIndexList
{
  return self->_correctPartialResultIndexList;
}

- (NSArray)correctAlignedPartialResultIndexList
{
  return self->_correctAlignedPartialResultIndexList;
}

- (NSArray)tokenDelayInMilliSeconds
{
  return self->_tokenDelayInMilliSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenDelayInMilliSeconds, 0);
  objc_storeStrong((id *)&self->_correctAlignedPartialResultIndexList, 0);
  objc_storeStrong((id *)&self->_correctPartialResultIndexList, 0);
}

@end