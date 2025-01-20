@interface GEORPAuxiliaryControl
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCar;
- (BOOL)hasWatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPAuxiliaryControl)init;
- (GEORPAuxiliaryControl)initWithData:(id)a3;
- (GEORPAuxiliaryControl)initWithDictionary:(id)a3;
- (GEORPAuxiliaryControl)initWithJSON:(id)a3;
- (GEORPCarPlayAuxiliaryControl)car;
- (GEORPWatchAuxiliaryControl)watch;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readCar;
- (void)_readWatch;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCar:(id)a3;
- (void)setWatch:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPAuxiliaryControl

- (GEORPAuxiliaryControl)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPAuxiliaryControl;
  v2 = [(GEORPAuxiliaryControl *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAuxiliaryControl)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPAuxiliaryControl;
  v3 = [(GEORPAuxiliaryControl *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWatch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAuxiliaryControlReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWatch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasWatch
{
  return self->_watch != 0;
}

- (GEORPWatchAuxiliaryControl)watch
{
  -[GEORPAuxiliaryControl _readWatch]((uint64_t)self);
  watch = self->_watch;

  return watch;
}

- (void)setWatch:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_watch, a3);
}

- (void)_readCar
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPAuxiliaryControlReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCar_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCar
{
  return self->_car != 0;
}

- (GEORPCarPlayAuxiliaryControl)car
{
  -[GEORPAuxiliaryControl _readCar]((uint64_t)self);
  car = self->_car;

  return car;
}

- (void)setCar:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_car, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPAuxiliaryControl;
  v4 = [(GEORPAuxiliaryControl *)&v8 description];
  v5 = [(GEORPAuxiliaryControl *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAuxiliaryControl _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 watch];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"watch"];
    }
    objc_super v8 = [a1 car];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"car"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPAuxiliaryControl _dictionaryRepresentation:](self, 1);
}

- (GEORPAuxiliaryControl)initWithDictionary:(id)a3
{
  return (GEORPAuxiliaryControl *)-[GEORPAuxiliaryControl _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"watch"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEORPWatchAuxiliaryControl alloc];
        if (a3) {
          uint64_t v8 = [(GEORPWatchAuxiliaryControl *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPWatchAuxiliaryControl *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setWatch:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"car"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEORPCarPlayAuxiliaryControl alloc];
        if (a3) {
          uint64_t v12 = [(GEORPCarPlayAuxiliaryControl *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEORPCarPlayAuxiliaryControl *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setCar:v12];
      }
    }
  }

  return a1;
}

- (GEORPAuxiliaryControl)initWithJSON:(id)a3
{
  return (GEORPAuxiliaryControl *)-[GEORPAuxiliaryControl _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_97;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_98;
    }
    GEORPAuxiliaryControlReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPWatchAuxiliaryControl *)self->_watch readAll:1];
    [(GEORPCarPlayAuxiliaryControl *)self->_car readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAuxiliaryControlIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAuxiliaryControlReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPAuxiliaryControlIsDirty((uint64_t)self) & 1) == 0)
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPAuxiliaryControl *)self readAll:0];
    if (self->_watch) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_car) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPAuxiliaryControl *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_watch) {
    objc_msgSend(v4, "setWatch:");
  }
  if (self->_car) {
    objc_msgSend(v4, "setCar:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPAuxiliaryControl *)self readAll:0];
    id v8 = [(GEORPWatchAuxiliaryControl *)self->_watch copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    id v10 = [(GEORPCarPlayAuxiliaryControl *)self->_car copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPAuxiliaryControlReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPAuxiliaryControl *)self readAll:1],
         [v4 readAll:1],
         watch = self->_watch,
         !((unint64_t)watch | v4[3]))
     || -[GEORPWatchAuxiliaryControl isEqual:](watch, "isEqual:")))
  {
    car = self->_car;
    if ((unint64_t)car | v4[2]) {
      char v7 = -[GEORPCarPlayAuxiliaryControl isEqual:](car, "isEqual:");
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
  [(GEORPAuxiliaryControl *)self readAll:1];
  unint64_t v3 = [(GEORPWatchAuxiliaryControl *)self->_watch hash];
  return [(GEORPCarPlayAuxiliaryControl *)self->_car hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  watch = self->_watch;
  uint64_t v5 = v8[3];
  if (watch)
  {
    if (v5) {
      -[GEORPWatchAuxiliaryControl mergeFrom:](watch, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPAuxiliaryControl setWatch:](self, "setWatch:");
  }
  car = self->_car;
  uint64_t v7 = v8[2];
  if (car)
  {
    if (v7) {
      -[GEORPCarPlayAuxiliaryControl mergeFrom:](car, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPAuxiliaryControl setCar:](self, "setCar:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_car, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end