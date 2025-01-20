@interface NSError(CoreBluetooth)
+ (id)errorWithInfo:()CoreBluetooth;
@end

@implementation NSError(CoreBluetooth)

+ (id)errorWithInfo:()CoreBluetooth
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"kCBMsgArgResult"];
  v5 = @"CBErrorDomain";
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = [v4 integerValue];
  if (v7 > 901)
  {
    if (v7 > 1501)
    {
      if (v7 <= 1899)
      {
        switch(v7)
        {
          case 1800:
            v13 = @"CBInternalErrorDomain";

            v8 = @"Invalid PSM";
            uint64_t v10 = 21;
            v5 = v13;
            break;
          case 1801:
            v60 = @"CBInternalErrorDomain";

            v8 = @"PSM already registered";
            uint64_t v10 = 22;
            v5 = v60;
            break;
          case 1802:
            v61 = @"CBInternalErrorDomain";

            v8 = @"No resources available for L2CAP";
            uint64_t v10 = 23;
            v5 = v61;
            break;
          case 1803:
            v62 = @"CBInternalErrorDomain";

            v8 = @"L2CAP PSM already connected";
            uint64_t v10 = 24;
            v5 = v62;
            break;
          case 1804:
            v63 = @"CBInternalErrorDomain";

            v8 = @"No such L2CAP connection";
            uint64_t v10 = 25;
            v5 = v63;
            break;
          case 1805:
            v64 = @"CBInternalErrorDomain";

            v8 = @"L2CAP - failed to register socket pipe";
            uint64_t v10 = 26;
            v5 = v64;
            break;
          default:
            switch(v7)
            {
              case 1700:
                v15 = @"CBInternalErrorDomain";

                v8 = @"No remoteId/stableId";
                uint64_t v10 = 33;
                v5 = v15;
                break;
              case 1701:
                v68 = @"CBInternalErrorDomain";

                v8 = @"WHB Device not found";
                uint64_t v10 = 48;
                v5 = v68;
                break;
              case 1702:
                v69 = @"CBInternalErrorDomain";

                v8 = @"WHB Device is not enabled";
                uint64_t v10 = 49;
                v5 = v69;
                break;
              case 1703:
                v70 = @"CBInternalErrorDomain";

                v8 = @"WHB Connection is interuppted";
                uint64_t v10 = 51;
                v5 = v70;
                break;
              default:
                if (v7 == 1502)
                {
                  v18 = @"CBInternalErrorDomain";

                  v8 = @"Current client did not configure RSSI detection for this device. Client cannot change existing configuration from a different client";
                  uint64_t v10 = 20;
                  v5 = v18;
                }
                else
                {
LABEL_129:
                  if (objc_msgSend(v4, "integerValue", v8) < 1001 || objc_msgSend(v4, "integerValue") > 1255)
                  {
                    if (CBLogInitOnce != -1) {
                      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
                    }
                    v73 = (void *)CBLogComponent;
                    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
                      +[NSError(CoreBluetooth) errorWithInfo:](v73, v4);
                    }
LABEL_136:
                    uint64_t v10 = 0;
                    v8 = @"Unknown error.";
                  }
                  else
                  {
                    v72 = @"CBATTErrorDomain";

                    uint64_t v10 = [v4 integerValue] - 1000;
                    v8 = @"Unknown ATT error.";
                    v5 = v72;
                  }
                }
                break;
            }
            break;
        }
      }
      else if (v7 <= 2499)
      {
        switch(v7)
        {
          case 1900:
            v14 = @"CBInternalErrorDomain";

            v8 = @"RFCOMM invalid channel ID";
            uint64_t v10 = 27;
            v5 = v14;
            break;
          case 1901:
            v65 = @"CBInternalErrorDomain";

            v8 = @"No such RFCOMM connection";
            uint64_t v10 = 28;
            v5 = v65;
            break;
          case 1902:
            v66 = @"CBInternalErrorDomain";

            v8 = @"RFCOMM channel already connected";
            uint64_t v10 = 29;
            v5 = v66;
            break;
          case 1903:
            v67 = @"CBInternalErrorDomain";

            v8 = @"RFCOMM - failed to register socket pipe";
            uint64_t v10 = 30;
            v5 = v67;
            break;
          default:
            if (v7 == 2000)
            {
              v34 = @"CBInternalErrorDomain";

              v8 = @"Peer LEA connection stalled";
LABEL_127:
              uint64_t v10 = 15;
              v5 = v34;
            }
            else
            {
              if (v7 != 2200) {
                goto LABEL_129;
              }
              v17 = @"CBInternalErrorDomain";

              v8 = @"Failed to resolve address with provided IRK";
              uint64_t v10 = 41;
              v5 = v17;
            }
            break;
        }
      }
      else
      {
        switch(v7)
        {
          case 2500:
            v12 = @"CBInternalErrorDomain";

            v8 = @"Peer removed pairing information for the pipe";
            uint64_t v10 = 52;
            v5 = v12;
            break;
          case 2501:
            v54 = @"CBInternalErrorDomain";

            v8 = @"The Pipe connection has timed out unexpectedly";
            uint64_t v10 = 53;
            v5 = v54;
            break;
          case 2502:
            v55 = @"CBInternalErrorDomain";

            v8 = @"The specified device has disconnected the pipe";
            uint64_t v10 = 54;
            v5 = v55;
            break;
          case 2503:
            v56 = @"CBInternalErrorDomain";

            v8 = @"Pipe MIC failure";
            uint64_t v10 = 55;
            v5 = v56;
            break;
          case 2504:
            v57 = @"CBInternalErrorDomain";

            v8 = @"The Pipe connection has failed unexpectedly";
            uint64_t v10 = 56;
            v5 = v57;
            break;
          case 2505:
            v58 = @"CBInternalErrorDomain";

            v8 = @"Peer removed service using the pipe";
            uint64_t v10 = 57;
            v5 = v58;
            break;
          case 2506:
            v59 = @"CBInternalErrorDomain";

            v8 = @"Local device unregistered service using the pipe";
            uint64_t v10 = 58;
            v5 = v59;
            break;
          default:
            goto LABEL_129;
        }
      }
    }
    else
    {
      switch(v7)
      {
        case 902:
        case 905:
          v8 = @"The specified UUID is not allowed for this operation.";
          uint64_t v10 = 8;
          break;
        case 903:
        case 904:
        case 906:
        case 907:
        case 908:
        case 909:
        case 910:
        case 911:
        case 912:
        case 913:
        case 916:
        case 917:
        case 918:
        case 919:
        case 920:
        case 921:
        case 922:
        case 923:
        case 924:
        case 925:
        case 926:
        case 927:
        case 928:
        case 929:
        case 930:
        case 931:
        case 932:
        case 933:
        case 934:
        case 935:
        case 936:
        case 937:
        case 938:
        case 939:
        case 940:
        case 941:
        case 942:
        case 943:
        case 944:
        case 945:
        case 946:
        case 947:
        case 948:
        case 949:
        case 950:
        case 951:
        case 952:
        case 953:
        case 954:
        case 955:
        case 956:
        case 957:
        case 958:
        case 959:
        case 960:
        case 961:
        case 962:
        case 963:
        case 964:
        case 965:
        case 966:
        case 967:
        case 968:
        case 969:
        case 970:
        case 971:
        case 972:
        case 973:
        case 974:
        case 975:
        case 976:
        case 977:
        case 978:
        case 979:
        case 980:
        case 981:
        case 982:
        case 983:
        case 984:
        case 985:
        case 986:
        case 987:
        case 988:
        case 989:
        case 990:
        case 991:
        case 992:
        case 993:
        case 994:
        case 995:
        case 996:
        case 997:
        case 998:
        case 999:
        case 1000:
        case 1018:
          goto LABEL_129;
        case 914:
          v19 = @"CBInternalErrorDomain";

          v8 = @"LE Connection update failed - same params";
          uint64_t v10 = 45;
          v5 = v19;
          break;
        case 915:
          v20 = @"CBInternalErrorDomain";

          v8 = @"Combined connection latency for device not as requested";
          uint64_t v10 = 46;
          v5 = v20;
          break;
        case 1001:
          v21 = @"CBATTErrorDomain";

          v8 = @"The handle is invalid.";
LABEL_75:
          uint64_t v10 = 1;
          v5 = v21;
          break;
        case 1002:
          v22 = @"CBATTErrorDomain";

          v8 = @"Reading is not permitted.";
LABEL_77:
          uint64_t v10 = 2;
          v5 = v22;
          break;
        case 1003:
          v23 = @"CBATTErrorDomain";

          v8 = @"Writing is not permitted.";
LABEL_79:
          uint64_t v10 = 3;
          v5 = v23;
          break;
        case 1004:
          v24 = @"CBATTErrorDomain";

          v8 = @"The command is invalid.";
LABEL_81:
          uint64_t v10 = 4;
          v5 = v24;
          break;
        case 1005:
          v25 = @"CBATTErrorDomain";

          v8 = @"Authentication is insufficient.";
LABEL_83:
          uint64_t v10 = 5;
          v5 = v25;
          break;
        case 1006:
          v26 = @"CBATTErrorDomain";

          v8 = @"The request is not supported.";
LABEL_85:
          uint64_t v10 = 6;
          v5 = v26;
          break;
        case 1007:
          v27 = @"CBATTErrorDomain";

          v8 = @"The offset is invalid.";
LABEL_87:
          uint64_t v10 = 7;
          v5 = v27;
          break;
        case 1008:
          v28 = @"CBATTErrorDomain";

          v8 = @"Authorization is insufficient.";
LABEL_61:
          uint64_t v10 = 8;
          v5 = v28;
          break;
        case 1009:
          v29 = @"CBATTErrorDomain";

          v8 = @"The prepare queue is full.";
LABEL_63:
          uint64_t v10 = 9;
          v5 = v29;
          break;
        case 1010:
          v11 = @"CBATTErrorDomain";

          v8 = @"The attribute could not be found.";
LABEL_37:
          uint64_t v10 = 10;
          v5 = v11;
          break;
        case 1011:
          v30 = @"CBATTErrorDomain";

          v8 = @"The attribute is not long.";
LABEL_68:
          uint64_t v10 = 11;
          v5 = v30;
          break;
        case 1012:
          v31 = @"CBATTErrorDomain";

          v8 = @"The encryption key size is insufficient.";
LABEL_57:
          uint64_t v10 = 12;
          v5 = v31;
          break;
        case 1013:
          v32 = @"CBATTErrorDomain";

          v8 = @"The value's length is invalid.";
          goto LABEL_46;
        case 1014:
          v33 = @"CBATTErrorDomain";

          v8 = @"Unlikely error.";
LABEL_100:
          uint64_t v10 = 14;
          v5 = v33;
          break;
        case 1015:
          v34 = @"CBATTErrorDomain";

          v8 = @"Encryption is insufficient.";
          goto LABEL_127;
        case 1016:
          v35 = @"CBATTErrorDomain";

          v8 = @"The group type is unsupported.";
LABEL_72:
          uint64_t v10 = 16;
          v5 = v35;
          break;
        case 1017:
          v36 = @"CBATTErrorDomain";

          v8 = @"Resources are insufficient.";
LABEL_70:
          uint64_t v10 = 17;
          v5 = v36;
          break;
        case 1019:
          v32 = @"CBInternalErrorDomain";

          v8 = @"Peer failed to respond to ATT value indication";
LABEL_46:
          uint64_t v10 = 13;
          v5 = v32;
          break;
        default:
          if (v7 == 1500)
          {
            v71 = @"CBInternalErrorDomain";

            v8 = @"RSSI Detection already configured for this device";
            uint64_t v10 = 18;
            v5 = v71;
          }
          else
          {
            if (v7 != 1501) {
              goto LABEL_129;
            }
            v16 = @"CBInternalErrorDomain";

            v8 = @"Cannot remove RSSI detection configuration. Not configured for this device.";
            uint64_t v10 = 19;
            v5 = v16;
          }
          break;
      }
    }
