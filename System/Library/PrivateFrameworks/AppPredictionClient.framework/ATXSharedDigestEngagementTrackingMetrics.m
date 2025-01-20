@interface ATXSharedDigestEngagementTrackingMetrics
+ (BOOL)supportsSecureCoding;
- (ATXSharedDigestEngagementTrackingMetrics)initWithCoder:(id)a3;
- (ATXSharedDigestEngagementTrackingMetrics)initWithProto:(id)a3;
- (ATXSharedDigestEngagementTrackingMetrics)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXSharedDigestEngagementTrackingMetrics:(id)a3;
- (NSString)sectionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)json;
- (id)jsonRepresentation;
- (id)proto;
- (unint64_t)numDigestExpansions;
- (unint64_t)numEngagementsAfterExpiration;
- (unint64_t)numEngagementsInScheduled;
- (unint64_t)numEngagementsInUpcoming;
- (unint64_t)numExpansions;
- (unint64_t)sectionPosition;
- (unint64_t)sectionSize;
- (void)addMetricsFromOtherTracker:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setNumDigestExpansions:(unint64_t)a3;
- (void)setNumEngagementsAfterExpiration:(unint64_t)a3;
- (void)setNumEngagementsInScheduled:(unint64_t)a3;
- (void)setNumEngagementsInUpcoming:(unint64_t)a3;
- (void)setNumExpansions:(unint64_t)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSectionPosition:(unint64_t)a3;
- (void)setSectionSize:(unint64_t)a3;
@end

@implementation ATXSharedDigestEngagementTrackingMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ATXSharedDigestEngagementTrackingMetrics allocWithZone:a3] init];
  [(ATXSharedDigestEngagementTrackingMetrics *)v4 setNumEngagementsInUpcoming:[(ATXSharedDigestEngagementTrackingMetrics *)self numEngagementsInUpcoming]];
  [(ATXSharedDigestEngagementTrackingMetrics *)v4 setNumEngagementsInScheduled:[(ATXSharedDigestEngagementTrackingMetrics *)self numEngagementsInScheduled]];
  [(ATXSharedDigestEngagementTrackingMetrics *)v4 setNumEngagementsAfterExpiration:[(ATXSharedDigestEngagementTrackingMetrics *)self numEngagementsAfterExpiration]];
  [(ATXSharedDigestEngagementTrackingMetrics *)v4 setNumExpansions:[(ATXSharedDigestEngagementTrackingMetrics *)self numExpansions]];
  [(ATXSharedDigestEngagementTrackingMetrics *)v4 setNumDigestExpansions:[(ATXSharedDigestEngagementTrackingMetrics *)self numDigestExpansions]];
  v5 = [(ATXSharedDigestEngagementTrackingMetrics *)self sectionIdentifier];
  [(ATXSharedDigestEngagementTrackingMetrics *)v4 setSectionIdentifier:v5];

  [(ATXSharedDigestEngagementTrackingMetrics *)v4 setSectionPosition:[(ATXSharedDigestEngagementTrackingMetrics *)self sectionPosition]];
  [(ATXSharedDigestEngagementTrackingMetrics *)v4 setSectionSize:[(ATXSharedDigestEngagementTrackingMetrics *)self sectionSize]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXSharedDigestEngagementTrackingMetrics *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXSharedDigestEngagementTrackingMetrics *)self isEqualToATXSharedDigestEngagementTrackingMetrics:v5];

  return v6;
}

