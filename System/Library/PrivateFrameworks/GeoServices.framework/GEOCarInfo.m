@interface GEOCarInfo
+ (BOOL)isValid:(id)a3;
+ (GEOCarInfo)carInfoWithTraits:(id)a3;
- (BOOL)destinationSharingEnabled;
- (BOOL)hasBrightness;
- (BOOL)hasCarName;
- (BOOL)hasColorRange;
- (BOOL)hasDestinationSharingEnabled;
- (BOOL)hasDeviceConnection;
- (BOOL)hasIsInstructionCardEnabled;
- (BOOL)hasIsInstrumentClusterEnabled;
- (BOOL)hasIsMapviewEnabled;
- (BOOL)hasManufacturer;
- (BOOL)hasModel;
- (BOOL)hasNavAidedDrivingStatus;
- (BOOL)hasScreenDimension;
- (BOOL)hasScreenResolution;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstructionCardEnabled;
- (BOOL)isInstrumentClusterEnabled;
- (BOOL)isMapviewEnabled;
- (BOOL)readFrom:(id)a3;
- (GEOCarInfo)init;
- (GEOCarInfo)initWithData:(id)a3;
- (GEOCarInfo)initWithDictionary:(id)a3;
- (GEOCarInfo)initWithJSON:(id)a3;
- (GEOCarInfo)initWithTraits:(id)a3;
- (GEOScreenDimension)screenDimension;
- (GEOScreenResolution)screenResolution;
- (NSString)carName;
- (NSString)manufacturer;
- (NSString)model;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceConnectionAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)engineTypesAsString:(int)a3;
- (id)inputMethodsAsString:(int)a3;
- (id)jsonRepresentation;
- (id)navAidedDrivingStatusAsString:(int)a3;
- (int)StringAsDeviceConnection:(id)a3;
- (int)StringAsEngineTypes:(id)a3;
- (int)StringAsInputMethods:(id)a3;
- (int)StringAsNavAidedDrivingStatus:(id)a3;
- (int)brightness;
- (int)colorRange;
- (int)deviceConnection;
- (int)engineTypeAtIndex:(unint64_t)a3;
- (int)engineTypes;
- (int)inputMethodAtIndex:(unint64_t)a3;
- (int)inputMethods;
- (int)navAidedDrivingStatus;
- (unint64_t)engineTypesCount;
- (unint64_t)hash;
- (unint64_t)inputMethodsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCarName;
- (void)_readEngineTypes;
- (void)_readInputMethods;
- (void)_readManufacturer;
- (void)_readModel;
- (void)_readScreenDimension;
- (void)addEngineType:(int)a3;
- (void)addInputMethod:(int)a3;
- (void)clearEngineTypes;
- (void)clearInputMethods;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBrightness:(int)a3;
- (void)setCarName:(id)a3;
- (void)setColorRange:(int)a3;
- (void)setDestinationSharingEnabled:(BOOL)a3;
- (void)setDeviceConnection:(int)a3;
- (void)setEngineTypes:(int *)a3 count:(unint64_t)a4;
- (void)setHasBrightness:(BOOL)a3;
- (void)setHasColorRange:(BOOL)a3;
- (void)setHasDestinationSharingEnabled:(BOOL)a3;
- (void)setHasDeviceConnection:(BOOL)a3;
- (void)setHasIsInstructionCardEnabled:(BOOL)a3;
- (void)setHasIsInstrumentClusterEnabled:(BOOL)a3;
- (void)setHasIsMapviewEnabled:(BOOL)a3;
- (void)setHasNavAidedDrivingStatus:(BOOL)a3;
- (void)setHasScreenResolution:(BOOL)a3;
- (void)setInputMethods:(int *)a3 count:(unint64_t)a4;
- (void)setIsInstructionCardEnabled:(BOOL)a3;
- (void)setIsInstrumentClusterEnabled:(BOOL)a3;
- (void)setIsMapviewEnabled:(BOOL)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setNavAidedDrivingStatus:(int)a3;
- (void)setScreenDimension:(id)a3;
- (void)setScreenResolution:(GEOScreenResolution *)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCarInfo

- (GEOCarInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCarInfo;
  v2 = [(GEOCarInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCarInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCarInfo;
  v3 = [(GEOCarInfo *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCarInfo;
  [(GEOCarInfo *)&v3 dealloc];
}

- (void)_readManufacturer
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 161) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readManufacturer_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasManufacturer
{
  return self->_manufacturer != 0;
}

- (NSString)manufacturer
{
  -[GEOCarInfo _readManufacturer]((uint64_t)self);
  manufacturer = self->_manufacturer;

  return manufacturer;
}

- (void)setManufacturer:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_manufacturer, a3);
}

- (void)_readModel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 161) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (NSString)model
{
  -[GEOCarInfo _readModel]((uint64_t)self);
  model = self->_model;

  return model;
}

- (void)setModel:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_model, a3);
}

- (GEOScreenResolution)screenResolution
{
  *retstr = self[3];
  return self;
}

- (void)setScreenResolution:(GEOScreenResolution *)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  uint64_t v3 = *(void *)&a3->_has;
  *(_OWORD *)&self->_screenResolution._height = *(_OWORD *)&a3->_height;
  *(void *)&self->_screenResolution._has = v3;
}

- (void)setHasScreenResolution:(BOOL)a3
{
  self->_flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasScreenResolution
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)deviceConnection
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_deviceConnection;
  }
  else {
    return 0;
  }
}

- (void)setDeviceConnection:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_deviceConnection = a3;
}

