@interface CSExclaveIndicatorController
- (CSExclaveIndicatorController)init;
- (unint64_t)_getCSFSensorStatusWithExclaveSensorStatus:(unsigned int)a3;
- (unint64_t)sensorStart;
- (unint64_t)sensorStop;
- (void)copyBufferWithSize:(unsigned int)a3;
- (void)dealloc;
@end

@implementation CSExclaveIndicatorController

- (unint64_t)_getCSFSensorStatusWithExclaveSensorStatus:(unsigned int)a3
{
  uint64_t v3 = a3 - 1;
  if (v3 < 3) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  [(CSExclaveIndicatorController *)self sensorStop];
  mem = self->_mem;
  if (mem)
  {
    free(mem);
    self->_mem = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSExclaveIndicatorController;
  [(CSExclaveIndicatorController *)&v4 dealloc];
}

- (unint64_t)sensorStop
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_hasStarted)
  {
    if (!exclaves_sensor_stop()) {
      self->_hasStarted = 0;
    }
    uint64_t v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "-[CSExclaveIndicatorController sensorStop]";
      __int16 v8 = 1024;
      int v9 = 0;
      _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s After Sensor Stop Sensor Status : %d", buf, 0x12u);
    }
    return [(CSExclaveIndicatorController *)self _getCSFSensorStatusWithExclaveSensorStatus:0];
  }
  else
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSExclaveIndicatorController sensorStop]";
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Sensor stop before start", buf, 0xCu);
    }
    return 4;
  }
}

- (unint64_t)sensorStart
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_hasStarted) {
    return 5;
  }
  int v4 = exclaves_sensor_start();
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSExclaveIndicatorController sensorStart]";
    __int16 v8 = 1024;
    int v9 = 0;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s After Sensor Start Sensor Status : %d", buf, 0x12u);
  }
  if (!v4) {
    self->_hasStarted = 1;
  }
  return [(CSExclaveIndicatorController *)self _getCSFSensorStatusWithExclaveSensorStatus:0];
}

- (void)copyBufferWithSize:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = exclaves_audio_buffer_copyout();
  if (!v4) {
    return self->_mem;
  }
  int v5 = v4;
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[CSExclaveIndicatorController copyBufferWithSize:]";
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Failed EIC buffer copy : %d", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (CSExclaveIndicatorController)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CSExclaveIndicatorController;
  v2 = [(CSExclaveIndicatorController *)&v11 init];
  if (!v2) {
    goto LABEL_15;
  }
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CSExclaveIndicatorController init]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Creating EIC Sensor?", buf, 0xCu);
  }
  int v4 = exclaves_sensor_create();
  if (v4)
  {
    int v5 = v4;
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSExclaveIndicatorController init]";
      __int16 v14 = 1024;
      int v15 = v5;
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Failed EIC sensor creation : %d", buf, 0x12u);
    }
    v7 = 0;
    goto LABEL_16;
  }
  exclaves_sensor_status();
  int v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSExclaveIndicatorController init]";
    __int16 v14 = 1024;
    int v15 = 0;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s After Sensor Creation Sensor Status : %d", buf, 0x12u);
  }
  v2->_mem = malloc_type_calloc(1uLL, 0x10000uLL, 0x6FED8049uLL);
  if (!exclaves_audio_buffer_create())
  {
    v2->_hasStarted = 0;
LABEL_15:
    v7 = v2;
    goto LABEL_16;
  }
  int v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CSExclaveIndicatorController init]";
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Failed EIC audio buffer creation", buf, 0xCu);
  }
  free(v2->_mem);
  v7 = 0;
  v2->_mem = 0;
LABEL_16:

  return v7;
}

@end