- (BOOL)isEqualToATXSharedDigestEngagementTrackingMetrics:(id)a3
{
  v4 = a3;
  unint64_t v5 = [(ATXSharedDigestEngagementTrackingMetrics *)self numEngagementsInUpcoming];
  if (v5 == [v4 numEngagementsInUpcoming]
    && (unint64_t v6 = [(ATXSharedDigestEngagementTrackingMetrics *)self numEngagementsInScheduled],
        v6 == [v4 numEngagementsInScheduled])
    && (unint64_t v7 = -[ATXSharedDigestEngagementTrackingMetrics numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"), v7 == [v4 numEngagementsAfterExpiration])&& (v8 = -[ATXSharedDigestEngagementTrackingMetrics numExpansions](self, "numExpansions"), v8 == objc_msgSend(v4, "numExpansions"))&& (v9 = -[ATXSharedDigestEngagementTrackingMetrics numDigestExpansions](self, "numDigestExpansions"), v9 == objc_msgSend(v4, "numDigestExpansions"))&& (v10 = -[ATXSharedDigestEngagementTrackingMetrics sectionPosition](self, "sectionPosition"), v10 == objc_msgSend(v4, "sectionPosition"))&& (v11 = -[ATXSharedDigestEngagementTrackingMetrics sectionSize](self, "sectionSize"), v11 == objc_msgSend(v4, "sectionSize")))
  {
    v12 = self->_sectionIdentifier;
    v13 = v12;
    if (v12 == (NSString *)v4[6]) {
      char v14 = 1;
    }
    else {
      char v14 = -[NSString isEqual:](v12, "isEqual:");
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)addMetricsFromOtherTracker:(id)a3
{
  id v4 = a3;
  -[ATXSharedDigestEngagementTrackingMetrics setNumEngagementsAfterExpiration:](self, "setNumEngagementsAfterExpiration:", -[ATXSharedDigestEngagementTrackingMetrics numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration")+ [v4 numEngagementsAfterExpiration]);
  -[ATXSharedDigestEngagementTrackingMetrics setNumEngagementsInScheduled:](self, "setNumEngagementsInScheduled:", -[ATXSharedDigestEngagementTrackingMetrics numEngagementsInScheduled](self, "numEngagementsInScheduled")+ [v4 numEngagementsInScheduled]);
  -[ATXSharedDigestEngagementTrackingMetrics setNumEngagementsInUpcoming:](self, "setNumEngagementsInUpcoming:", -[ATXSharedDigestEngagementTrackingMetrics numEngagementsInUpcoming](self, "numEngagementsInUpcoming")+ [v4 numEngagementsInUpcoming]);
  uint64_t v5 = [v4 numExpansions];

  unint64_t v6 = [(ATXSharedDigestEngagementTrackingMetrics *)self numExpansions] + v5;

  [(ATXSharedDigestEngagementTrackingMetrics *)self setNumExpansions:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXSharedDigestEngagementTrackingMetrics *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXSharedDigestEngagementTrackingMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXSharedDigestEngagementTrackingMetrics *)self initWithProtoData:v5];
    unint64_t v6 = self;
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXSharedDigestEngagementTrackingMetrics *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXSharedDigestEngagementTrackingMetrics)initWithProto:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXSharedDigestEngagementTrackingMetrics;
  id v5 = [(ATXSharedDigestEngagementTrackingMetrics *)&v13 init];
  if (!v5) {
    goto LABEL_5;
  }
  if (!v4)
  {
LABEL_9:
    unint64_t v10 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)v5, v11);
    }

    goto LABEL_9;
  }
  id v6 = v4;
  v5->_numEngagementsInUpcoming = [v6 numEngagementsInUpcoming];
  v5->_numEngagementsInScheduled = [v6 numEngagementsInScheduled];
  v5->_numEngagementsAfterExpiration = [v6 numEngagementsAfterExpiration];
  v5->_numExpansions = [v6 numExpansions];
  uint64_t v7 = [v6 sectionIdentifier];
  sectionIdentifier = v5->_sectionIdentifier;
  v5->_sectionIdentifier = (NSString *)v7;

  v5->_sectionPosition = [v6 sectionPosition];
  v5->_sectionSize = [v6 sectionSize];
  uint64_t v9 = [v6 numDigestExpansions];

  v5->_numDigestExpansions = v9;
LABEL_5:
  unint64_t v10 = v5;
LABEL_10:

  return v10;
}

- (ATXSharedDigestEngagementTrackingMetrics)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBSharedDigestEngagementTrackingMetrics alloc] initWithData:v4];

    self = [(ATXSharedDigestEngagementTrackingMetrics *)self initWithProto:v5];
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
  [v3 setNumEngagementsInUpcoming:self->_numEngagementsInUpcoming];
  [v3 setNumEngagementsInScheduled:self->_numEngagementsInScheduled];
  [v3 setNumEngagementsAfterExpiration:self->_numEngagementsAfterExpiration];
  [v3 setNumExpansions:self->_numExpansions];
  [v3 setSectionIdentifier:self->_sectionIdentifier];
  [v3 setSectionPosition:self->_sectionPosition];
  [v3 setSectionSize:self->_sectionSize];
  [v3 setNumDigestExpansions:self->_numDigestExpansions];

  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBSharedDigestEngagementTrackingMetrics alloc] initFromJSON:v4];

  id v6 = [(ATXSharedDigestEngagementTrackingMetrics *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXSharedDigestEngagementTrackingMetrics *)self proto];
  v3 = [v2 jsonRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXSharedDigestEngagementTrackingMetrics *)self jsonDict];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (unint64_t)numEngagementsInUpcoming
{
  return self->_numEngagementsInUpcoming;
}

- (void)setNumEngagementsInUpcoming:(unint64_t)a3
{
  self->_numEngagementsInUpcoming = a3;
}

- (unint64_t)numEngagementsInScheduled
{
  return self->_numEngagementsInScheduled;
}

- (void)setNumEngagementsInScheduled:(unint64_t)a3
{
  self->_numEngagementsInScheduled = a3;
}

- (unint64_t)numEngagementsAfterExpiration
{
  return self->_numEngagementsAfterExpiration;
}

- (void)setNumEngagementsAfterExpiration:(unint64_t)a3
{
  self->_numEngagementsAfterExpiration = a3;
}

- (unint64_t)numExpansions
{
  return self->_numExpansions;
}

- (void)setNumExpansions:(unint64_t)a3
{
  self->_numExpansions = a3;
}

- (unint64_t)numDigestExpansions
{
  return self->_numDigestExpansions;
}

- (void)setNumDigestExpansions:(unint64_t)a3
{
  self->_numDigestExpansions = a3;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (unint64_t)sectionPosition
{
  return self->_sectionPosition;
}

- (void)setSectionPosition:(unint64_t)a3
{
  self->_sectionPosition = a3;
}

- (unint64_t)sectionSize
{
  return self->_sectionSize;
}

- (void)setSectionSize:(unint64_t)a3
{
  self->_sectionSize = a3;
}

- (void).cxx_destruct
{
}

@end