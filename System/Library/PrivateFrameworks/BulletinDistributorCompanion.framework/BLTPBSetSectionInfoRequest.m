@interface BLTPBSetSectionInfoRequest
+ (Class)keypathsType;
- (BLTPBSectionInfo)sectionInfo;
- (BOOL)hasSectionInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)keypaths;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keypathsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)keypathsCount;
- (void)addKeypaths:(id)a3;
- (void)clearKeypaths;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKeypaths:(id)a3;
- (void)setSectionInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSetSectionInfoRequest

- (BOOL)hasSectionInfo
{
  return self->_sectionInfo != 0;
}

- (void)clearKeypaths
{
}

- (void)addKeypaths:(id)a3
{
  id v4 = a3;
  keypaths = self->_keypaths;
  id v8 = v4;
  if (!keypaths)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_keypaths;
    self->_keypaths = v6;

    id v4 = v8;
    keypaths = self->_keypaths;
  }
  [(NSMutableArray *)keypaths addObject:v4];
}

- (unint64_t)keypathsCount
{
  return [(NSMutableArray *)self->_keypaths count];
}

- (id)keypathsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keypaths objectAtIndex:a3];
}

+ (Class)keypathsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSetSectionInfoRequest;
  id v4 = [(BLTPBSetSectionInfoRequest *)&v8 description];
  v5 = [(BLTPBSetSectionInfoRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  sectionInfo = self->_sectionInfo;
  if (sectionInfo)
  {
    v5 = [(BLTPBSectionInfo *)sectionInfo dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sectionInfo"];
  }
  keypaths = self->_keypaths;
  if (keypaths) {
    [v3 setObject:keypaths forKey:@"keypaths"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetSectionInfoRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_sectionInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_keypaths;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_sectionInfo) {
    objc_msgSend(v8, "setSectionInfo:");
  }
  if ([(BLTPBSetSectionInfoRequest *)self keypathsCount])
  {
    [v8 clearKeypaths];
    unint64_t v4 = [(BLTPBSetSectionInfoRequest *)self keypathsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BLTPBSetSectionInfoRequest *)self keypathsAtIndex:i];
        [v8 addKeypaths:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(BLTPBSectionInfo *)self->_sectionInfo copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_keypaths;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addKeypaths:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sectionInfo = self->_sectionInfo, !((unint64_t)sectionInfo | v4[2]))
     || -[BLTPBSectionInfo isEqual:](sectionInfo, "isEqual:")))
  {
    keypaths = self->_keypaths;
    if ((unint64_t)keypaths | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](keypaths, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BLTPBSectionInfo *)self->_sectionInfo hash];
  return [(NSMutableArray *)self->_keypaths hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sectionInfo = self->_sectionInfo;
  uint64_t v6 = *((void *)v4 + 2);
  if (sectionInfo)
  {
    if (v6) {
      -[BLTPBSectionInfo mergeFrom:](sectionInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BLTPBSetSectionInfoRequest setSectionInfo:](self, "setSectionInfo:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[BLTPBSetSectionInfoRequest addKeypaths:](self, "addKeypaths:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BLTPBSectionInfo)sectionInfo
{
  return self->_sectionInfo;
}

- (void)setSectionInfo:(id)a3
{
}

- (NSMutableArray)keypaths
{
  return self->_keypaths;
}

- (void)setKeypaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_storeStrong((id *)&self->_keypaths, 0);
}

@end