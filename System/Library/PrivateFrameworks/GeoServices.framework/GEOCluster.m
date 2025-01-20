@interface GEOCluster
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCluster)init;
- (GEOCluster)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readContainer;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setContainer:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOCluster

- (GEOCluster)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCluster;
  v2 = [(GEOCluster *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCluster)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCluster;
  v3 = [(GEOCluster *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCluster;
  [(GEOCluster *)&v3 dealloc];
}

- (void)_readContainer
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 60) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOClusterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContainer_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (id)container
{
  if (a1)
  {
    v2 = a1;
    -[GEOCluster _readContainer]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setContainer:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 60) |= 2u;
  *(unsigned char *)(a1 + 60) |= 4u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCluster;
  id v4 = [(GEOCluster *)&v8 description];
  v5 = [(GEOCluster *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCluster _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOCluster readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOCluster container]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"container"];
    }
    if (*(void *)(a1 + 24))
    {
      objc_super v8 = PBRepeatedInt32NSArray();
      [v4 setObject:v8 forKey:@"index"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCluster _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_274_0;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_275_0;
      }
      GEOClusterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 40) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOClusterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_8;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_8;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if (GEOPlaceResultIsDirty((os_unfair_lock_s *)self->_container)) {
      goto LABEL_8;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v11 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
    objc_super v8 = v11;
    goto LABEL_13;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCluster readAll:]((uint64_t)self, 0);
  if (self->_container) {
    PBDataWriterWriteSubmessage();
  }
  p_indexs = &self->_indexs;
  objc_super v8 = v11;
  if (p_indexs->count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      objc_super v8 = v11;
      ++v10;
    }
    while (v10 < p_indexs->count);
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOCluster readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPlaceResult *)self->_container copyWithZone:a3];
    v9 = (void *)v5[5];
    v5[5] = v8;

    PBRepeatedInt32Copy();
    return v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOClusterReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOCluster readAll:]((uint64_t)self, 1),
         -[GEOCluster readAll:]((uint64_t)v4, 1),
         container = self->_container,
         !((unint64_t)container | v4[5]))
     || -[GEOPlaceResult isEqual:](container, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOCluster readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPlaceResult *)self->_container hash];
  return PBRepeatedInt32Hash() ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end