- (void)setHasDeviceConnection:(BOOL)a3
{
  if (a3) {
    int v3 = 65544;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$FE2B1A96AD49C8B211CE021377EF8B62 flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDeviceConnection
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)deviceConnectionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53EB648[a3];
  }

  return v3;
}

- (int)StringAsDeviceConnection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEVICE_CONNECTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEVICE_CONNECTION_CABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEVICE_CONNECTION_WIRELESS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)destinationSharingEnabled
{
  return self->_destinationSharingEnabled;
}

- (void)setDestinationSharingEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  self->_destinationSharingEnabled = a3;
}

- (void)setHasDestinationSharingEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 65568;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$FE2B1A96AD49C8B211CE021377EF8B62 flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasDestinationSharingEnabled
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (int)navAidedDrivingStatus
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_navAidedDrivingStatus;
  }
  else {
    return 0;
  }
}

- (void)setNavAidedDrivingStatus:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_navAidedDrivingStatus = a3;
}

- (void)setHasNavAidedDrivingStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 65552;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$FE2B1A96AD49C8B211CE021377EF8B62 flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasNavAidedDrivingStatus
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)navAidedDrivingStatusAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53EB660[a3];
  }

  return v3;
}

- (int)StringAsNavAidedDrivingStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NAD_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNAVAILABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OFF"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ON"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readEngineTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 161) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEngineTypes_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)engineTypesCount
{
  return self->_engineTypes.count;
}

- (int)engineTypes
{
  return self->_engineTypes.list;
}

- (void)clearEngineTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;

  PBRepeatedInt32Clear();
}

- (void)addEngineType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (int)engineTypeAtIndex:(unint64_t)a3
{
  -[GEOCarInfo _readEngineTypes]((uint64_t)self);
  p_engineTypes = &self->_engineTypes;
  unint64_t count = self->_engineTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_engineTypes->list[a3];
}

- (void)setEngineTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;

  MEMORY[0x1F4147390](&self->_engineTypes, a3, a4);
}

- (id)engineTypesAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53EB680[a3];
  }

  return v3;
}

- (int)StringAsEngineTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CAR_ENGINE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CAR_ENGINE_TYPE_GASOLINE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CAR_ENGINE_TYPE_DIESEL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CAR_ENGINE_TYPE_ELECTRIC"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CAR_ENGINE_TYPE_CNG"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readCarName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 161) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCarName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (NSString)carName
{
  -[GEOCarInfo _readCarName]((uint64_t)self);
  carName = self->_carName;

  return carName;
}

- (void)setCarName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_carName, a3);
}

- (void)_readScreenDimension
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 161) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScreenDimension_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasScreenDimension
{
  return self->_screenDimension != 0;
}

- (GEOScreenDimension)screenDimension
{
  -[GEOCarInfo _readScreenDimension]((uint64_t)self);
  screenDimension = self->_screenDimension;

  return screenDimension;
}

- (void)setScreenDimension:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x18000u;
  objc_storeStrong((id *)&self->_screenDimension, a3);
}

- (int)colorRange
{
  return self->_colorRange;
}

- (void)setColorRange:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_colorRange = a3;
}

- (void)setHasColorRange:(BOOL)a3
{
  if (a3) {
    int v3 = 65540;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$FE2B1A96AD49C8B211CE021377EF8B62 flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasColorRange
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)brightness
{
  return self->_brightness;
}

- (void)setBrightness:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_brightness = a3;
}

- (void)setHasBrightness:(BOOL)a3
{
  if (a3) {
    int v3 = 65538;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$FE2B1A96AD49C8B211CE021377EF8B62 flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasBrightness
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readInputMethods
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 161) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCarInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInputMethods_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)inputMethodsCount
{
  return self->_inputMethods.count;
}

- (int)inputMethods
{
  return self->_inputMethods.list;
}

- (void)clearInputMethods
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;

  PBRepeatedInt32Clear();
}

- (void)addInputMethod:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (int)inputMethodAtIndex:(unint64_t)a3
{
  -[GEOCarInfo _readInputMethods]((uint64_t)self);
  p_inputMethods = &self->_inputMethods;
  unint64_t count = self->_inputMethods.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_inputMethods->list[a3];
}

- (void)setInputMethods:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;

  MEMORY[0x1F4147390](&self->_inputMethods, a3, a4);
}

- (id)inputMethodsAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53EB6A8[a3];
  }

  return v3;
}

- (int)StringAsInputMethods:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_INPUT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KNOB"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TOUCHPAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TOUCHSCREEN_HIFI"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TOUCHSCREEN_LOFI"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isInstrumentClusterEnabled
{
  return self->_isInstrumentClusterEnabled;
}

- (void)setIsInstrumentClusterEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  self->_isInstrumentClusterEnabled = a3;
}

- (void)setHasIsInstrumentClusterEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 65664;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$FE2B1A96AD49C8B211CE021377EF8B62 flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasIsInstrumentClusterEnabled
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (BOOL)isInstructionCardEnabled
{
  return self->_isInstructionCardEnabled;
}

- (void)setIsInstructionCardEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  self->_isInstructionCardEnabled = a3;
}

- (void)setHasIsInstructionCardEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 65600;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$FE2B1A96AD49C8B211CE021377EF8B62 flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasIsInstructionCardEnabled
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)isMapviewEnabled
{
  return self->_isMapviewEnabled;
}

- (void)setIsMapviewEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  self->_isMapviewEnabled = a3;
}

