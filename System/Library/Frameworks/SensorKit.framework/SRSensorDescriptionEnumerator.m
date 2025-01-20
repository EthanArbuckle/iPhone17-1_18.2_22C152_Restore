@interface SRSensorDescriptionEnumerator
- (id)nextObject;
- (void)dealloc;
@end

@implementation SRSensorDescriptionEnumerator

- (void)dealloc
{
  if (self) {
    objc_setProperty_atomic(self, a2, 0, 24);
  }

  v3.receiver = self;
  v3.super_class = (Class)SRSensorDescriptionEnumerator;
  [(SRSensorDescriptionEnumerator *)&v3 dealloc];
}

- (id)nextObject
{
  v25[1] = *MEMORY[0x263EF8340];
  unint64_t currentSensorDirectoryIndex = self->_currentSensorDirectoryIndex;
  sensorsCache = self->_sensorsCache;
  if (sensorsCache) {
    sensorsCache = objc_getProperty(sensorsCache, a2, 16, 1);
  }
  if (currentSensorDirectoryIndex >= [sensorsCache count])
  {
    v7 = SRLogSensorsCache;
    if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v24[0]) = 0;
      _os_log_fault_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_FAULT, "Unexpectedly trying to iterate beyond the maximum number of directories", (uint8_t *)v24, 2u);
    }
    return 0;
  }
  if (self->_descriptionFileEnumerator)
  {
    uint64_t v6 = *MEMORY[0x263EFF6A8];
  }
  else
  {
    Property = self->_sensorsCache;
    if (Property) {
      Property = objc_getProperty(Property, v5, 16, 1);
    }
    uint64_t v9 = [Property objectAtIndexedSubscript:self->_currentSensorDirectoryIndex];
    v10 = (void *)[MEMORY[0x263F08850] defaultManager];
    uint64_t v6 = *MEMORY[0x263EFF6A8];
    v25[0] = *MEMORY[0x263EFF6A8];
    v11 = objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v25, 1), 4, 0);
    objc_setProperty_atomic(self, v12, v11, 24);
  }
  while (1)
  {
    v13 = (void *)[(NSDirectoryEnumerator *)self->_descriptionFileEnumerator nextObject];
    v24[0] = 0;
    [v13 getResourceValue:v24 forKey:v6 error:0];
    char v15 = [v24[0] BOOLValue];
    id result = 0;
    if ((v15 & 1) == 0) {
      break;
    }
LABEL_20:
    if (result) {
      return result;
    }
  }
  if (v13) {
    goto LABEL_19;
  }
  unint64_t v17 = self->_currentSensorDirectoryIndex + 1;
  self->_unint64_t currentSensorDirectoryIndex = v17;
  v18 = self->_sensorsCache;
  if (v18) {
    v18 = objc_getProperty(v18, v14, 16, 1);
  }
  if (v17 < [v18 count])
  {
    v20 = self->_sensorsCache;
    if (v20) {
      v20 = objc_getProperty(v20, v19, 16, 1);
    }
    uint64_t v21 = [v20 objectAtIndexedSubscript:self->_currentSensorDirectoryIndex];
    v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v21, 0, 4, 0);
    objc_setProperty_atomic(self, v23, v22, 24);
    v13 = (void *)[(NSDirectoryEnumerator *)self->_descriptionFileEnumerator nextObject];
    if (v13)
    {
LABEL_19:
      id result = -[SRSensorsCache descriptionForSensor:]((uint64_t)self->_sensorsCache, objc_msgSend((id)objc_msgSend(v13, "URLByDeletingPathExtension"), "lastPathComponent"));
      goto LABEL_20;
    }
  }
  objc_setProperty_atomic(self, v19, 0, 24);
  return 0;
}

@end