LABEL_137:
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:v5 code:v10 userInfo:v6];
  }
  else
  {
    v9 = 0;
    v8 = @"One or more parameters were invalid.";
    uint64_t v10 = 1;
    switch(v7)
    {
      case 0:
        break;
      case 1:
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        }
        v37 = CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
          +[NSError(CoreBluetooth) errorWithInfo:](v37);
        }
        goto LABEL_136;
      case 3:
        goto LABEL_137;
      case 4:
        v8 = @"There is not enough space to complete the operation.";
        uint64_t v10 = 4;
        goto LABEL_137;
      case 6:
        v8 = @"The operation was cancelled.";
        uint64_t v10 = 5;
        goto LABEL_137;
      case 7:
        v8 = @"The specified handle was not valid.";
        uint64_t v10 = 2;
        goto LABEL_137;
      case 8:
        v8 = @"Device is invalid.";
        uint64_t v10 = 12;
        goto LABEL_137;
      case 11:
        v8 = @"Operation is not supported.";
        uint64_t v10 = 13;
        goto LABEL_137;
      case 12:
        v31 = @"CBInternalErrorDomain";

        v8 = @"Invalid state";
        goto LABEL_57;
      case 17:
      case 162:
        v11 = @"CBInternalErrorDomain";

        v8 = @"Operation is not allowed";
        goto LABEL_37;
      case 20:
        v38 = @"CBInternalErrorDomain";

        v8 = @"Client Initiated operation";
        uint64_t v10 = 35;
        v5 = v38;
        goto LABEL_137;
      case 21:
        v39 = @"CBInternalErrorDomain";

        v8 = @"Invalid IRK";
        uint64_t v10 = 40;
        v5 = v39;
        goto LABEL_137;
      case 116:
        v28 = @"CBInternalErrorDomain";

        v8 = @"Local address is being refreshed.";
        goto LABEL_61;
      case 117:
        v29 = @"CBInternalErrorDomain";

        v8 = @"Peer device LE GATT Disabled.";
        goto LABEL_63;
      case 122:
        v8 = @"Advertising has already started.";
        uint64_t v10 = 9;
        goto LABEL_137;
      case 123:
        uint64_t v10 = 0;
        v8 = @"Advertising is not started.";
        goto LABEL_137;
      case 156:
        v30 = @"CBInternalErrorDomain";

        v8 = @"Pairing failed as the Pincode was incorrect.";
        goto LABEL_68;
      case 158:
        v30 = @"CBInternalErrorDomain";

        v8 = @"Pairing failed as the Pincode or Link Key was incorrect.";
        goto LABEL_68;
      case 161:
        v36 = @"CBInternalErrorDomain";

        v8 = @"Pairing was cancelled.";
        goto LABEL_70;
      case 166:
        v35 = @"CBInternalErrorDomain";

        v8 = @"Pairing Failed due to too many attempts";
        goto LABEL_72;
      case 167:
        v40 = @"CBInternalErrorDomain";

        uint64_t v10 = 0;
        v8 = @"Pairing failed as the passcode was incorrect.";
        v5 = v40;
        goto LABEL_137;
      case 168:
        v21 = @"CBInternalErrorDomain";

        v41 = [v3 objectForKeyedSubscript:@"kCBMsgArgDeviceOriginalUUID"];
        [v6 setObject:v41 forKeyedSubscript:@"CBOriginalPeerIdentifierErrorKey"];

        v8 = @"Pairing failed as this device is already paired.";
        goto LABEL_75;
      case 170:
        v22 = @"CBInternalErrorDomain";

        v8 = @"Pairing failed as confirm value failed.";
        goto LABEL_77;
      case 171:
        v23 = @"CBInternalErrorDomain";

        v8 = @"Pairing failed as the security timeout elapsed";
        goto LABEL_79;
      case 172:
        v24 = @"CBInternalErrorDomain";

        v8 = @"Pairing failed as there was no response from user to pairing request";
        goto LABEL_81;
      case 173:
        v25 = @"CBInternalErrorDomain";

        v8 = @"Pairing failed as DHKEY Check failed";
        goto LABEL_83;
      case 174:
        v26 = @"CBInternalErrorDomain";

        v8 = @"Pairing failed as numeric comparison failed failed";
        goto LABEL_85;
      case 176:
        v27 = @"CBInternalErrorDomain";

        v8 = @"Pairing failed as numeric comparison failed failed";
        goto LABEL_87;
      case 179:
        v8 = @"Peer removed pairing information";
        uint64_t v10 = 14;
        goto LABEL_137;
      case 180:
        v8 = @"Too many LE devices are paired to this device";
        uint64_t v10 = 16;
        goto LABEL_137;
      case 182:
        v42 = @"CBInternalErrorDomain";

        v8 = @"MIC failure";
        uint64_t v10 = 31;
        v5 = v42;
        goto LABEL_137;
      case 202:
        v43 = @"CBInternalErrorDomain";

        v8 = @"Local device is powered off.";
        uint64_t v10 = 32;
        v5 = v43;
        goto LABEL_137;
      case 305:
        v8 = @"The connection has failed unexpectedly.";
        uint64_t v10 = 10;
        goto LABEL_137;
      case 307:
        v8 = @"The connection has timed out unexpectedly.";
        uint64_t v10 = 6;
        goto LABEL_137;
      case 309:
        v8 = @"The system has reached the maximum number of connections";
        uint64_t v10 = 11;
        goto LABEL_137;
      case 312:
        v8 = @"The specified device is not connected.";
        uint64_t v10 = 3;
        goto LABEL_137;
      case 313:
        v8 = @"The specified device has disconnected from us.";
        uint64_t v10 = 7;
        goto LABEL_137;
      case 315:
        v8 = @"Failed to encrypt the connection, the connection has timed out unexpectedly.";
        uint64_t v10 = 15;
        goto LABEL_137;
      case 329:
        v8 = @"Page timeout";
        uint64_t v10 = 10;
        goto LABEL_137;
      case 336:
        v33 = @"CBInternalErrorDomain";

        v44 = [v3 objectForKeyedSubscript:@"kCBMsgArgNumberOfConnectedDevicesForUseCase"];
        [v6 setObject:v44 forKeyedSubscript:@"CBNumberOfConnectionsForUseCase"];

        v45 = [v3 objectForKeyedSubscript:@"kCBMsgArgUseCase"];
        [v6 setObject:v45 forKeyedSubscript:@"CBConnectionUseCase"];

        v8 = @"The system has reached the maximum number of connections for this use case";
        goto LABEL_100;
      case 341:
        v46 = @"CBInternalErrorDomain";

        v8 = @"Unknown or not an allowed internal client to use BLE";
        uint64_t v10 = 34;
        v5 = v46;
        goto LABEL_137;
      case 342:
        v47 = @"CBInternalErrorDomain";

        v8 = @"LE Scan timed out or total time achieved";
        uint64_t v10 = 36;
        v5 = v47;
        goto LABEL_137;
      case 343:
        v48 = @"CBInternalErrorDomain";

        v8 = @"LE Connection disallowed due to Deny or Allow List";
        uint64_t v10 = 39;
        v5 = v48;
        goto LABEL_137;
      case 344:
        v49 = @"CBInternalErrorDomain";

        v8 = @"LE Connection Scan timed out or total time achieved";
        uint64_t v10 = 42;
        v5 = v49;
        goto LABEL_137;
      case 345:
        v50 = @"CBInternalErrorDomain";

        v8 = @"The system has reached the maximum number of connections for this client";
        uint64_t v10 = 47;
        v5 = v50;
        goto LABEL_137;
      case 346:
        v51 = @"CBInternalErrorDomain";

        v8 = @"LE Connection Requested without Client BundleID when it is required";
        uint64_t v10 = 43;
        v5 = v51;
        goto LABEL_137;
      case 347:
        v52 = @"CBInternalErrorDomain";

        v8 = @"Reached maximum allowed for the number of both direct and indirect connections for a client bundleID";
        uint64_t v10 = 44;
        v5 = v52;
        goto LABEL_137;
      case 348:
        v53 = @"CBInternalErrorDomain";

        v8 = @"Use case is not provided when it is required";
        uint64_t v10 = 50;
        v5 = v53;
        goto LABEL_137;
      default:
        goto LABEL_129;
    }
  }

  return v9;
}

+ (void)errorWithInfo:()CoreBluetooth .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  int v4 = 134217984;
  uint64_t v5 = [a2 integerValue];
  _os_log_error_impl(&dword_1AB9F0000, v3, OS_LOG_TYPE_ERROR, "WARNING: Unknown error: %ld", (uint8_t *)&v4, 0xCu);
}

+ (void)errorWithInfo:()CoreBluetooth .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_DEBUG, "Received lame BT_ERROR", v1, 2u);
}

@end