- (void)setHasIsMapviewEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 65792;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$FE2B1A96AD49C8B211CE021377EF8B62 flags = ($FE2B1A96AD49C8B211CE021377EF8B62)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasIsMapviewEnabled
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCarInfo;
  int v4 = [(GEOCarInfo *)&v8 description];
  v5 = [(GEOCarInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCarInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_76;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 manufacturer];
  if (v5) {
    [v4 setObject:v5 forKey:@"manufacturer"];
  }

  objc_super v6 = [(id)a1 model];
  if (v6) {
    [v4 setObject:v6 forKey:@"model"];
  }

  int v7 = *(_DWORD *)(a1 + 160);
  if (v7)
  {
    objc_super v8 = _GEOScreenResolutionDictionaryRepresentation(a1 + 72);
    [v4 setObject:v8 forKey:@"screenResolution"];

    int v7 = *(_DWORD *)(a1 + 160);
  }
  if ((v7 & 8) != 0)
  {
    uint64_t v9 = *(int *)(a1 + 148);
    if (v9 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 148));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E53EB648[v9];
    }
    [v4 setObject:v10 forKey:@"deviceConnection"];

    int v7 = *(_DWORD *)(a1 + 160);
  }
  if ((v7 & 0x20) != 0)
  {
    v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 156)];
    if (a2) {
      v12 = @"destinationSharingEnabled";
    }
    else {
      v12 = @"destination_sharing_enabled";
    }
    [v4 setObject:v11 forKey:v12];

    int v7 = *(_DWORD *)(a1 + 160);
  }
  if ((v7 & 0x10) != 0)
  {
    uint64_t v13 = *(int *)(a1 + 152);
    if (v13 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 152));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E53EB660[v13];
    }
    if (a2) {
      v15 = @"navAidedDrivingStatus";
    }
    else {
      v15 = @"nav_aided_driving_status";
    }
    [v4 setObject:v14 forKey:v15];
  }
  if (*(void *)(a1 + 32))
  {
    v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v17 = (void *)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      unint64_t v18 = 0;
      do
      {
        uint64_t v19 = *(int *)(*v17 + 4 * v18);
        if (v19 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = off_1E53EB680[v19];
        }
        [v16 addObject:v20];

        ++v18;
        v17 = (void *)(a1 + 24);
      }
      while (v18 < *(void *)(a1 + 32));
    }
    if (a2) {
      v21 = @"engineType";
    }
    else {
      v21 = @"engine_type";
    }
    [v4 setObject:v16 forKey:v21];
  }
  v22 = [(id)a1 carName];
  if (v22)
  {
    if (a2) {
      v23 = @"carName";
    }
    else {
      v23 = @"car_name";
    }
    [v4 setObject:v22 forKey:v23];
  }

  v24 = [(id)a1 screenDimension];
  v25 = v24;
  if (v24)
  {
    if (a2)
    {
      v26 = [v24 jsonRepresentation];
      v27 = @"screenDimension";
    }
    else
    {
      v26 = [v24 dictionaryRepresentation];
      v27 = @"screen_dimension";
    }
    [v4 setObject:v26 forKey:v27];
  }
  int v28 = *(_DWORD *)(a1 + 160);
  if ((v28 & 4) != 0)
  {
    v29 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 144)];
    if (a2) {
      v30 = @"colorRange";
    }
    else {
      v30 = @"color_range";
    }
    [v4 setObject:v29 forKey:v30];

    int v28 = *(_DWORD *)(a1 + 160);
  }
  if ((v28 & 2) != 0)
  {
    v31 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 140)];
    [v4 setObject:v31 forKey:@"brightness"];
  }
  if (*(void *)(a1 + 56))
  {
    v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v33 = (void *)(a1 + 48);
    if (*(void *)(a1 + 56))
    {
      unint64_t v34 = 0;
      do
      {
        uint64_t v35 = *(int *)(*v33 + 4 * v34);
        if (v35 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v35);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = off_1E53EB6A8[v35];
        }
        [v32 addObject:v36];

        ++v34;
        v33 = (void *)(a1 + 48);
      }
      while (v34 < *(void *)(a1 + 56));
    }
    if (a2) {
      v37 = @"inputMethod";
    }
    else {
      v37 = @"input_method";
    }
    [v4 setObject:v32 forKey:v37];
  }
  int v38 = *(_DWORD *)(a1 + 160);
  if ((v38 & 0x80) != 0)
  {
    v48 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 158)];
    if (a2) {
      v49 = @"isInstrumentClusterEnabled";
    }
    else {
      v49 = @"is_instrument_cluster_enabled";
    }
    [v4 setObject:v48 forKey:v49];

    int v38 = *(_DWORD *)(a1 + 160);
    if ((v38 & 0x40) == 0)
    {
LABEL_67:
      if ((v38 & 0x100) == 0) {
        goto LABEL_72;
      }
      goto LABEL_68;
    }
  }
  else if ((v38 & 0x40) == 0)
  {
    goto LABEL_67;
  }
  v50 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 157)];
  if (a2) {
    v51 = @"isInstructionCardEnabled";
  }
  else {
    v51 = @"is_instruction_card_enabled";
  }
  [v4 setObject:v50 forKey:v51];

  if ((*(_DWORD *)(a1 + 160) & 0x100) != 0)
  {
LABEL_68:
    v39 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 159)];
    if (a2) {
      v40 = @"isMapviewEnabled";
    }
    else {
      v40 = @"is_mapview_enabled";
    }
    [v4 setObject:v39 forKey:v40];
  }
