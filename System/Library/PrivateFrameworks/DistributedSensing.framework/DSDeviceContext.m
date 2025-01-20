@interface DSDeviceContext
- (BOOL)isMe;
- (CBDevice)bleDevice;
- (DSDeviceContext)initWithCBDevice:(id)a3 error:(id *)a4;
- (DSDeviceContext)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSString)identifier;
- (unint64_t)changedFlag;
- (unint64_t)discoveryFlag;
- (unint64_t)dsActionIsAlreadyFound;
- (unint64_t)dsInfoIsAlreadyFound;
- (unsigned)coordinationStatus;
- (unsigned)tiebreaker;
- (unsigned)vehicleConfidence;
- (unsigned)vehicleState;
- (void)encodeSelf:(id)a3;
- (void)setBleDevice:(id)a3;
- (void)setChangedFlag:(unint64_t)a3;
- (void)setCoordinationStatus:(unsigned __int8)a3;
- (void)setDiscoveryFlag:(unint64_t)a3;
- (void)setDsActionIsAlreadyFound:(unint64_t)a3;
- (void)setDsInfoIsAlreadyFound:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setTiebreaker:(unsigned __int8)a3;
- (void)setVehicleConfidence:(unsigned __int8)a3;
- (void)setVehicleState:(unsigned __int8)a3;
- (void)updateWithCBDevice:(id)a3;
@end

@implementation DSDeviceContext

- (DSDeviceContext)initWithXPCObject:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DSDeviceContext;
  v7 = [(DSDeviceContext *)&v37 init];
  if (!v7)
  {
    v35 = DSLogObjectForCategory_DSDeviceContext();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v36 = "Allocation failed";
    goto LABEL_54;
  }
  if (MEMORY[0x223CBE6A0](v6) != MEMORY[0x263EF8708])
  {
    v35 = DSLogObjectForCategory_DSDeviceContext();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v36 = "init with invalid dictionary";
    goto LABEL_54;
  }
  BOOL v8 = xpc_dictionary_get_BOOL(v6, "kDSDevCtxIsMe");
  if (onceTokenDSDeviceContext != -1) {
    dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
  }
  v9 = logObjDSDeviceContext;
  if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "NO";
    if (v8) {
      v10 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v39 = (uint64_t)v10;
    _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_DEFAULT, "Is self device: %s", buf, 0xCu);
  }
  v7->_isMe = v8;
  string = xpc_dictionary_get_string(v6, "kDSDevCtxDevID");
  if (string)
  {
    uint64_t v12 = [[NSString alloc] initWithUTF8String:string];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v12;

    if (onceTokenDSDeviceContext != -1) {
      dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
    }
    v14 = (void *)logObjDSDeviceContext;
    if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v7->_identifier;
      v16 = v14;
      uint64_t v17 = [(NSString *)v15 UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v39 = v17;
      _os_log_impl(&dword_223BD6000, v16, OS_LOG_TYPE_DEFAULT, "Identifier : %s", buf, 0xCu);
    }
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "kDSCoordStatus");
  if (uint64 >= 0x100)
  {
    v35 = DSLogObjectForCategory_DSDeviceContext();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v36 = "Error decoding coordination status";
    goto LABEL_54;
  }
  unsigned __int8 v19 = uint64;
  if (onceTokenDSDeviceContext != -1) {
    dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
  }
  v20 = logObjDSDeviceContext;
  if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
  {
    if (v19 > 5u) {
      v21 = "?";
    }
    else {
      v21 = off_2646D5160[(char)v19];
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v39 = (uint64_t)v21;
    _os_log_impl(&dword_223BD6000, v20, OS_LOG_TYPE_DEFAULT, "Coordination status %s", buf, 0xCu);
  }
  v7->_coordinationStatus = v19;
  uint64_t v22 = xpc_dictionary_get_uint64(v6, "kDSVehicleState");
  if (v22 >= 0x100)
  {
    v35 = DSLogObjectForCategory_DSDeviceContext();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v36 = "Error decoding vehicle state";
    goto LABEL_54;
  }
  unsigned __int8 v23 = v22;
  if (onceTokenDSDeviceContext != -1) {
    dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
  }
  v24 = logObjDSDeviceContext;
  if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
  {
    if (v23 > 2u) {
      v25 = "?";
    }
    else {
      v25 = off_2646D5148[(char)v23];
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v39 = (uint64_t)v25;
    _os_log_impl(&dword_223BD6000, v24, OS_LOG_TYPE_DEFAULT, "Vehicle state %s", buf, 0xCu);
  }
  v7->_vehicleState = v23;
  uint64_t v26 = xpc_dictionary_get_uint64(v6, "kDSVehicleConfidence");
  if (v26 >= 0x100)
  {
    v35 = DSLogObjectForCategory_DSDeviceContext();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v36 = "Error decoding coordination status";
    goto LABEL_54;
  }
  uint64_t v27 = v26;
  if (onceTokenDSDeviceContext != -1) {
    dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
  }
  v28 = logObjDSDeviceContext;
  if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v39 = v27;
    _os_log_impl(&dword_223BD6000, v28, OS_LOG_TYPE_DEFAULT, "Vehicle confidence: %llu", buf, 0xCu);
  }
  v7->_vehicleConfidence = v27;
  uint64_t v29 = xpc_dictionary_get_uint64(v6, "kDSTiebreaker");
  if (v29 >= 0x100)
  {
    v35 = DSLogObjectForCategory_DSDeviceContext();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_WORD *)buf = 0;
    v36 = "Error decoding coordination status";
LABEL_54:
    _os_log_impl(&dword_223BD6000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
LABEL_55:

    id v33 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:1 userInfo:0];
    if (a4)
    {
      id v33 = v33;
      v32 = 0;
      *a4 = v33;
    }
    else
    {
      v32 = 0;
    }
    goto LABEL_41;
  }
  uint64_t v30 = v29;
  if (onceTokenDSDeviceContext != -1) {
    dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
  }
  v31 = logObjDSDeviceContext;
  if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v39 = v30;
    _os_log_impl(&dword_223BD6000, v31, OS_LOG_TYPE_DEFAULT, "Tie breaker: %llu", buf, 0xCu);
  }
  v7->_tiebreaker = v30;
  v32 = v7;
  id v33 = 0;
