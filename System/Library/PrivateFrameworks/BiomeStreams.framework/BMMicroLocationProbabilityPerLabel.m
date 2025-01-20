@interface BMMicroLocationProbabilityPerLabel
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMMicroLocationProbabilityPerLabel)initWithLabelIdentifier:(id)a3 probability:(double)a4;
- (BMMicroLocationProbabilityPerLabel)initWithProto:(id)a3;
- (BMMicroLocationProbabilityPerLabel)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSUUID)labelIdentifier;
- (double)probability;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
@end

@implementation BMMicroLocationProbabilityPerLabel

- (BMMicroLocationProbabilityPerLabel)initWithLabelIdentifier:(id)a3 probability:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMMicroLocationProbabilityPerLabel;
  v7 = [(BMMicroLocationProbabilityPerLabel *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    labelIdentifier = v7->_labelIdentifier;
    v7->_labelIdentifier = (NSUUID *)v8;

    v7->_probability = a4;
  }

  return v7;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMMicroLocationProbabilityPerLabel eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMMicroLocationProbabilityPerLabel *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMMicroLocationProbabilityPerLabel)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([v5 hasLabel]
        && ([v5 hasProbability] & 1) != 0)
      {
        id v6 = objc_alloc(MEMORY[0x1E4F29128]);
        v7 = [v5 label];
        uint64_t v8 = (void *)[v6 initWithUUIDString:v7];
        [v5 probability];
        self = -[BMMicroLocationProbabilityPerLabel initWithLabelIdentifier:probability:](self, "initWithLabelIdentifier:probability:", v8);

        v9 = self;
LABEL_13:

        goto LABEL_14;
      }
      v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BMMicroLocationProbabilityPerLabel initWithProto:]();
      }
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMMicroLocationProbabilityPerLabel initWithProto:]();
      }
    }
    v9 = 0;
    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (BMMicroLocationProbabilityPerLabel)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[BMPBProbabilityPerLabel alloc] initWithData:v4];

    self = [(BMMicroLocationProbabilityPerLabel *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_labelIdentifier UUIDString];
  [v3 setLabel:v4];

  [v3 setProbability:self->_probability];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_labelIdentifier hash];
  id v4 = [NSNumber numberWithDouble:self->_probability];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v12 = 0;
    goto LABEL_15;
  }
  id v7 = v6;
  uint64_t v8 = v7;
  labelIdentifier = self->_labelIdentifier;
  v10 = labelIdentifier;
  if (!labelIdentifier)
  {
    uint64_t v3 = [v7 labelIdentifier];
    if (!v3)
    {
      int v11 = 0;
      goto LABEL_10;
    }
    v10 = self->_labelIdentifier;
  }
  id v4 = [v8 labelIdentifier];
  if (![(NSUUID *)v10 isEqual:v4])
  {
    BOOL v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  int v11 = 1;
LABEL_10:
  double probability = self->_probability;
  [v8 probability];
  BOOL v12 = vabdd_f64(probability, v14) < 2.22044605e-16;
  if (v11) {
    goto LABEL_11;
  }
LABEL_12:
  if (!labelIdentifier) {

  }
LABEL_15:
  return v12;
}

- (NSUUID)labelIdentifier
{
  return self->_labelIdentifier;
}

- (double)probability
{
  return self->_probability;
}

- (void).cxx_destruct
{
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMMicroLocationProbabilityPerLabel: Mismatched data versions (%u != %u) cannot deserialize", v1, 0xEu);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMMicroLocationProbabilityPerLabel: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMMicroLocationProbabilityPerLabel: tried to initialize with a non-BMMicroLocationProbabilityPerLabel proto", v2, v3, v4, v5, v6);
}

@end