LABEL_72:
  v41 = *(void **)(a1 + 16);
  if (v41)
  {
    v42 = [v41 dictionaryRepresentation];
    v43 = v42;
    if (a2)
    {
      v44 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v42, "count"));
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __40__GEOCarInfo__dictionaryRepresentation___block_invoke;
      v52[3] = &unk_1E53D8860;
      id v45 = v44;
      id v53 = v45;
      [v43 enumerateKeysAndObjectsUsingBlock:v52];
      id v46 = v45;

      v43 = v46;
    }
    [v4 setObject:v43 forKey:@"Unknown Fields"];
  }
LABEL_76:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCarInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOCarInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOCarInfo)initWithDictionary:(id)a3
{
  return (GEOCarInfo *)-[GEOCarInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    objc_super v6 = 0;
    goto LABEL_135;
  }
  objc_super v6 = (void *)[a1 init];
  if (v6)
  {
    int v7 = [v5 objectForKeyedSubscript:@"manufacturer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = (void *)[v7 copy];
      [v6 setManufacturer:v8];
    }
    uint64_t v9 = [v5 objectForKeyedSubscript:@"model"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (void *)[v9 copy];
      [v6 setModel:v10];
    }
    v11 = [v5 objectForKeyedSubscript:@"screenResolution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v72 = 0uLL;
      uint64_t v73 = 0;
      _GEOScreenResolutionFromDictionaryRepresentation(v11, (uint64_t)&v72);
      long long v70 = v72;
      uint64_t v71 = v73;
      [v6 setScreenResolution:&v70];
    }

    v12 = [v5 objectForKeyedSubscript:@"deviceConnection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      if ([v13 isEqualToString:@"DEVICE_CONNECTION_UNKNOWN"])
      {
        uint64_t v14 = 0;
      }
      else if ([v13 isEqualToString:@"DEVICE_CONNECTION_CABLE"])
      {
        uint64_t v14 = 1;
      }
      else if ([v13 isEqualToString:@"DEVICE_CONNECTION_WIRELESS"])
      {
        uint64_t v14 = 2;
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      uint64_t v14 = [v12 intValue];
    }
    [v6 setDeviceConnection:v14];
LABEL_21:

    if (a3) {
      v15 = @"destinationSharingEnabled";
    }
    else {
      v15 = @"destination_sharing_enabled";
    }
    v16 = [v5 objectForKeyedSubscript:v15];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setDestinationSharingEnabled:", objc_msgSend(v16, "BOOLValue"));
    }

    if (a3) {
      v17 = @"navAidedDrivingStatus";
    }
    else {
      v17 = @"nav_aided_driving_status";
    }
    unint64_t v18 = [v5 objectForKeyedSubscript:v17];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v18;
      if ([v19 isEqualToString:@"NAD_UNKNOWN"])
      {
        uint64_t v20 = 0;
      }
      else if ([v19 isEqualToString:@"UNAVAILABLE"])
      {
        uint64_t v20 = 1;
      }
      else if ([v19 isEqualToString:@"OFF"])
      {
        uint64_t v20 = 2;
      }
      else if ([v19 isEqualToString:@"ON"])
      {
        uint64_t v20 = 3;
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_43:

        if (a3) {
          v21 = @"engineType";
        }
        else {
          v21 = @"engine_type";
        }
        v22 = [v5 objectForKeyedSubscript:v21];
        objc_opt_class();
        int v61 = a3;
        if (objc_opt_isKindOfClass())
        {
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          v59 = v22;
          id v23 = v22;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v66 objects:v75 count:16];
          if (!v24) {
            goto LABEL_70;
          }
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v67;
          while (1)
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v67 != v26) {
                objc_enumerationMutation(v23);
              }
              int v28 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v29 = v28;
                if ([v29 isEqualToString:@"CAR_ENGINE_TYPE_UNKNOWN"])
                {
                  uint64_t v30 = 0;
                }
                else if ([v29 isEqualToString:@"CAR_ENGINE_TYPE_GASOLINE"])
                {
                  uint64_t v30 = 1;
                }
                else if ([v29 isEqualToString:@"CAR_ENGINE_TYPE_DIESEL"])
                {
                  uint64_t v30 = 2;
                }
                else if ([v29 isEqualToString:@"CAR_ENGINE_TYPE_ELECTRIC"])
                {
                  uint64_t v30 = 3;
                }
                else if ([v29 isEqualToString:@"CAR_ENGINE_TYPE_CNG"])
                {
                  uint64_t v30 = 4;
                }
                else
                {
                  uint64_t v30 = 0;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                uint64_t v30 = [v28 intValue];
              }
              [v6 addEngineType:v30];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v66 objects:v75 count:16];
            if (!v25)
            {
LABEL_70:

              a3 = v61;
              v22 = v59;
              break;
            }
          }
        }

        if (a3) {
          v31 = @"carName";
        }
        else {
          v31 = @"car_name";
        }
        v32 = [v5 objectForKeyedSubscript:v31];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v33 = (void *)[v32 copy];
          [v6 setCarName:v33];
        }
        if (a3) {
          unint64_t v34 = @"screenDimension";
        }
        else {
          unint64_t v34 = @"screen_dimension";
        }
        uint64_t v35 = [v5 objectForKeyedSubscript:v34];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v36 = [GEOScreenDimension alloc];
          if (a3) {
            uint64_t v37 = [(GEOScreenDimension *)v36 initWithJSON:v35];
          }
          else {
            uint64_t v37 = [(GEOScreenDimension *)v36 initWithDictionary:v35];
          }
          int v38 = (void *)v37;
          [v6 setScreenDimension:v37];
        }
        if (a3) {
          v39 = @"colorRange";
        }
        else {
          v39 = @"color_range";
        }
        v40 = [v5 objectForKeyedSubscript:v39];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setColorRange:", objc_msgSend(v40, "intValue"));
        }

        v41 = [v5 objectForKeyedSubscript:@"brightness"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setBrightness:", objc_msgSend(v41, "intValue"));
        }

        if (a3) {
          v42 = @"inputMethod";
        }
        else {
          v42 = @"input_method";
        }
        v43 = [v5 objectForKeyedSubscript:v42];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          v60 = v43;
          id v44 = v43;
          uint64_t v45 = [v44 countByEnumeratingWithState:&v62 objects:v74 count:16];
          if (!v45) {
            goto LABEL_118;
          }
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v63;
          while (1)
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v63 != v47) {
                objc_enumerationMutation(v44);
              }
              v49 = *(void **)(*((void *)&v62 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v50 = v49;
                if ([v50 isEqualToString:@"UNKNOWN_INPUT_TYPE"])
                {
                  uint64_t v51 = 0;
                }
                else if ([v50 isEqualToString:@"KNOB"])
                {
                  uint64_t v51 = 1;
                }
                else if ([v50 isEqualToString:@"TOUCHPAD"])
                {
                  uint64_t v51 = 2;
                }
                else if ([v50 isEqualToString:@"TOUCHSCREEN_HIFI"])
                {
                  uint64_t v51 = 3;
                }
                else if ([v50 isEqualToString:@"TOUCHSCREEN_LOFI"])
                {
                  uint64_t v51 = 4;
                }
                else
                {
                  uint64_t v51 = 0;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                uint64_t v51 = [v49 intValue];
              }
              [v6 addInputMethod:v51];
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v62 objects:v74 count:16];
            if (!v46)
            {
LABEL_118:

              a3 = v61;
              v43 = v60;
              break;
            }
          }
        }

        if (a3) {
          v52 = @"isInstrumentClusterEnabled";
        }
        else {
          v52 = @"is_instrument_cluster_enabled";
        }
        id v53 = [v5 objectForKeyedSubscript:v52];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setIsInstrumentClusterEnabled:", objc_msgSend(v53, "BOOLValue"));
        }

        if (a3) {
          v54 = @"isInstructionCardEnabled";
        }
        else {
          v54 = @"is_instruction_card_enabled";
        }
        v55 = [v5 objectForKeyedSubscript:v54];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setIsInstructionCardEnabled:", objc_msgSend(v55, "BOOLValue"));
        }

        if (a3) {
          v56 = @"isMapviewEnabled";
        }
        else {
          v56 = @"is_mapview_enabled";
        }
        v57 = [v5 objectForKeyedSubscript:v56];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setIsMapviewEnabled:", objc_msgSend(v57, "BOOLValue"));
        }

        goto LABEL_135;
      }
      uint64_t v20 = [v18 intValue];
    }
    [v6 setNavAidedDrivingStatus:v20];
    goto LABEL_43;
  }