LABEL_41:

  return v32;
}

- (void)encodeSelf:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = v4;
  if (self->_isMe) {
    xpc_dictionary_set_BOOL(v4, "kDSDevCtxIsMe", 1);
  }
  identifier = self->_identifier;
  if (identifier) {
    xpc_dictionary_set_string(xdict, "kDSDevCtxDevID", [(NSString *)identifier UTF8String]);
  }
  if (self->_vehicleState) {
    xpc_dictionary_set_uint64(xdict, "kDSVehicleState", self->_vehicleState);
  }
  id v6 = xdict;
  if (self->_vehicleConfidence)
  {
    xpc_dictionary_set_uint64(xdict, "kDSVehicleConfidence", self->_vehicleConfidence);
    id v6 = xdict;
  }
  if (self->_coordinationStatus)
  {
    xpc_dictionary_set_uint64(xdict, "kDSCoordStatus", self->_coordinationStatus);
    id v6 = xdict;
  }
  if (self->_tiebreaker)
  {
    xpc_dictionary_set_uint64(xdict, "kDSTiebreaker", self->_tiebreaker);
    id v6 = xdict;
  }
}

- (DSDeviceContext)initWithCBDevice:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DSDeviceContext;
  BOOL v8 = [(DSDeviceContext *)&v23 init];
  v9 = v8;
  if (v8)
  {
    v8->_isMe = 0;
    uint64_t v10 = [v7 identifier];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    int v12 = [v7 dsInfoVehicleState];
    if (v12 == 2) {
      char v13 = 2;
    }
    else {
      char v13 = v12 == 1;
    }
    v9->_vehicleState = v13;
    int v14 = [v7 dsInfoVehicleConfidence];
    unsigned __int8 v15 = 0;
    if (v14 > 10)
    {
      if (v14 != 11 && v14 != 15) {
        goto LABEL_12;
      }
    }
    else if (v14 != 4 && v14 != 7)
    {
      goto LABEL_12;
    }
    unsigned __int8 v15 = v14;
LABEL_12:
    v9->_vehicleConfidence = v15;
    int v16 = [v7 dsActionFlags];
    char v17 = 0;
    switch(v16)
    {
      case 1:
        char v17 = 1;
        break;
      case 2:
        char v17 = 3;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      case 4:
        char v17 = 2;
        break;
      case 8:
        char v17 = 4;
        break;
      default:
        if (v16 == 16) {
          char v17 = 5;
        }
        break;
    }
    v9->_coordinationStatus = v17;
    v9->_tiebreaker = [v7 dsActionTieBreaker];
    if (([v7 discoveryFlags] & 0x800000000000000) != 0)
    {
      v9->_discoveryFlag |= 2uLL;
      v9->_dsInfoIsAlreadyFound = 1;
    }
    if (([v7 discoveryFlags] & 0x1000000000000000) != 0)
    {
      v9->_discoveryFlag |= 4uLL;
      v9->_dsActionIsAlreadyFound = 1;
    }
    objc_storeStrong((id *)&v9->_bleDevice, a3);
    v18 = v9;
    id v19 = 0;
    goto LABEL_24;
  }
  v21 = DSLogObjectForCategory_DSDeviceContext();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_223BD6000, v21, OS_LOG_TYPE_ERROR, "Allocation failed", v22, 2u);
  }

  id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:1 userInfo:0];
  if (a4)
  {
    id v19 = v19;
    *a4 = v19;
  }
