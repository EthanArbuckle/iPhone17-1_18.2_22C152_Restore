@interface CHSTimelineEntryRelevanceBox
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSTimelineEntryRelevanceBox)init;
- (CHSTimelineEntryRelevanceBox)initWithCoder:(id)a3;
- (CHSTimelineEntryRelevanceBox)initWithEntries:(id)a3;
- (NSDictionary)timelineRelevanceEntries;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForEncoding;
- (void)setTimelineRelevanceEntries:(id)a3;
@end

@implementation CHSTimelineEntryRelevanceBox

- (CHSTimelineEntryRelevanceBox)init
{
  v3 = objc_opt_new();
  v4 = [(CHSTimelineEntryRelevanceBox *)self initWithEntries:v3];

  return v4;
}

- (CHSTimelineEntryRelevanceBox)initWithEntries:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSTimelineEntryRelevanceBox;
  v6 = [(CHSTimelineEntryRelevanceBox *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_timelineRelevanceEntries, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_timelineRelevanceEntries hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4[2] isEqualToDictionary:self->_timelineRelevanceEntries];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)prepareForEncoding
{
  v3 = [(CHSTimelineEntryRelevanceBox *)self bs_secureEncoded];
  archivedData = self->_archivedData;
  self->_archivedData = v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSDictionary *)self->_timelineRelevanceEntries copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (CHSTimelineEntryRelevanceBox)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHSTimelineEntryRelevanceBox;
  uint64_t v5 = [(CHSTimelineEntryRelevanceBox *)&v14 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"data"])
    {
      v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
      objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureObjectFromData:ofClass:", v6, objc_opt_class());
      p_isa = (id *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v5->_timelineRelevanceEntries, p_isa[2]);
    }
    else
    {
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      v6 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
      uint64_t v12 = [v4 decodeObjectOfClasses:v6 forKey:@"timelineRelevanceEntries"];
      p_isa = (id *)&v5->_timelineRelevanceEntries->super.isa;
      v5->_timelineRelevanceEntries = (NSDictionary *)v12;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  archivedData = self->_archivedData;
  id v6 = v4;
  if (archivedData) {
    [v4 encodeObject:archivedData forKey:@"data"];
  }
  else {
    [v4 encodeObject:self->_timelineRelevanceEntries forKey:@"timelineRelevanceEntries"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)timelineRelevanceEntries
{
  return self->_timelineRelevanceEntries;
}

- (void)setTimelineRelevanceEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineRelevanceEntries, 0);
  objc_storeStrong((id *)&self->_archivedData, 0);
}

@end