LABEL_135:

  return v6;
}

- (GEOCarInfo)initWithJSON:(id)a3
{
  return (GEOCarInfo *)-[GEOCarInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    int v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_258;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_259;
    }
    GEOCarInfoReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOScreenDimension *)self->_screenDimension readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCarInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCarInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x1FC00) == 0)
    {
      v11 = self->_reader;
      objc_sync_enter(v11);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v12];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_39;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCarInfo *)self readAll:0];
  if (self->_manufacturer) {
    PBDataWriterWriteStringField();
  }
  if (self->_model) {
    PBDataWriterWriteStringField();
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    PBDataWriterPlaceMark();
    GEOScreenResolutionWriteTo((uint64_t)&self->_screenResolution);
    PBDataWriterRecallMark();
    $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_flags & 0x10) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
  if (self->_engineTypes.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_engineTypes.count);
  }
  if (self->_carName) {
    PBDataWriterWriteStringField();
  }
  if (self->_screenDimension) {
    PBDataWriterWriteSubmessage();
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    $FE2B1A96AD49C8B211CE021377EF8B62 v8 = self->_flags;
  }
  if ((*(unsigned char *)&v8 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_inputMethods.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_inputMethods.count);
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
    if ((*(unsigned char *)&v10 & 0x40) == 0) {
      goto LABEL_28;
    }
LABEL_36:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x100) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  $FE2B1A96AD49C8B211CE021377EF8B62 v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 0x40) != 0) {
    goto LABEL_36;
  }
LABEL_28:
  if ((*(_WORD *)&v10 & 0x100) != 0) {
LABEL_29:
  }
    PBDataWriterWriteBOOLField();
LABEL_30:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
LABEL_39:
}

- (void)copyTo:(id)a3
{
  v15 = (char *)a3;
  [(GEOCarInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v15 + 1, self->_reader);
  *((_DWORD *)v15 + 32) = self->_readerMarkPos;
  *((_DWORD *)v15 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_manufacturer) {
    objc_msgSend(v15, "setManufacturer:");
  }
  if (self->_model) {
    objc_msgSend(v15, "setModel:");
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    uint64_t v14 = *(void *)&self->_screenResolution._has;
    *(_OWORD *)(v15 + 72) = *(_OWORD *)&self->_screenResolution._height;
    *((void *)v15 + 11) = v14;
    *((_DWORD *)v15 + 40) |= 1u;
    $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_8;
      }
LABEL_35:
      v15[156] = self->_destinationSharingEnabled;
      *((_DWORD *)v15 + 40) |= 0x20u;
      if ((*(_DWORD *)&self->_flags & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v15 + 37) = self->_deviceConnection;
  *((_DWORD *)v15 + 40) |= 8u;
  $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    goto LABEL_35;
  }
LABEL_8:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)v15 + 38) = self->_navAidedDrivingStatus;
    *((_DWORD *)v15 + 40) |= 0x10u;
  }