LABEL_24:

  return v9;
}

- (void)updateWithCBDevice:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v5 = (CBDevice *)a3;
  id v6 = v5;
  self->_changedFlag = 0;
  p_changedFlag = &self->_changedFlag;
  if (!v5 || self->_bleDevice == v5) {
    goto LABEL_84;
  }
  if (([(CBDevice *)v5 discoveryFlags] & 0x800000000000000) != 0)
  {
    int v9 = [(CBDevice *)v6 dsInfoVehicleState];
    if (v9 == 2) {
      int v10 = 2;
    }
    else {
      int v10 = v9 == 1;
    }
    if (self->_vehicleState == v10)
    {
      uint64_t v8 = 0;
    }
    else
    {
      if (onceTokenDSDeviceContext != -1) {
        dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
      }
      v11 = (void *)logObjDSDeviceContext;
      if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = v11;
        id v13 = [(CBDevice *)v6 identifier];
        uint64_t v14 = [v13 UTF8String];
        unint64_t vehicleState = (char)self->_vehicleState;
        if (vehicleState > 2) {
          int v16 = "?";
        }
        else {
          int v16 = off_2646D5148[vehicleState];
        }
        char v17 = off_2646D5148[v10];
        int v45 = 136315650;
        uint64_t v46 = v14;
        __int16 v47 = 2080;
        *(void *)v48 = v16;
        *(_WORD *)&v48[8] = 2080;
        v49 = v17;
        _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "Device ID %s : Vehicle State updated from %s to %s", (uint8_t *)&v45, 0x20u);
      }
      self->_unint64_t vehicleState = v10;
      uint64_t v8 = 2;
    }
    int v18 = [(CBDevice *)v6 dsInfoVehicleConfidence];
    int v19 = 0;
    if (v18 > 10)
    {
      if (v18 != 11 && v18 != 15)
      {
LABEL_25:
        if (self->_vehicleConfidence == v19)
        {
LABEL_52:
          if (self->_dsInfoIsAlreadyFound)
          {
            self->_discoveryFlag &= ~2uLL;
            p_discoveryFlag = &self->_changedFlag;
            uint64_t v28 = v8;
          }
          else
          {
            self->_dsInfoIsAlreadyFound = 1;
            p_discoveryFlag = &self->_discoveryFlag;
            uint64_t v28 = 2;
          }
          *p_discoveryFlag |= v28;
          goto LABEL_56;
        }
        if (onceTokenDSDeviceContext != -1) {
          dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
        }
        v20 = (void *)logObjDSDeviceContext;
        if (!os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
        {
LABEL_51:
          self->_unsigned int vehicleConfidence = v19;
          uint64_t v8 = 2;
          goto LABEL_52;
        }
        v21 = v20;
        id v22 = [(CBDevice *)v6 identifier];
        uint64_t v23 = [v22 UTF8String];
        unsigned int vehicleConfidence = self->_vehicleConfidence;
        if (vehicleConfidence <= 6)
        {
          if (!self->_vehicleConfidence)
          {
            v25 = "lowest";
            goto LABEL_41;
          }
          if (vehicleConfidence == 4)
          {
            v25 = "low-medium";
            goto LABEL_41;
          }
        }
        else
        {
          switch(vehicleConfidence)
          {
            case 7u:
              v25 = "medium";
              goto LABEL_41;
            case 0xBu:
              v25 = "medium-high";
              goto LABEL_41;
            case 0xFu:
              v25 = "highest";
LABEL_41:
              if (v19 <= 6)
              {
                if (v19) {
                  uint64_t v26 = "low-medium";
                }
                else {
                  uint64_t v26 = "lowest";
                }
              }
              else if (v19 == 7)
              {
                uint64_t v26 = "medium";
              }
              else if (v19 == 11)
              {
                uint64_t v26 = "medium-high";
              }
              else
              {
                uint64_t v26 = "highest";
              }
              int v45 = 136315650;
              uint64_t v46 = v23;
              __int16 v47 = 2080;
              *(void *)v48 = v25;
              *(_WORD *)&v48[8] = 2080;
              v49 = (void *)v26;
              _os_log_impl(&dword_223BD6000, v21, OS_LOG_TYPE_DEFAULT, "Device ID %s : Vehicle Confidence updated from %s to %s", (uint8_t *)&v45, 0x20u);

              goto LABEL_51;
          }
        }
        v25 = "?";
        goto LABEL_41;
      }
    }
    else if (v18 != 4 && v18 != 7)
    {
      goto LABEL_25;
    }
    int v19 = v18;
    goto LABEL_25;
  }
  uint64_t v8 = 0;
