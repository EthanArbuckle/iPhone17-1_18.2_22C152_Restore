@interface MUUserInteractionExploreGuide
- (BOOL)hasGuidesLocationEntry;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guidesLocationEntry;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGuidesLocationEntry:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MUUserInteractionExploreGuide

- (BOOL)hasGuidesLocationEntry
{
  return self->_guidesLocationEntry != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MUUserInteractionExploreGuide;
  v4 = [(MUUserInteractionExploreGuide *)&v8 description];
  v5 = [(MUUserInteractionExploreGuide *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  guidesLocationEntry = self->_guidesLocationEntry;
  if (guidesLocationEntry) {
    [v3 setObject:guidesLocationEntry forKey:@"guidesLocationEntry"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MUUserInteractionExploreGuideReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_guidesLocationEntry) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  guidesLocationEntry = self->_guidesLocationEntry;
  if (guidesLocationEntry) {
    [a3 setGuidesLocationEntry:guidesLocationEntry];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_guidesLocationEntry copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    guidesLocationEntry = self->_guidesLocationEntry;
    if ((unint64_t)guidesLocationEntry | v4[1]) {
      char v6 = -[NSString isEqual:](guidesLocationEntry, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_guidesLocationEntry hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[MUUserInteractionExploreGuide setGuidesLocationEntry:](self, "setGuidesLocationEntry:");
  }
}

- (NSString)guidesLocationEntry
{
  return self->_guidesLocationEntry;
}

- (void)setGuidesLocationEntry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end