LABEL_10:
  if ([(GEOCarInfo *)self engineTypesCount])
  {
    [v15 clearEngineTypes];
    unint64_t v5 = [(GEOCarInfo *)self engineTypesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v15, "addEngineType:", -[GEOCarInfo engineTypeAtIndex:](self, "engineTypeAtIndex:", i));
    }
  }
  if (self->_carName) {
    objc_msgSend(v15, "setCarName:");
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 v8 = v15;
  if (self->_screenDimension)
  {
    objc_msgSend(v15, "setScreenDimension:");
    $FE2B1A96AD49C8B211CE021377EF8B62 v8 = v15;
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
    v8[36] = self->_colorRange;
    v8[40] |= 4u;
    $FE2B1A96AD49C8B211CE021377EF8B62 v9 = self->_flags;
  }
  if ((*(unsigned char *)&v9 & 2) != 0)
  {
    v8[35] = self->_brightness;
    v8[40] |= 2u;
  }
  if ([(GEOCarInfo *)self inputMethodsCount])
  {
    [v15 clearInputMethods];
    unint64_t v10 = [(GEOCarInfo *)self inputMethodsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        objc_msgSend(v15, "addInputMethod:", -[GEOCarInfo inputMethodAtIndex:](self, "inputMethodAtIndex:", j));
    }
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 v13 = self->_flags;
  if ((*(unsigned char *)&v13 & 0x80) != 0)
  {
    v15[158] = self->_isInstrumentClusterEnabled;
    *((_DWORD *)v15 + 40) |= 0x80u;
    $FE2B1A96AD49C8B211CE021377EF8B62 v13 = self->_flags;
    if ((*(unsigned char *)&v13 & 0x40) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v13 & 0x100) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&v13 & 0x40) == 0)
  {
    goto LABEL_28;
  }
  v15[157] = self->_isInstructionCardEnabled;
  *((_DWORD *)v15 + 40) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_29:
    v15[159] = self->_isMapviewEnabled;
    *((_DWORD *)v15 + 40) |= 0x100u;
  }