LABEL_56:
  if (([(CBDevice *)v6 discoveryFlags] & 0x1000000000000000) != 0)
  {
    int v29 = [(CBDevice *)v6 dsActionFlags];
    int v30 = 0;
    switch(v29)
    {
      case 1:
        int v30 = 1;
        break;
      case 2:
        int v30 = 3;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      case 4:
        int v30 = 2;
        break;
      case 8:
        int v30 = 4;
        break;
      default:
        if (v29 == 16) {
          int v30 = 5;
        }
        break;
    }
    if (v30 != self->_coordinationStatus)
    {
      if (onceTokenDSDeviceContext != -1) {
        dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
      }
      v31 = (void *)logObjDSDeviceContext;
      if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
      {
        v32 = v31;
        id v33 = [(CBDevice *)v6 identifier];
        uint64_t v34 = [v33 UTF8String];
        unint64_t coordinationStatus = (char)self->_coordinationStatus;
        if (coordinationStatus > 5) {
          v36 = "?";
        }
        else {
          v36 = off_2646D5160[coordinationStatus];
        }
        objc_super v37 = off_2646D5160[v30];
        int v45 = 136315650;
        uint64_t v46 = v34;
        __int16 v47 = 2080;
        *(void *)v48 = v36;
        *(_WORD *)&v48[8] = 2080;
        v49 = v37;
        _os_log_impl(&dword_223BD6000, v32, OS_LOG_TYPE_DEFAULT, "Device ID %s : Kappa Coordination Status updated from %s to %s", (uint8_t *)&v45, 0x20u);
      }
      self->_unint64_t coordinationStatus = v30;
      uint64_t v8 = 4;
    }
    int v38 = [(CBDevice *)v6 dsActionTieBreaker];
    if (v38 != self->_tiebreaker)
    {
      int v39 = v38;
      if (onceTokenDSDeviceContext != -1) {
        dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
      }
      uint64_t v40 = (void *)logObjDSDeviceContext;
      if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v40;
        id v42 = [(CBDevice *)v6 identifier];
        uint64_t v43 = [v42 UTF8String];
        int tiebreaker = self->_tiebreaker;
        int v45 = 136315650;
        uint64_t v46 = v43;
        __int16 v47 = 1024;
        *(_DWORD *)v48 = tiebreaker;
        *(_WORD *)&v48[4] = 1024;
        *(_DWORD *)&v48[6] = v39;
        _os_log_impl(&dword_223BD6000, v41, OS_LOG_TYPE_DEFAULT, "Device ID %s : Kappa tie breaker updated from %d to %d", (uint8_t *)&v45, 0x18u);
      }
      self->_int tiebreaker = v39;
      uint64_t v8 = 4;
    }
    if (self->_dsActionIsAlreadyFound)
    {
      self->_discoveryFlag &= ~4uLL;
    }
    else
    {
      self->_dsActionIsAlreadyFound = 1;
      p_changedFlag = &self->_discoveryFlag;
      uint64_t v8 = 4;
    }
    *p_changedFlag |= v8;
  }
  objc_storeStrong((id *)&self->_bleDevice, a3);
LABEL_84:
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)tiebreaker
{
  return self->_tiebreaker;
}

- (void)setTiebreaker:(unsigned __int8)a3
{
  self->_int tiebreaker = a3;
}

- (unsigned)vehicleState
{
  return self->_vehicleState;
}

- (void)setVehicleState:(unsigned __int8)a3
{
  self->_unint64_t vehicleState = a3;
}

- (unsigned)vehicleConfidence
{
  return self->_vehicleConfidence;
}

- (void)setVehicleConfidence:(unsigned __int8)a3
{
  self->_unsigned int vehicleConfidence = a3;
}

- (unsigned)coordinationStatus
{
  return self->_coordinationStatus;
}

- (void)setCoordinationStatus:(unsigned __int8)a3
{
  self->_unint64_t coordinationStatus = a3;
}

- (CBDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
}

- (unint64_t)discoveryFlag
{
  return self->_discoveryFlag;
}

- (void)setDiscoveryFlag:(unint64_t)a3
{
  self->_discoveryFlag = a3;
}

- (unint64_t)changedFlag
{
  return self->_changedFlag;
}

- (void)setChangedFlag:(unint64_t)a3
{
  self->_changedFlag = a3;
}

- (unint64_t)dsInfoIsAlreadyFound
{
  return self->_dsInfoIsAlreadyFound;
}

- (void)setDsInfoIsAlreadyFound:(unint64_t)a3
{
  self->_dsInfoIsAlreadyFound = a3;
}

- (unint64_t)dsActionIsAlreadyFound
{
  return self->_dsActionIsAlreadyFound;
}

- (void)setDsActionIsAlreadyFound:(unint64_t)a3
{
  self->_dsActionIsAlreadyFound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end