LABEL_30:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCarInfo *)self readAll:0];
    uint64_t v9 = [(NSString *)self->_manufacturer copyWithZone:a3];
    unint64_t v10 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v9;

    uint64_t v11 = [(NSString *)self->_model copyWithZone:a3];
    v12 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v11;

    $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
    if (*(unsigned char *)&flags)
    {
      uint64_t v22 = *(void *)&self->_screenResolution._has;
      *(_OWORD *)(v5 + 72) = *(_OWORD *)&self->_screenResolution._height;
      *(void *)(v5 + 88) = v22;
      *(_DWORD *)(v5 + 160) |= 1u;
      $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
      if ((*(unsigned char *)&flags & 8) == 0)
      {
LABEL_7:
        if ((*(unsigned char *)&flags & 0x20) == 0) {
          goto LABEL_8;
        }
        goto LABEL_22;
      }
    }
    else if ((*(unsigned char *)&flags & 8) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 148) = self->_deviceConnection;
    *(_DWORD *)(v5 + 160) |= 8u;
    $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_8:
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
LABEL_22:
    *(unsigned char *)(v5 + 156) = self->_destinationSharingEnabled;
    *(_DWORD *)(v5 + 160) |= 0x20u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0)
    {
LABEL_10:
      PBRepeatedInt32Copy();
      uint64_t v14 = [(NSString *)self->_carName copyWithZone:a3];
      v15 = *(void **)(v5 + 96);
      *(void *)(v5 + 96) = v14;

      id v16 = [(GEOScreenDimension *)self->_screenDimension copyWithZone:a3];
      v17 = *(void **)(v5 + 120);
      *(void *)(v5 + 120) = v16;

      $FE2B1A96AD49C8B211CE021377EF8B62 v18 = self->_flags;
      if ((*(unsigned char *)&v18 & 4) != 0)
      {
        *(_DWORD *)(v5 + 144) = self->_colorRange;
        *(_DWORD *)(v5 + 160) |= 4u;
        $FE2B1A96AD49C8B211CE021377EF8B62 v18 = self->_flags;
      }
      if ((*(unsigned char *)&v18 & 2) != 0)
      {
        *(_DWORD *)(v5 + 140) = self->_brightness;
        *(_DWORD *)(v5 + 160) |= 2u;
      }
      PBRepeatedInt32Copy();
      $FE2B1A96AD49C8B211CE021377EF8B62 v19 = self->_flags;
      if ((*(unsigned char *)&v19 & 0x80) != 0)
      {
        *(unsigned char *)(v5 + 158) = self->_isInstrumentClusterEnabled;
        *(_DWORD *)(v5 + 160) |= 0x80u;
        $FE2B1A96AD49C8B211CE021377EF8B62 v19 = self->_flags;
        if ((*(unsigned char *)&v19 & 0x40) == 0)
        {
LABEL_16:
          if ((*(_WORD *)&v19 & 0x100) == 0)
          {
LABEL_18:
            uint64_t v20 = self->_unknownFields;
            id v8 = *(id *)(v5 + 16);
            *(void *)(v5 + 16) = v20;
            goto LABEL_19;
          }
LABEL_17:
          *(unsigned char *)(v5 + 159) = self->_isMapviewEnabled;
          *(_DWORD *)(v5 + 160) |= 0x100u;
          goto LABEL_18;
        }
      }
      else if ((*(unsigned char *)&v19 & 0x40) == 0)
      {
        goto LABEL_16;
      }
      *(unsigned char *)(v5 + 157) = self->_isInstructionCardEnabled;
      *(_DWORD *)(v5 + 160) |= 0x40u;
      if ((*(_DWORD *)&self->_flags & 0x100) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_9:
    *(_DWORD *)(v5 + 152) = self->_navAidedDrivingStatus;
    *(_DWORD *)(v5 + 160) |= 0x10u;
    goto LABEL_10;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if (*((unsigned char *)&self->_flags + 2))
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOCarInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_19:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_71;
  }
  [(GEOCarInfo *)self readAll:1];
  [v4 readAll:1];
  manufacturer = self->_manufacturer;
  if ((unint64_t)manufacturer | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](manufacturer, "isEqual:")) {
      goto LABEL_71;
    }
  }
  model = self->_model;
  if ((unint64_t)model | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](model, "isEqual:")) {
      goto LABEL_71;
    }
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
  int v8 = *((_DWORD *)v4 + 40);
  if (*(unsigned char *)&flags)
  {
    if ((v8 & 1) == 0) {
      goto LABEL_71;
    }
    BOOL v9 = *(void *)&self->_screenResolution._height == *((void *)v4 + 9)
      && *(void *)&self->_screenResolution._width == *((void *)v4 + 10);
    if (!v9 || *(void *)&self->_screenResolution._has != *((void *)v4 + 11)) {
      goto LABEL_71;
    }
  }
  else if (v8)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_deviceConnection != *((_DWORD *)v4 + 37)) {
      goto LABEL_71;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0) {
      goto LABEL_71;
    }
    if (self->_destinationSharingEnabled)
    {
      if (!*((unsigned char *)v4 + 156)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 156))
    {
      goto LABEL_71;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_navAidedDrivingStatus != *((_DWORD *)v4 + 38)) {
      goto LABEL_71;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_71;
  }
  carName = self->_carName;
  if ((unint64_t)carName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](carName, "isEqual:")) {
      goto LABEL_71;
    }
  }
  screenDimension = self->_screenDimension;
  if ((unint64_t)screenDimension | *((void *)v4 + 15))
  {
    if (!-[GEOScreenDimension isEqual:](screenDimension, "isEqual:")) {
      goto LABEL_71;
    }
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 v13 = self->_flags;
  int v14 = *((_DWORD *)v4 + 40);
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_colorRange != *((_DWORD *)v4 + 36)) {
      goto LABEL_71;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_brightness != *((_DWORD *)v4 + 35)) {
      goto LABEL_71;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_71;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_71:
    BOOL v17 = 0;
    goto LABEL_72;
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 v15 = self->_flags;
  int v16 = *((_DWORD *)v4 + 40);
  if ((*(unsigned char *)&v15 & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0) {
      goto LABEL_71;
    }
    if (self->_isInstrumentClusterEnabled)
    {
      if (!*((unsigned char *)v4 + 158)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 158))
    {
      goto LABEL_71;
    }
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&v15 & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0) {
      goto LABEL_71;
    }
    if (self->_isInstructionCardEnabled)
    {
      if (!*((unsigned char *)v4 + 157)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 157))
    {
      goto LABEL_71;
    }
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&v15 & 0x100) != 0)
  {
    if ((v16 & 0x100) != 0)
    {
      if (self->_isMapviewEnabled)
      {
        if (!*((unsigned char *)v4 + 159)) {
          goto LABEL_71;
        }
      }
      else if (*((unsigned char *)v4 + 159))
      {
        goto LABEL_71;
      }
      BOOL v17 = 1;
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  BOOL v17 = (*((_DWORD *)v4 + 40) & 0x100) == 0;
LABEL_72:

  return v17;
}

- (unint64_t)hash
{
  [(GEOCarInfo *)self readAll:1];
  NSUInteger v21 = [(NSString *)self->_manufacturer hash];
  NSUInteger v20 = [(NSString *)self->_model hash];
  $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    uint64_t v19 = PBHashBytes();
    $FE2B1A96AD49C8B211CE021377EF8B62 flags = self->_flags;
  }
  else
  {
    uint64_t v19 = 0;
  }
  if ((*(unsigned char *)&flags & 8) == 0)
  {
    uint64_t v18 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v18 = 2654435761 * self->_deviceConnection;
  if ((*(unsigned char *)&flags & 0x20) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v4 = 2654435761 * self->_destinationSharingEnabled;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_7:
    uint64_t v5 = 2654435761 * self->_navAidedDrivingStatus;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v5 = 0;
LABEL_11:
  uint64_t v6 = PBRepeatedInt32Hash();
  NSUInteger v7 = [(NSString *)self->_carName hash];
  unint64_t v8 = [(GEOScreenDimension *)self->_screenDimension hash];
  $FE2B1A96AD49C8B211CE021377EF8B62 v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_colorRange;
    if ((*(unsigned char *)&v9 & 2) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&v9 & 2) != 0)
    {
LABEL_13:
      uint64_t v11 = 2654435761 * self->_brightness;
      goto LABEL_16;
    }
  }
  uint64_t v11 = 0;
LABEL_16:
  uint64_t v12 = PBRepeatedInt32Hash();
  $FE2B1A96AD49C8B211CE021377EF8B62 v13 = self->_flags;
  if ((*(unsigned char *)&v13 & 0x80) == 0)
  {
    uint64_t v14 = 0;
    if ((*(unsigned char *)&v13 & 0x40) != 0) {
      goto LABEL_18;
    }
LABEL_21:
    uint64_t v15 = 0;
    if ((*(_WORD *)&v13 & 0x100) != 0) {
      goto LABEL_19;
    }
LABEL_22:
    uint64_t v16 = 0;
    return v20 ^ v21 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
  }
  uint64_t v14 = 2654435761 * self->_isInstrumentClusterEnabled;
  if ((*(unsigned char *)&v13 & 0x40) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v15 = 2654435761 * self->_isInstructionCardEnabled;
  if ((*(_WORD *)&v13 & 0x100) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v16 = 2654435761 * self->_isMapviewEnabled;
  return v20 ^ v21 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = (BOOL *)a3;
  [v18 readAll:0];
  uint64_t v4 = v18;
  if (*((void *)v18 + 13))
  {
    -[GEOCarInfo setManufacturer:](self, "setManufacturer:");
    uint64_t v4 = v18;
  }
  if (*((void *)v4 + 14))
  {
    -[GEOCarInfo setModel:](self, "setModel:");
    uint64_t v4 = v18;
  }
  int v5 = *((_DWORD *)v4 + 40);
  if (v5)
  {
    uint64_t v12 = *((void *)v4 + 11);
    *(_OWORD *)&self->_screenResolution._height = *(_OWORD *)(v4 + 72);
    *(void *)&self->_screenResolution._has = v12;
    *(_DWORD *)&self->_flags |= 1u;
    int v5 = *((_DWORD *)v4 + 40);
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_deviceConnection = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_flags |= 8u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_20:
  self->_destinationSharingEnabled = v4[156];
  *(_DWORD *)&self->_flags |= 0x20u;
  if ((*((_DWORD *)v4 + 40) & 0x10) != 0)
  {
LABEL_9:
    self->_navAidedDrivingStatus = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
LABEL_10:
  uint64_t v6 = [v4 engineTypesCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[GEOCarInfo addEngineType:](self, "addEngineType:", [v18 engineTypeAtIndex:i]);
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 v9 = v18;
  if (*((void *)v18 + 12))
  {
    -[GEOCarInfo setCarName:](self, "setCarName:");
    $FE2B1A96AD49C8B211CE021377EF8B62 v9 = v18;
  }
  screenDimension = self->_screenDimension;
  uint64_t v11 = *((void *)v9 + 15);
  if (screenDimension)
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[GEOScreenDimension mergeFrom:](screenDimension, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[GEOCarInfo setScreenDimension:](self, "setScreenDimension:");
  }
  $FE2B1A96AD49C8B211CE021377EF8B62 v9 = v18;
LABEL_25:
  int v13 = *((_DWORD *)v9 + 40);
  if ((v13 & 4) != 0)
  {
    self->_colorRange = *((_DWORD *)v9 + 36);
    *(_DWORD *)&self->_flags |= 4u;
    int v13 = *((_DWORD *)v9 + 40);
  }
  if ((v13 & 2) != 0)
  {
    self->_brightness = *((_DWORD *)v9 + 35);
    *(_DWORD *)&self->_flags |= 2u;
  }
  uint64_t v14 = [v9 inputMethodsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t j = 0; j != v15; ++j)
      -[GEOCarInfo addInputMethod:](self, "addInputMethod:", [v18 inputMethodAtIndex:j]);
  }
  int v17 = *((_DWORD *)v18 + 40);
  if ((v17 & 0x80) != 0)
  {
    self->_isInstrumentClusterEnabled = v18[158];
    *(_DWORD *)&self->_flags |= 0x80u;
    int v17 = *((_DWORD *)v18 + 40);
    if ((v17 & 0x40) == 0)
    {
LABEL_34:
      if ((v17 & 0x100) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_34;
  }
  self->_isInstructionCardEnabled = v18[157];
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((*((_DWORD *)v18 + 40) & 0x100) != 0)
  {
LABEL_35:
    self->_isMapviewEnabled = v18[159];
    *(_DWORD *)&self->_flags |= 0x100u;
  }
LABEL_36:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      int v5 = reader;
      objc_sync_enter(v5);
      GEOCarInfoReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_263);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10200u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOCarInfo *)self readAll:0];
    screenDimension = self->_screenDimension;
    [(GEOScreenDimension *)screenDimension clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenDimension, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_carName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOCarInfo)initWithTraits:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOCarInfo;
  int v5 = [(GEOCarInfo *)&v16 init];
  if (v5)
  {
    if ([v4 hasCarHeadunitConnectionType])
    {
      int v6 = [v4 carHeadunitConnectionType];
      if (v6 == 1) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2 * (v6 == 2);
      }
      [(GEOCarInfo *)v5 setDeviceConnection:v7];
    }
    if ([v4 hasCarHeadunitPixelHeight]
      && [v4 hasCarHeadunitPixelWidth])
    {
      [v4 carHeadunitPixelHeight];
      uint64_t v9 = v8;
      [v4 carHeadunitPixelWidth];
      v13[0] = v9;
      v13[1] = v10;
      char v14 = 3;
      memset(v15, 0, sizeof(v15));
      [(GEOCarInfo *)v5 setScreenResolution:v13];
    }
    uint64_t v11 = v5;
  }

  return v5;
}

+ (GEOCarInfo)carInfoWithTraits:(id)a3
{
  id v3 = a3;
  if (([v3 hasCarHeadunitInteractionModel] & 1) != 0
    || ([v3 hasCarHeadunitPixelHeight] & 1) != 0
    || ([v3 hasCarHeadunitPixelWidth] & 1) != 0
    || [v3 hasCarHeadunitConnectionType])
  {
    id v4 = [[GEOCarInfo alloc] initWithTraits:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end