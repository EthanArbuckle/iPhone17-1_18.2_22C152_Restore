BOOL CBDiscoveryTypesContainTypes(unsigned char *a1, unsigned char *a2)
{
  if ((*a2 & *a1) != 0) {
    return 1;
  }
  if ((a2[1] & a1[1]) != 0) {
    return 1;
  }
  if ((a2[2] & a1[2]) != 0) {
    return 1;
  }
  if ((a2[3] & a1[3]) != 0) {
    return 1;
  }
  return (a2[4] & a1[4]) != 0;
}

id CBDeviceTypeToNSLocalizedString(int a1)
{
  switch(a1)
  {
    case 1:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_generic_computer";
      break;
    case 2:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_generic_phone";
      break;
    case 3:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_generic_audio_video";
      break;
    case 4:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_generic_peripheral";
      break;
    case 5:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_generic_imaging";
      break;
    case 6:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_generic_toy";
      break;
    case 7:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_desktop_computer";
      break;
    case 8:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_laptop_computer";
      break;
    case 9:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_wearable_computer";
      break;
    case 10:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_server";
      break;
    case 11:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_pda";
      break;
    case 12:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_mobile_phone";
      break;
    case 13:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_cordless_phone";
      break;
    case 14:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_modem";
      break;
    case 15:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_access_point";
      break;
    case 16:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_headset";
      break;
    case 17:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_handsfree";
      break;
    case 18:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_microphone";
      break;
    case 19:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_speaker";
      break;
    case 20:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_headphones";
      break;
    case 21:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_portable_audio";
      break;
    case 22:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_car_stereo";
      break;
    case 23:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_hifi_stereo";
      break;
    case 24:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_keyboard";
      break;
    case 25:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_mouse";
      break;
    case 26:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_gamepad";
      break;
    case 27:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_remote_control";
      break;
    case 28:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_sensor";
      break;
    case 29:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_tablet";
      break;
    case 30:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_card_reader";
      break;
    case 31:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_printer";
      break;
    case 32:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_scanner";
      break;
    case 33:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_camera";
      break;
    case 34:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_video_camera";
      break;
    case 35:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_display";
      break;
    case 36:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_video_display";
      break;
    case 37:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_video_conferencing";
      break;
    case 38:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_set_top_box";
      break;
    case 39:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_vcr";
      break;
    case 40:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_gaming_console";
      break;
    case 41:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_toy_controller";
      break;
    case 42:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_watch";
      break;
    case 43:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_pager";
      break;
    case 44:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_jacket";
      break;
    case 45:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_helmet";
      break;
    case 46:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_glasses";
      break;
    case 47:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_a2dp";
      break;
    case 48:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_le_peripheral";
      break;
    case 49:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_apple_trackpad";
      break;
    case 50:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_joystick";
      break;
    case 51:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_hearing_aid";
      break;
    default:
      v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v2 = v1;
      v3 = @"bt_type_generic";
      break;
  }
  v4 = [v1 localizedStringForKey:v3 value:&stru_1F02E5F20 table:@"CBLocalizable"];

  return v4;
}

unsigned char *CBDiscoveryTypesRemoveTypes(unsigned char *result, unsigned char *a2)
{
  *result &= ~*a2;
  result[1] &= ~a2[1];
  result[2] &= ~a2[2];
  result[3] &= ~a2[3];
  result[4] &= ~a2[4];
  return result;
}

unsigned char *CBDiscoveryTypesAddChangedTypes(unsigned char *result, unsigned char *a2, unsigned char *a3)
{
  *result |= *a3 ^ *a2;
  result[1] |= a3[1] ^ a2[1];
  result[2] |= a3[2] ^ a2[2];
  result[3] |= a3[3] ^ a2[3];
  result[4] |= a3[4] ^ a2[4];
  return result;
}

void sub_1AB9F768C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AB9F7DB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CBXPCDecodeDiscoveryTypes(void *a1, const char *a2, void *a3)
{
  size_t length = 0;
  data = xpc_dictionary_get_data(a1, a2, &length);
  if (data)
  {
    if (length == 5)
    {
      size_t v5 = 5;
    }
    else
    {
      if (length >= 5) {
        size_t v5 = 5;
      }
      else {
        size_t v5 = length;
      }
      size_t length = v5;
    }
    memcpy(a3, data, v5);
  }
  return 1;
}

uint64_t __CBXpcCreateNSDictionaryWithXpcDictionary_block_invoke(void *a1, uint64_t a2, void *a3)
{
  size_t v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithUTF8String:a2];
  uint64_t v8 = a1[5];
  uint64_t v9 = 8 * *(void *)(*(void *)(a1[4] + 8) + 24);
  v10 = *(void **)(v8 + v9);
  *(void *)(v8 + v9) = v7;

  uint64_t v11 = CBXpcCreateNSObjectWithXpcObject(v6);

  uint64_t v12 = a1[6];
  uint64_t v13 = 8 * *(void *)(*(void *)(a1[4] + 8) + 24);
  v14 = *(void **)(v12 + v13);
  *(void *)(v12 + v13) = v11;

  ++*(void *)(*(void *)(a1[4] + 8) + 24);
  return 1;
}

__CFString *CBXpcCreateNSObjectWithXpcObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = MEMORY[0x1AD1120E0]();
  if (v2 == MEMORY[0x1E4F145C0])
  {
    uint64_t v12 = [NSNumber numberWithLongLong:xpc_int64_get_value(v1)];
    goto LABEL_35;
  }
  uint64_t v3 = v2;
  if (v2 == MEMORY[0x1E4F145F8])
  {
    uint64_t v12 = [NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v1)];
    goto LABEL_35;
  }
  if (v2 == MEMORY[0x1E4F14570])
  {
    BOOL value = xpc_BOOL_get_value(v1);
    v14 = (void *)MEMORY[0x1E4F1CC28];
    if (value) {
      v14 = (void *)MEMORY[0x1E4F1CC38];
    }
    uint64_t v12 = v14;
    goto LABEL_35;
  }
  if (v2 != MEMORY[0x1E4F145F0])
  {
    if (v2 == MEMORY[0x1E4F14580])
    {
      id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      bytes_ptr = xpc_data_get_bytes_ptr(v1);
      uint64_t v12 = (__CFString *)[v18 initWithBytes:bytes_ptr length:xpc_data_get_length(v1)];
    }
    else if (v2 == MEMORY[0x1E4F14600])
    {
      uint64_t v12 = (__CFString *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:xpc_uuid_get_bytes(v1)];
    }
    else if (v2 == MEMORY[0x1E4F14568])
    {
      CBXpcCreateNSArrayWithXpcArray(v1);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (v2 == MEMORY[0x1E4F14590])
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v1);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (v2 == MEMORY[0x1E4F145B0])
    {
      uint64_t v20 = xpc_fd_dup(v1);
      if ((v20 & 0x80000000) != 0)
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        }
        v21 = (void *)CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
          CBXpcCreateNSObjectWithXpcObject_cold_1(v21);
        }
      }
      uint64_t v12 = [NSNumber numberWithInt:v20];
    }
    else
    {
      if (v2 != MEMORY[0x1E4F14598])
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        }
        v4 = CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
          CBXpcCreateNSObjectWithXpcObject_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);
        }
        uint64_t v11 = 0;
        goto LABEL_36;
      }
      uint64_t v12 = [NSNumber numberWithDouble:xpc_double_get_value(v1)];
    }
LABEL_35:
    uint64_t v11 = v12;
    goto LABEL_36;
  }
  uint64_t v15 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v1)];
  v16 = (void *)v15;
  v17 = &stru_1F02E5F20;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  uint64_t v11 = v17;

LABEL_36:

  return v11;
}

id CBXpcCreateNSArrayWithXpcArray(void *a1)
{
  applier[5] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  size_t count = xpc_array_get_count(v1);
  size_t v3 = 8 * count;
  MEMORY[0x1F4188790]();
  bzero((char *)applier - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __CBXpcCreateNSArrayWithXpcArray_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0);
  xpc_array_apply(v1, applier);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:(char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0) count:count];
  if (count)
  {
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v4;
}

unsigned char *CBDiscoveryTypesAddTypes(unsigned char *result, unsigned char *a2)
{
  *result |= *a2;
  result[1] |= a2[1];
  result[2] |= a2[2];
  result[3] |= a2[3];
  result[4] |= a2[4];
  return result;
}

uint64_t CBDiscoveryFlagsToString()
{
  return CUPrintFlags64();
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void *CBDiscoveryTypesNeedsIdentify()
{
  if (qword_1EB4791F0 != -1) {
    dispatch_once(&qword_1EB4791F0, &__block_literal_global_263);
  }
  return &unk_1EB4791A6;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1AB9FF358(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF370(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF388(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF3A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF3B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF3D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF3E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF400(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF418(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF430(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF448(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF460(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF478(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF490(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF4A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF4C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF4D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF4F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF508(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF520(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF538(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF550(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF568(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF580(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF598(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF5B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF5C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF5E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF5F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF610(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF628(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF640(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF658(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF670(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF688(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF6A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF6B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF6D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF6E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF700(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF718(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF730(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF748(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF760(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF778(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF790(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF7A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF7C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF7D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF7F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF808(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF820(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF838(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF850(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF868(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF880(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF898(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF8B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF8C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF8E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF8F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF910(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF928(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF940(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF958(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF970(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF988(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF9A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF9B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF9D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FF9E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFA00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFA18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFA30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFA48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFA60(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFA78(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFA90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFAA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFAC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFAD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFAF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFB08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFB20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFB38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFB50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFB68(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFB80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFB98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFBB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFBC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFBE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFBF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFC10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFC28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFC40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFC58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFC70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFC88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFCA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFCB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFCD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFCE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFD00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFD18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFD30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFD48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFD60(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFD78(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFD90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFDA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFDC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFDD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFDF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFE08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFE20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFE38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFE50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFE68(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFE80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFE98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFEB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFEC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFEE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFEF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFF10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFF28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFF40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFF58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFF70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFF88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFFA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFFB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFFD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AB9FFFE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00000(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00018(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00030(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00048(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00060(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00078(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00090(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA000A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA000C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA000D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA000F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00108(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00120(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00138(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00150(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00168(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00180(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00198(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA001B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA001C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA001E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA001F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00210(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00228(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00240(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00258(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00270(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00288(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA002A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA002B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA002D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA002E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00300(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00318(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00330(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00348(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00360(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00378(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00390(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA003A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA003C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA003D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA003F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00408(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00420(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00438(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00450(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00468(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00480(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00498(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA004B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA004C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA004E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA004F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00510(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00528(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA00540(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void *CBDiscoveryTypesBuffer()
{
  if (qword_1EB4791C8 != -1) {
    dispatch_once(&qword_1EB4791C8, &__block_literal_global_253);
  }
  return &unk_1EB47918D;
}

id CBGenerateObfuscatedSHA256HashedString(void *a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (const char *)[a1 UTF8String];
  *(_OWORD *)md = 0u;
  long long v51 = 0u;
  *(_OWORD *)v47 = 0u;
  long long v48 = 0u;
  CC_LONG v2 = strlen(v1);
  if (!CC_SHA256(v1, v2, md)) {
    goto LABEL_4;
  }
  data[0] = bijectByteToBytePreSHA256[md[0]];
  data[1] = bijectByteToBytePreSHA256[md[1]];
  char v3 = bijectByteToBytePreSHA256[md[3]];
  data[2] = bijectByteToBytePreSHA256[md[2]];
  data[3] = v3;
  data[4] = bijectByteToBytePreSHA256[md[4]];
  char v4 = bijectByteToBytePreSHA256[md[6]];
  data[5] = bijectByteToBytePreSHA256[md[5]];
  data[6] = v4;
  data[7] = bijectByteToBytePreSHA256[md[7]];
  char v5 = bijectByteToBytePreSHA256[md[9]];
  data[8] = bijectByteToBytePreSHA256[md[8]];
  data[9] = v5;
  data[10] = bijectByteToBytePreSHA256[md[10]];
  char v6 = bijectByteToBytePreSHA256[md[12]];
  data[11] = bijectByteToBytePreSHA256[md[11]];
  data[12] = v6;
  data[13] = bijectByteToBytePreSHA256[md[13]];
  char v7 = bijectByteToBytePreSHA256[md[15]];
  data[14] = bijectByteToBytePreSHA256[md[14]];
  data[15] = v7;
  data[16] = bijectByteToBytePreSHA256[v51];
  char v8 = bijectByteToBytePreSHA256[BYTE2(v51)];
  data[17] = bijectByteToBytePreSHA256[BYTE1(v51)];
  data[18] = v8;
  data[19] = bijectByteToBytePreSHA256[BYTE3(v51)];
  char v9 = bijectByteToBytePreSHA256[BYTE5(v51)];
  data[20] = bijectByteToBytePreSHA256[BYTE4(v51)];
  data[21] = v9;
  data[22] = bijectByteToBytePreSHA256[BYTE6(v51)];
  char v10 = bijectByteToBytePreSHA256[BYTE8(v51)];
  data[23] = bijectByteToBytePreSHA256[BYTE7(v51)];
  data[24] = v10;
  data[25] = bijectByteToBytePreSHA256[BYTE9(v51)];
  char v11 = bijectByteToBytePreSHA256[BYTE11(v51)];
  data[26] = bijectByteToBytePreSHA256[BYTE10(v51)];
  data[27] = v11;
  data[28] = bijectByteToBytePreSHA256[BYTE12(v51)];
  char v12 = bijectByteToBytePreSHA256[BYTE14(v51)];
  data[29] = bijectByteToBytePreSHA256[BYTE13(v51)];
  data[30] = v12;
  data[31] = bijectByteToBytePreSHA256[HIBYTE(v51)];
  if (CC_SHA256(data, 0x20u, v47))
  {
    uint64_t v13 = BYTE1(v48);
    uint64_t v14 = v47[0];
    uint64_t v15 = v47[11];
    uint64_t v16 = v47[2];
    uint64_t v17 = BYTE5(v48);
    uint64_t v18 = BYTE4(v48);
    uint64_t v19 = v47[15];
    uint64_t v20 = BYTE6(v48);
    uint64_t v21 = BYTE9(v48);
    uint64_t v24 = v47[8];
    uint64_t v25 = BYTE3(v48);
    uint64_t v26 = v47[10];
    uint64_t v27 = BYTE13(v48);
    uint64_t v28 = BYTE12(v48);
    uint64_t v29 = BYTE7(v48);
    uint64_t v30 = BYTE14(v48);
    uint64_t v31 = v47[1];
    uint64_t v32 = v48;
    uint64_t v33 = BYTE11(v48);
    uint64_t v34 = BYTE2(v48);
    uint64_t v35 = v47[5];
    uint64_t v36 = v47[4];
    uint64_t v37 = HIBYTE(v48);
    uint64_t v38 = v47[6];
    uint64_t v39 = v47[9];
    uint64_t v40 = BYTE8(v48);
    uint64_t v41 = v47[3];
    uint64_t v42 = BYTE10(v48);
    uint64_t v43 = v47[13];
    uint64_t v45 = v47[12];
    uint64_t v44 = v47[7];
    uint64_t v46 = v47[14];
    v22 = [MEMORY[0x1E4F28E78] stringWithCapacity:64];
    objc_msgSend(v22, "appendFormat:", @"%02x", v13);
    objc_msgSend(v22, "appendFormat:", @"%02x", v14);
    objc_msgSend(v22, "appendFormat:", @"%02x", v15);
    objc_msgSend(v22, "appendFormat:", @"%02x", v16);
    objc_msgSend(v22, "appendFormat:", @"%02x", v17);
    objc_msgSend(v22, "appendFormat:", @"%02x", v18);
    objc_msgSend(v22, "appendFormat:", @"%02x", v19);
    objc_msgSend(v22, "appendFormat:", @"%02x", v20);
    objc_msgSend(v22, "appendFormat:", @"%02x", v21);
    objc_msgSend(v22, "appendFormat:", @"%02x", v24);
    objc_msgSend(v22, "appendFormat:", @"%02x", v25);
    objc_msgSend(v22, "appendFormat:", @"%02x", v26);
    objc_msgSend(v22, "appendFormat:", @"%02x", v27);
    objc_msgSend(v22, "appendFormat:", @"%02x", v28);
    objc_msgSend(v22, "appendFormat:", @"%02x", v29);
    objc_msgSend(v22, "appendFormat:", @"%02x", v30);
    objc_msgSend(v22, "appendFormat:", @"%02x", v31);
    objc_msgSend(v22, "appendFormat:", @"%02x", v32);
    objc_msgSend(v22, "appendFormat:", @"%02x", v33);
    objc_msgSend(v22, "appendFormat:", @"%02x", v34);
    objc_msgSend(v22, "appendFormat:", @"%02x", v35);
    objc_msgSend(v22, "appendFormat:", @"%02x", v36);
    objc_msgSend(v22, "appendFormat:", @"%02x", v37);
    objc_msgSend(v22, "appendFormat:", @"%02x", v38);
    objc_msgSend(v22, "appendFormat:", @"%02x", v39);
    objc_msgSend(v22, "appendFormat:", @"%02x", v40);
    objc_msgSend(v22, "appendFormat:", @"%02x", v41);
    objc_msgSend(v22, "appendFormat:", @"%02x", v42);
    objc_msgSend(v22, "appendFormat:", @"%02x", v43);
    objc_msgSend(v22, "appendFormat:", @"%02x", v45);
    objc_msgSend(v22, "appendFormat:", @"%02x", v44);
    objc_msgSend(v22, "appendFormat:", @"%02x", v46);
  }
  else
  {
LABEL_4:
    v22 = 0;
  }

  return v22;
}

uint64_t __CBXpcCreateXPCArrayWithNSArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(a1 + 32) + 8 * a3) = CBXpcCreateXPCObjectWithNSObject(a2);

  return MEMORY[0x1F41817F8]();
}

void __CBXpcCreateXPCDictionaryWithNSDictionary_block_invoke(void *a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(void *)(a1[5] + 8 * *(void *)(*(void *)(a1[4] + 8) + 24)) = [v5 UTF8String];
  uint64_t v7 = CBXpcCreateXPCObjectWithNSObject(v6);

  uint64_t v8 = a1[6];
  uint64_t v9 = 8 * *(void *)(*(void *)(a1[4] + 8) + 24);
  char v10 = *(void **)(v8 + v9);
  *(void *)(v8 + v9) = v7;

  ++*(void *)(*(void *)(a1[4] + 8) + 24);
}

id CBXpcCreateXPCObjectWithNSObject(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 isNSNumber])
  {
    if (CFNumberIsFloatType((CFNumberRef)v1))
    {
      [v1 doubleValue];
      uint64_t v3 = (uint64_t)xpc_double_create(v2);
    }
    else
    {
      uint64_t v3 = (uint64_t)xpc_int64_create([v1 longLongValue]);
    }
    goto LABEL_19;
  }
  if ([v1 isNSString])
  {
    uint64_t v3 = (uint64_t)xpc_string_create((const char *)[v1 UTF8String]);
LABEL_19:
    id v6 = (void *)v3;
LABEL_20:
    if (v6) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if ([v1 isNSData])
  {
    id v4 = v1;
    uint64_t v3 = (uint64_t)xpc_data_create((const void *)[v4 bytes], objc_msgSend(v4, "length"));
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(void *)uuid = 0;
    uint64_t v9 = 0;
    [v1 getUUIDBytes:uuid];
    uint64_t v3 = (uint64_t)xpc_uuid_create(uuid);
    goto LABEL_19;
  }
  if ([v1 isNSArray])
  {
    uint64_t v3 = CBXpcCreateXPCArrayWithNSArray(v1);
    goto LABEL_19;
  }
  if ([v1 isNSDictionary])
  {
    uint64_t v3 = CBXpcCreateXPCDictionaryWithNSDictionary(v1);
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v1 data];
    id v6 = CBXpcCreateXPCObjectWithNSObject(v5);

    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = (uint64_t)xpc_null_create();
    goto LABEL_19;
  }
LABEL_21:
  [MEMORY[0x1E4F1CA00] raise:@"Invalid Object", @"Object %@ is invalid", v1 format];
  id v6 = 0;
LABEL_22:

  return v6;
}

id CBXpcCreateXPCArrayWithNSArray(void *a1)
{
  v9[5] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  size_t v2 = [v1 count];
  uint64_t v3 = v2;
  MEMORY[0x1F4188790]();
  id v5 = (xpc_object_t *)((char *)v9 - v4);
  bzero((char *)v9 - v4, 8 * v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __CBXpcCreateXPCArrayWithNSArray_block_invoke;
  v9[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v9[4] = v5;
  [v1 enumerateObjectsUsingBlock:v9];
  xpc_object_t v6 = xpc_array_create(v5, v2);
  if (v2)
  {
    uint64_t v7 = v5 - 1;
    do

    while (v3 * 8);
  }

  return v6;
}

id CBXpcCreateXPCDictionaryWithNSDictionary(void *a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  size_t v2 = [v1 count];
  uint64_t v3 = 8 * v2;
  MEMORY[0x1F4188790]();
  uint64_t v4 = (char *)v8 - ((8 * v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, 8 * v2);
  MEMORY[0x1F4188790]();
  id v5 = v4;
  bzero(v4, 8 * v2);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __CBXpcCreateXPCDictionaryWithNSDictionary_block_invoke;
  v8[3] = &unk_1E5E33DC0;
  v8[4] = v9;
  v8[5] = v4;
  v8[6] = v4;
  [v1 enumerateKeysAndObjectsUsingBlock:v8];
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)v4, (xpc_object_t *)v4, v2);
  _Block_object_dispose(v9, 8);
  if (v2)
  {
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v6;
}

void sub_1ABA01DD4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA039F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA03A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA03A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA03A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *CBDiscoveryTypesNeedsAdvertisingAddress()
{
  if (qword_1EB4791E8 != -1) {
    dispatch_once(&qword_1EB4791E8, &__block_literal_global_261);
  }
  return &unk_1EB4791A1;
}

void *CBDiscoveryTypesNeedsObjectLocator()
{
  if (qword_1EB479200 != -1) {
    dispatch_once(&qword_1EB479200, &__block_literal_global_267);
  }
  return &unk_1EB4791B0;
}

void *CBDiscoveryTypesBLEScan()
{
  if (qword_1EB4791C0 != -1) {
    dispatch_once(&qword_1EB4791C0, &__block_literal_global_1);
  }
  return &unk_1EB479188;
}

char *CBDiscoveryTypesRemoveTypesAndReportChanges(char *result, char *a2, unsigned char *a3)
{
  char v3 = *a2;
  char v4 = *result;
  *result &= ~*a2;
  *a3 |= v4 & v3;
  char v5 = a2[1];
  char v6 = result[1];
  result[1] = v6 & ~v5;
  a3[1] |= v6 & v5;
  char v7 = a2[2];
  char v8 = result[2];
  result[2] = v8 & ~v7;
  a3[2] |= v8 & v7;
  char v9 = a2[3];
  char v10 = result[3];
  result[3] = v10 & ~v9;
  a3[3] |= v10 & v9;
  char v11 = a2[4];
  char v12 = result[4];
  result[4] = v12 & ~v11;
  a3[4] |= v12 & v11;
  return result;
}

id CBXpcCreateNSDictionaryWithXpcDictionary(void *a1)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  size_t count = xpc_dictionary_get_count(v1);
  uint64_t v3 = 8 * count;
  MEMORY[0x1F4188790]();
  char v4 = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, 8 * count);
  MEMORY[0x1F4188790]();
  bzero(v4, 8 * count);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __CBXpcCreateNSDictionaryWithXpcDictionary_block_invoke;
  applier[3] = &unk_1E5E33E08;
  applier[4] = v10;
  applier[5] = v4;
  void applier[6] = v4;
  xpc_dictionary_apply(v1, applier);
  char v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v4 forKeys:v4 count:count];
  _Block_object_dispose(v10, 8);
  if (count)
  {
    uint64_t v6 = 8 * count;
    do
    {

      v6 -= 8;
    }
    while (v6);
    char v7 = v4 - 8;
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v5;
}

void sub_1ABA05928(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t CBDiscoveryTypesAppendString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = 1;
  char v5 = &off_1E5E330E8;
  do
  {
    int v8 = *((_DWORD *)v5 - 4);
    if ((v8 - 34) >= 0xFFFFFFDF
      && ((*(unsigned __int8 *)(a3 + ((unint64_t)(v8 - 1) >> 3)) >> (-(char)v8 & 7)) & 1) != 0)
    {
      uint64_t result = NSAppendPrintF_safe();
      char v4 = 0;
    }
    char v7 = *v5;
    v5 += 3;
  }
  while (v7);
  if ((v4 & 1) == 0)
  {
    return NSAppendPrintF_safe();
  }
  return result;
}

void sub_1ABA091AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t CBLogInit()
{
  CBLogComponent = (uint64_t)os_log_create("com.apple.bluetooth", "CoreBluetooth");

  return MEMORY[0x1F41817F8]();
}

void sub_1ABA098C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA098E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA09C24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1ABA09FF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA0A1DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __CBXPCGetNextClientID_block_invoke()
{
  uint64_t result = RandomBytes();
  _MergedGlobals_0 = (unsigned __int16)word_1EB479182 << 16;
  return result;
}

void sub_1ABA0A3D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *CBDiscoveryTypesProximityService()
{
  if (qword_1EB479208 != -1) {
    dispatch_once(&qword_1EB479208, &__block_literal_global_269);
  }
  return &unk_1EB4791B5;
}

void *CBDiscoveryTypesNearbyInfoV2()
{
  if (qword_1EB4791F8 != -1) {
    dispatch_once(&qword_1EB4791F8, &__block_literal_global_265);
  }
  return &unk_1EB4791AB;
}

void *CBDiscoveryTypesNearbyActionV2()
{
  if (qword_1EB4791D8 != -1) {
    dispatch_once(&qword_1EB4791D8, &__block_literal_global_257);
  }
  return &unk_1EB479197;
}

void *CBDiscoveryTypesNearbyActionV1()
{
  if (qword_1EB4791D0 != -1) {
    dispatch_once(&qword_1EB4791D0, &__block_literal_global_255);
  }
  return &unk_1EB479192;
}

uint64_t CBXPCGetNextClientID()
{
  if (qword_1EB479210 != -1) {
    dispatch_once(&qword_1EB479210, &__block_literal_global_393);
  }
  return atomic_fetch_add((atomic_uint *volatile)&_MergedGlobals_0, 1u) + 1;
}

void sub_1ABA0B844(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1ABA1CB1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA1D4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1D4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1D8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1D8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1DCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1DCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1E0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1E0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1E49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1E4B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1E874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1E890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1ECA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1ECC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1F0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1F0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1F494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1F4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1F8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1F8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1FC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA1FC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA20050(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA20068(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA20488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA204A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA20894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA20C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

const char *CBUseCaseToString(int a1)
{
  if (a1 >= 0x20000)
  {
    if (a1 >= 327680)
    {
      if (a1 > 589824)
      {
        if (a1 <= 2147418111)
        {
          switch(a1)
          {
            case 589825:
              return "FindNearbyPencil";
            case 655360:
              return "AccessDigitalHomeKey";
            case 786432:
              return "ProxControlDeviceClose";
            default:
              return "?";
          }
        }
        else
        {
          switch(a1)
          {
            case 2147418112:
              uint64_t result = "InternalTestNoLockScan";
              break;
            case 2147418113:
              uint64_t result = "InternalTestNoScreenOffScan";
              break;
            case 2147418114:
              uint64_t result = "InternalTestScanWithNoDups";
              break;
            case 2147418115:
              uint64_t result = "InternalTestScanWithDups";
              break;
            case 2147418116:
              uint64_t result = "InternalTestScanFor20Seconds";
              break;
            case 2147418117:
              uint64_t result = "InternalTestActiveScan";
              break;
            case 2147418118:
              uint64_t result = "InternalTestUUIDScan";
              break;
            case 2147418119:
              uint64_t result = "InternalTestScanFor10ClockSeconds";
              break;
            case 2147418120:
              uint64_t result = "InternalTestScanBoost";
              break;
            default:
              return "?";
          }
        }
      }
      else if (a1 > 458752)
      {
        switch(a1)
        {
          case 524288:
            uint64_t result = "ADPD";
            break;
          case 524289:
            uint64_t result = "ADPDBuffer";
            break;
          case 524290:
            uint64_t result = "MicroLocation";
            break;
          case 524291:
            uint64_t result = "MicroLocationLeech";
            break;
          default:
            if (a1 == 458753)
            {
              uint64_t result = "PrecisionFindingFindee";
            }
            else
            {
              if (a1 != 589824) {
                return "?";
              }
              uint64_t result = "FindNearbyRemote";
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 393216:
            uint64_t result = "CaptiveNetworkJoin";
            break;
          case 393217:
            uint64_t result = "UseCaseSIMTransfer";
            break;
          case 393218:
            uint64_t result = "MacSetup";
            break;
          case 393219:
            uint64_t result = "AppleIDSignIn";
            break;
          case 393220:
            uint64_t result = "AppleIDSignInSettings";
            break;
          default:
            if (a1 == 327680)
            {
              uint64_t result = "RapportThirdParty";
            }
            else
            {
              if (a1 != 458752) {
                return "?";
              }
              uint64_t result = "PrecisionFindingFinder";
            }
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 131072:
          return "SharingDefault";
        case 131073:
          return "SharingPhoneAutoUnlock";
        case 131074:
          return "SharingSiriWatchAuth";
        case 131075:
          return "SharingMacAutoUnlock";
        case 131076:
          return "SharingEDTScreenOn";
        case 131077:
          return "SharingEDTWiFiDisabled";
        case 131078:
          return "SharingEDTWombatEligibleAsDefaultCamera";
        case 131079:
          return "SharingEDTWombatCameraPicker";
        case 131080:
          return "SharingWombatBackground";
        case 131081:
          return "SharingUniversalControl";
        case 131082:
          return "SharingPeopleProximity";
        case 131083:
          return "SharingEDTEnsembleOpenDisplayPrefs";
        case 131084:
          return "SharingEDTNearbydMotionStopped";
        case 131085:
          return "SharingDoubleBoostGenericScan";
        case 131086:
          return "SharingEDTIncomingAdvertisement ";
        case 131087:
          return "SharingEDTWombatStreamStart";
        case 131088:
          return "SharingOYAutoUnlock";
        case 131089:
          return "?";
        case 131090:
          return "SharingAirDrop";
        case 131091:
          return "SharingNearbyInvitationHost";
        case 131092:
          return "SharingNearbyInvitationParticipant";
        case 131093:
          return "SharingAirDropAskToAirDrop";
        case 131094:
          return "SharingAirDropTempIdentity";
        case 131095:
          return "SharingAirDropNeedsCLink";
        case 131096:
          return "SharingRemoteWidgetUpdate";
        case 131097:
          return "SharingCountryCodeUpdate";
        case 131098:
          return "SharingMacPhoneAutoUnlock";
        case 131099:
          return "SharingVisionProDiscovery";
        case 131100:
          return "SharingVisionProStateChange";
        case 131101:
          return "SharingContinuityScreen";
        case 131102:
          return "SharingEDTRemoteDisplay";
        default:
          if (a1 == 196608)
          {
            uint64_t result = "DigitalIDTSA";
          }
          else
          {
            if (a1 != 0x40000) {
              return "?";
            }
            uint64_t result = "DigitalCarKeyThirdParty";
          }
          break;
      }
    }
  }
  else
  {
    uint64_t result = "Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "HealthKit";
        break;
      case 2:
        uint64_t result = "HomeKit";
        break;
      case 3:
        uint64_t result = "FindMyObjectConnection";
        break;
      case 4:
        uint64_t result = "FindMyObjectConnectionTransient";
        break;
      case 5:
        uint64_t result = "MIDI";
        break;
      case 6:
        uint64_t result = "Continuity";
        break;
      case 7:
        uint64_t result = "InstantHotSpot";
        break;
      case 8:
        uint64_t result = "NearBy";
        break;
      case 9:
        uint64_t result = "Sharing";
        break;
      case 10:
        uint64_t result = "HearingSupport";
        break;
      case 11:
        uint64_t result = "Magnet";
        break;
      case 12:
        uint64_t result = "HID";
        break;
      case 13:
        uint64_t result = "LEA";
        break;
      case 14:
        uint64_t result = "External";
        break;
      case 15:
        uint64_t result = "ExternalMedical";
        break;
      case 16:
        uint64_t result = "ExternalLock";
        break;
      case 17:
        uint64_t result = "ExternalWatch";
        break;
      case 18:
        uint64_t result = "SmartRouting";
        break;
      case 19:
        uint64_t result = "DigitalID";
        break;
      case 20:
        uint64_t result = "DigitalKey";
        break;
      case 21:
        uint64_t result = "DigitalCarKey";
        break;
      case 22:
        uint64_t result = "HeySiri";
        break;
      case 23:
        uint64_t result = "ThirdPartyApp";
        break;
      case 24:
        uint64_t result = "CNJ";
        break;
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 261:
      case 262:
        return "?";
      case 256:
        uint64_t result = "DevicePresenceDetection";
        break;
      case 257:
        uint64_t result = "AudioBox";
        break;
      case 258:
        uint64_t result = "SIMTransfer";
        break;
      case 259:
        uint64_t result = "ProximityScreenOnLeechScan";
        break;
      case 260:
        uint64_t result = "MacMigrate";
        break;
      case 263:
        uint64_t result = "HIDUARTService";
        break;
      case 264:
        uint64_t result = "AccessibilitySwitchControlPairing";
        break;
      case 265:
        uint64_t result = "BaseBandFastConnect";
        break;
      case 266:
        uint64_t result = "SafetyAlerts";
        break;
      case 267:
        uint64_t result = "LECarPlay";
        break;
      case 268:
        uint64_t result = "TCCBluetooth";
        break;
      case 269:
        uint64_t result = "AOPBufferLeech";
        break;
      default:
        switch(a1)
        {
          case 65536:
            uint64_t result = "FindMyAction";
            break;
          case 65537:
            uint64_t result = "FindMyBackground";
            break;
          case 65538:
            uint64_t result = "FindMyActionHELE";
            break;
          case 65539:
            uint64_t result = "FindMyBackgroundHELE";
            break;
          case 65540:
            uint64_t result = "FindMyActionTransient";
            break;
          case 65541:
            uint64_t result = "FindMyBackgroundTransient";
            break;
          case 65542:
            uint64_t result = "FindMyActionHELETransient";
            break;
          case 65543:
            uint64_t result = "FindMyBackgroundHELETransient";
            break;
          case 65544:
            uint64_t result = "FindMyNotOptedIn";
            break;
          case 65545:
            uint64_t result = "FindMyOptedIn";
            break;
          case 65546:
            uint64_t result = "FindMySepAlertsEnabled";
            break;
          case 65547:
            uint64_t result = "FindMyTemporaryAggressiveLegacy";
            break;
          case 65548:
            uint64_t result = "FindMyTemporaryLongAggressive";
            break;
          case 65549:
            uint64_t result = "FindMyBTFindingUserInitiated";
            break;
          case 65550:
            uint64_t result = "FindMyHELE";
            break;
          case 65551:
            uint64_t result = "FindMyBeaconOnDemand";
            break;
          case 65552:
            uint64_t result = "FindMyWildTimedScan";
            break;
          case 65553:
            uint64_t result = "FindMyBackgroundLeechScan";
            break;
          case 65554:
            uint64_t result = "FindMySnifferMode";
            break;
          case 65555:
            uint64_t result = "FindMyUnpair";
            break;
          case 65556:
            uint64_t result = "FindMyUnpairHELE";
            break;
          case 65557:
            uint64_t result = "FindMyPlaySound";
            break;
          case 65558:
            uint64_t result = "FindMyPlaySoundHELE";
            break;
          case 65559:
            uint64_t result = "FindMyNotOptedInBeepOnMoveWaking";
            break;
          case 65560:
            uint64_t result = "FindMyUTTransient";
            break;
          case 65561:
            uint64_t result = "FindMyUTHELETransient";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  return result;
}

const char *CBNearbyActionTypeToString(unsigned int a1)
{
  if (a1 > 0x58) {
    return "?";
  }
  else {
    return off_1E5E31AB0[(char)a1];
  }
}

void sub_1ABA2AB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA2B350(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1ABA326F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA32A5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA33754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  (*(void (**)(uint64_t))(v26 + 16))(v26);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA33A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA33A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t CBProductIDFromNSString(void *a1)
{
  uint64_t result = [a1 UTF8String];
  if (result)
  {
    uint64_t v2 = (const char *)result;
    if (!strcmp((const char *)result, "AirPods1,1"))
    {
      return 8194;
    }
    else if (!strcmp(v2, "AirPods1,3"))
    {
      return 8207;
    }
    else if (!strcmp(v2, "AirPodsPro1,1"))
    {
      return 8206;
    }
    else if (!strcmp(v2, "AppleTV5,3"))
    {
      return 28420;
    }
    else if (!strcmp(v2, "AppleTV6,2"))
    {
      return 28936;
    }
    else if (!strcmp(v2, "AppleTV11,2"))
    {
      return 29455;
    }
    else if (!strcmp(v2, "ATVRemote1,1"))
    {
      return 614;
    }
    else if (!strcmp(v2, "ATVRemote1,2"))
    {
      return 621;
    }
    else if (!strcmp(v2, "AudioAccessory1,1"))
    {
      return 28943;
    }
    else if (!strcmp(v2, "AudioAccessory1,2"))
    {
      return 28944;
    }
    else if (!strcmp(v2, "AudioAccessory5,1"))
    {
      return 29715;
    }
    else if (!strcmp(v2, "BeatsSolo3,1"))
    {
      return 8198;
    }
    else if (!strcmp(v2, "BeatsSoloPro1,1"))
    {
      return 8204;
    }
    else if (!strcmp(v2, "BeatsStudio3,2"))
    {
      return 8201;
    }
    else if (!strcmp(v2, "BeatsStudioPro1,1"))
    {
      return 8215;
    }
    else if (!strcmp(v2, "Device1,8230"))
    {
      return 8230;
    }
    else if (!strcmp(v2, "Device1,8229"))
    {
      return 8229;
    }
    else if (!strcmp(v2, "Device1,8218"))
    {
      return 8218;
    }
    else if (!strcmp(v2, "BeatsX1,1"))
    {
      return 8197;
    }
    else if (!strcmp(v2, "PowerBeats3,1"))
    {
      return 8195;
    }
    else if (!strcmp(v2, "Powerbeats4,1"))
    {
      return 8205;
    }
    else if (!strcmp(v2, "PowerbeatsPro1,1"))
    {
      return 8203;
    }
    else if (!strcmp(v2, "BeatsStudioBuds1,1"))
    {
      return 8209;
    }
    else if (!strcmp(v2, "BeatsStudioBuds1,2"))
    {
      return 8214;
    }
    else if (!strcmp(v2, "ApGn"))
    {
      return 65534;
    }
    else if (!strcmp(v2, "HeGn"))
    {
      return 65533;
    }
    else
    {
      unsigned int v10 = 0;
      if (sscanf(v2, "Device1,%u", &v10) != 1 || (unsigned int v8 = v10) == 0 || (v3 = CBProductIDToString(v10), !strcmp(v3, "?")))
      {
        int v9 = 0;
        BOOL v4 = sscanf(v2, "BTHeadphones%u,%u", &v9, &v10) == 2
          || sscanf(v2, "BTHeadset%u,%u", &v9, &v10) == 2
          || sscanf(v2, "BTSpeaker%u,%u", &v9, &v10) == 2;
        unsigned int v8 = 0;
        if (v4 && v9 == 76)
        {
          unsigned int v5 = v10;
          if (v10)
          {
            uint64_t v6 = CBProductIDToString(v10);
            if (!strcmp(v6, "?")) {
              return 0;
            }
            else {
              return v5;
            }
          }
        }
      }
      return v8;
    }
  }
  return result;
}

const char *CBProductIDToString(int a1)
{
  if (a1 > 21759)
  {
    if (a1 <= 28943)
    {
      if (a1 > 28935)
      {
        if (a1 == 28936) {
          return "AppleTV6,2";
        }
        if (a1 == 28943) {
          return "AudioAccessory1,1";
        }
      }
      else
      {
        if (a1 == 21760) {
          return "Device1,21760";
        }
        if (a1 == 28420) {
          return "AppleTV5,3";
        }
      }
    }
    else if (a1 <= 29714)
    {
      if (a1 == 28944) {
        return "AudioAccessory1,2";
      }
      if (a1 == 29455) {
        return "AppleTV11,2";
      }
    }
    else
    {
      switch(a1)
      {
        case 29715:
          return "AudioAccessory5,1";
        case 65533:
          return "HeGn";
        case 65534:
          return "ApGn";
      }
    }
    return "?";
  }
  switch(a1)
  {
    case 8194:
      return "AirPods1,1";
    case 8195:
      return "PowerBeats3,1";
    case 8196:
    case 8199:
    case 8200:
    case 8225:
    case 8226:
    case 8227:
      return "?";
    case 8197:
      return "BeatsX1,1";
    case 8198:
      return "BeatsSolo3,1";
    case 8201:
      return "BeatsStudio3,2";
    case 8202:
      return "Device1,8202";
    case 8203:
      return "PowerbeatsPro1,1";
    case 8204:
      return "BeatsSoloPro1,1";
    case 8205:
      return "Powerbeats4,1";
    case 8206:
      return "AirPodsPro1,1";
    case 8207:
      return "AirPods1,3";
    case 8208:
      return "Device1,8208";
    case 8209:
      return "BeatsStudioBuds1,1";
    case 8210:
      return "Device1,8210";
    case 8211:
      return "Device1,8211";
    case 8212:
      return "Device1,8212";
    case 8213:
      return "Device1,8213";
    case 8214:
      return "BeatsStudioBuds1,2";
    case 8215:
      return "BeatsStudioPro1,1";
    case 8216:
      return "Device1,8216";
    case 8217:
      return "Device1,8217";
    case 8218:
      return "Device1,8218";
    case 8219:
      return "Device1,8219";
    case 8220:
      return "Device1,8220";
    case 8221:
      return "Device1,8221";
    case 8222:
      return "Device1,8222";
    case 8223:
      return "Device1,8223";
    case 8224:
      return "Device1,8224";
    case 8228:
      return "Device1,8228";
    case 8229:
      return "Device1,8229";
    case 8230:
      return "Device1,8230";
    default:
      if (a1 == 614)
      {
        uint64_t result = "ATVRemote1,1";
      }
      else
      {
        if (a1 != 621) {
          return "?";
        }
        uint64_t result = "ATVRemote1,2";
      }
      break;
  }
  return result;
}

const char *CBDeviceTypeToString(unsigned int a1)
{
  if (a1 > 0x33) {
    return "?";
  }
  else {
    return off_1E5E333A0[(char)a1];
  }
}

uint64_t CBDeviceFlagsToString()
{
  return CUPrintFlags64();
}

uint64_t CBServiceFlagsToString()
{
  return CUPrintFlags64();
}

uint64_t CBDiscoveryTypeFromCString(const char *a1)
{
  if (!strcmp(a1, "AirDrop")) {
    return 1;
  }
  if (!strcmp(a1, "FieldDiagnostics")) {
    return 2;
  }
  if (!strcmp(a1, "iBeacon")) {
    return 3;
  }
  if (!strcmp(a1, "NearbyInfoV2")) {
    return 4;
  }
  if (!strcmp(a1, "AUAction")) {
    return 6;
  }
  if (!strcmp(a1, "AirPrint")) {
    return 7;
  }
  if (!strcmp(a1, "MacSetup")) {
    return 8;
  }
  if (!strcmp(a1, "MacMigrate")) {
    return 9;
  }
  if (!strcmp(a1, "SIMTransfer2")) {
    return 5;
  }
  if (!strcmp(a1, "AcceptedInvitation")) {
    return 10;
  }
  if (!strcmp(a1, "ADPDBuffer")) {
    return 11;
  }
  if (!strcmp(a1, "DockKitAccessory")) {
    return 12;
  }
  if (!strcmp(a1, "AppleIDSignIn")) {
    return 13;
  }
  if (!strcmp(a1, "FindMyAccessory")) {
    return 14;
  }
  if (!strcmp(a1, "NearbyActionNoWake")) {
    return 15;
  }
  if (!strcmp(a1, "PrecisionFinding")) {
    return 16;
  }
  if (!strcmp(a1, "ADPD")) {
    return 18;
  }
  if (!strcmp(a1, "MiLo")) {
    return 19;
  }
  if (!strcmp(a1, "NearbyInfoV2Invitation")) {
    return 21;
  }
  if (!strcmp(a1, "OSUpdate")) {
    return 22;
  }
  if (!strcmp(a1, "WatchSetup")) {
    return 23;
  }
  if (!strcmp(a1, "OSRecoveryExtended")) {
    return 24;
  }
  if (!strcmp(a1, "AllBuffer")) {
    return 25;
  }
  if (!strcmp(a1, "SafetyAlerts")) {
    return 26;
  }
  if (!strcmp(a1, "GenericServiceUUIDs")) {
    return 27;
  }
  if (!strcmp(a1, "ProximityPairingBuffer")) {
    return 29;
  }
  if (!strcmp(a1, "AddUser")) {
    return 31;
  }
  if (!strcmp(a1, "PhotoSetup")) {
    return 32;
  }
  if (!strcmp(a1, "NoConsolidateScan")) {
    return 33;
  }
  return 0;
}

void __CBDiscoveryTypesBLEScan_block_invoke()
{
  v0 = &byte_1E5E330DC;
  uint64_t v1 = &byte_1E5E330DC;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if (v3)
    {
      int v4 = *((_DWORD *)v0 - 1);
      if ((v4 - 34) >= 0xFFFFFFDF) {
        *((unsigned char *)&_MergedGlobals_0 + ((unint64_t)(v4 - 1) >> 3) + 8) |= 1 << (-(char)v4 & 7);
      }
    }
    uint64_t v2 = *(void *)(v0 + 12);
    v0 = v1;
  }
  while (v2);
}

void __CBDiscoveryTypesBuffer_block_invoke()
{
  v0 = &byte_1E5E330DC;
  uint64_t v1 = &byte_1E5E330DC;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 0x40) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
      if ((v4 - 34) >= 0xFFFFFFDF) {
        *((unsigned char *)&_MergedGlobals_0 + ((unint64_t)(v4 - 1) >> 3) + 13) |= 1 << (-(char)v4 & 7);
      }
    }
    uint64_t v2 = *(void *)(v0 + 12);
    v0 = v1;
  }
  while (v2);
}

void __CBDiscoveryTypesNearbyActionV1_block_invoke()
{
  v0 = &byte_1E5E330DC;
  uint64_t v1 = &byte_1E5E330DC;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 2) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
      if ((v4 - 34) >= 0xFFFFFFDF) {
        *((unsigned char *)&_MergedGlobals_0 + ((unint64_t)(v4 - 1) >> 3) + 18) |= 1 << (-(char)v4 & 7);
      }
    }
    uint64_t v2 = *(void *)(v0 + 12);
    v0 = v1;
  }
  while (v2);
}

void __CBDiscoveryTypesNearbyActionV2_block_invoke()
{
  v0 = &byte_1E5E330DC;
  uint64_t v1 = &byte_1E5E330DC;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 4) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
      if ((v4 - 34) >= 0xFFFFFFDF) {
        *((unsigned char *)&_MergedGlobals_0 + ((unint64_t)(v4 - 1) >> 3) + 23) |= 1 << (-(char)v4 & 7);
      }
    }
    uint64_t v2 = *(void *)(v0 + 12);
    v0 = v1;
  }
  while (v2);
}

void *CBDiscoveryTypesNearbyActionNoWake()
{
  if (qword_1EB4791E0 != -1) {
    dispatch_once(&qword_1EB4791E0, &__block_literal_global_259);
  }
  return &unk_1EB47919C;
}

void __CBDiscoveryTypesNearbyActionNoWake_block_invoke()
{
  v0 = &byte_1E5E330DC;
  uint64_t v1 = &byte_1E5E330DC;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if (v3 < 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
      if ((v4 - 34) >= 0xFFFFFFDF) {
        *((unsigned char *)&_MergedGlobals_0 + ((unint64_t)(v4 - 1) >> 3) + 28) |= 1 << (-(char)v4 & 7);
      }
    }
    uint64_t v2 = *(void *)(v0 + 12);
    v0 = v1;
  }
  while (v2);
}

void __CBDiscoveryTypesNeedsAdvertisingAddress_block_invoke()
{
  v0 = &byte_1E5E330DC;
  uint64_t v1 = &byte_1E5E330DC;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 8) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
      if ((v4 - 34) >= 0xFFFFFFDF) {
        *((unsigned char *)&_MergedGlobals_0 + ((unint64_t)(v4 - 1) >> 3) + 33) |= 1 << (-(char)v4 & 7);
      }
    }
    uint64_t v2 = *(void *)(v0 + 12);
    v0 = v1;
  }
  while (v2);
}

void __CBDiscoveryTypesNeedsIdentify_block_invoke()
{
  v0 = &byte_1E5E330DC;
  uint64_t v1 = &byte_1E5E330DC;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 0x10) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
      if ((v4 - 34) >= 0xFFFFFFDF) {
        *((unsigned char *)&_MergedGlobals_0 + ((unint64_t)(v4 - 1) >> 3) + 38) |= 1 << (-(char)v4 & 7);
      }
    }
    uint64_t v2 = *(void *)(v0 + 12);
    v0 = v1;
  }
  while (v2);
}

void __CBDiscoveryTypesNearbyInfoV2_block_invoke()
{
  v0 = &byte_1E5E330DC;
  uint64_t v1 = &byte_1E5E330DC;
  do
  {
    char v3 = *v1;
    v1 += 24;
    if ((v3 & 0x20) != 0)
    {
      int v4 = *((_DWORD *)v0 - 1);
      if ((v4 - 34) >= 0xFFFFFFDF) {
        *((unsigned char *)&_MergedGlobals_0 + ((unint64_t)(v4 - 1) >> 3) + 43) |= 1 << (-(char)v4 & 7);
      }
    }
    uint64_t v2 = *(void *)(v0 + 12);
    v0 = v1;
  }
  while (v2);
}

void __CBDiscoveryTypesNeedsObjectLocator_block_invoke()
{
  v0 = &byte_1E5E330DC;
  do
  {
    if (v0[1])
    {
      int v2 = *((_DWORD *)v0 - 1);
      if ((v2 - 34) >= 0xFFFFFFDF) {
        *((unsigned char *)&_MergedGlobals_0 + ((unint64_t)(v2 - 1) >> 3) + 48) |= 1 << (-(char)v2 & 7);
      }
    }
    uint64_t v1 = *(void *)(v0 + 12);
    v0 += 24;
  }
  while (v1);
}

void __CBDiscoveryTypesProximityService_block_invoke()
{
  v0 = &byte_1E5E330DC;
  do
  {
    if ((v0[1] & 2) != 0)
    {
      int v2 = *((_DWORD *)v0 - 1);
      if ((v2 - 34) >= 0xFFFFFFDF) {
        *((unsigned char *)&_MergedGlobals_0 + ((unint64_t)(v2 - 1) >> 3) + 53) |= 1 << (-(char)v2 & 7);
      }
    }
    uint64_t v1 = *(void *)(v0 + 12);
    v0 += 24;
  }
  while (v1);
}

__CFString *CBDiscoveryTypesToString(uint64_t a1)
{
  CUAppendF();
  id v2 = 0;
  char v3 = &off_1E5E330E8;
  do
  {
    int v5 = *((_DWORD *)v3 - 4);
    if ((v5 - 34) >= 0xFFFFFFDF
      && ((*(unsigned __int8 *)(a1 + ((unint64_t)(v5 - 1) >> 3)) >> (-(char)v5 & 7)) & 1) != 0)
    {
      CUAppendF();
      id v6 = v2;

      id v2 = v6;
    }
    int v4 = *v3;
    v3 += 3;
  }
  while (v4);
  CUAppendF();
  char v7 = (__CFString *)v2;

  unsigned int v8 = &stru_1F02E5F20;
  if (v7) {
    unsigned int v8 = v7;
  }
  int v9 = v8;

  return v9;
}

__CFString *CBDiscoveryTypesEnumToString(uint64_t a1)
{
  CUAppendF();
  id v2 = 0;
  char v3 = &off_1E5E330E8;
  do
  {
    int v5 = *((_DWORD *)v3 - 4);
    if ((v5 - 34) >= 0xFFFFFFDF
      && ((*(unsigned __int8 *)(a1 + ((unint64_t)(v5 - 1) >> 3)) >> (-(char)v5 & 7)) & 1) != 0)
    {
      CUAppendF();
      id v6 = v2;

      id v2 = v6;
    }
    int v4 = *v3;
    v3 += 3;
  }
  while (v4);
  CUAppendF();
  char v7 = (__CFString *)v2;

  unsigned int v8 = &stru_1F02E5F20;
  if (v7) {
    unsigned int v8 = v7;
  }
  int v9 = v8;

  return v9;
}

id CBErrorF(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  unsigned int v10 = [NSString stringWithUTF8String:a2];
  uint64_t v11 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];
  id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = @"cuErrorMsg";
  v17[0] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v14 = (void *)[v12 initWithDomain:@"CBErrorDomain" code:a1 userInfo:v13];

  return v14;
}

uint64_t CBUseCaseFromString(const char *a1)
{
  if (!strcasecmp(a1, "HealthKit")) {
    return 1;
  }
  if (!strcasecmp(a1, "HomeKit")) {
    return 2;
  }
  if (!strcasecmp(a1, "FindMyObjectConnection")) {
    return 3;
  }
  if (!strcasecmp(a1, "FindMyObjectConnectionTransient")) {
    return 4;
  }
  if (!strcasecmp(a1, "MIDI")) {
    return 5;
  }
  if (!strcasecmp(a1, "Continuity")) {
    return 6;
  }
  if (!strcasecmp(a1, "InstantHotSpot")) {
    return 7;
  }
  if (!strcasecmp(a1, "NearBy")) {
    return 8;
  }
  if (!strcasecmp(a1, "Sharing")) {
    return 9;
  }
  if (!strcasecmp(a1, "HearingSupport")) {
    return 10;
  }
  if (!strcasecmp(a1, "Magnet")) {
    return 11;
  }
  if (!strcasecmp(a1, "HID")) {
    return 12;
  }
  if (!strcasecmp(a1, "LEA")) {
    return 13;
  }
  if (!strcasecmp(a1, "External")) {
    return 14;
  }
  if (!strcasecmp(a1, "ExternalMedical")) {
    return 15;
  }
  if (!strcasecmp(a1, "ExternalLock")) {
    return 16;
  }
  if (!strcasecmp(a1, "ExternalWatch")) {
    return 17;
  }
  if (!strcasecmp(a1, "SmartRouting")) {
    return 18;
  }
  if (!strcasecmp(a1, "DigitalID")) {
    return 19;
  }
  if (!strcasecmp(a1, "DigitalKey")) {
    return 20;
  }
  if (!strcasecmp(a1, "DigitalCarKey")) {
    return 21;
  }
  if (!strcasecmp(a1, "DigitalCarKeyThirdParty")) {
    return 0x40000;
  }
  if (!strcasecmp(a1, "HeySiri")) {
    return 22;
  }
  if (!strcasecmp(a1, "ThirdPartyApp")) {
    return 23;
  }
  if (!strcasecmp(a1, "CNJ")) {
    return 24;
  }
  if (!strcasecmp(a1, "DevicePresenceDetection")) {
    return 256;
  }
  if (!strcasecmp(a1, "AudioBox")) {
    return 257;
  }
  if (!strcasecmp(a1, "SIMTransfer") || !strcasecmp(a1, "SIMTransfer2")) {
    return 258;
  }
  if (!strcasecmp(a1, "ProximityScreenOnLeechScan")) {
    return 259;
  }
  if (!strcasecmp(a1, "MacMigrate")) {
    return 260;
  }
  if (!strcasecmp(a1, "HIDUARTService")) {
    return 263;
  }
  if (!strcasecmp(a1, "AccessibilitySwitchControlPairing")) {
    return 264;
  }
  if (!strcasecmp(a1, "BaseBandFastConnect")) {
    return 265;
  }
  if (!strcasecmp(a1, "SafetyAlerts")) {
    return 266;
  }
  if (!strcasecmp(a1, "LECarPlay")) {
    return 267;
  }
  if (!strcasecmp(a1, "TCCBluetooth")) {
    return 268;
  }
  if (!strcasecmp(a1, "AOPBufferLeech")) {
    return 269;
  }
  if (!strcasecmp(a1, "FindMyAction")) {
    return 0x10000;
  }
  if (!strcasecmp(a1, "FindMyBackground")) {
    return 65537;
  }
  if (!strcasecmp(a1, "FindMyActionHELE")) {
    return 65538;
  }
  if (!strcasecmp(a1, "FindMyBackgroundHELE")) {
    return 65539;
  }
  if (!strcasecmp(a1, "FindMyActionTransient")) {
    return 65540;
  }
  if (!strcasecmp(a1, "FindMyBackgroundTransient")) {
    return 65541;
  }
  if (!strcasecmp(a1, "FindMyActionHELETransient")) {
    return 65542;
  }
  if (!strcasecmp(a1, "FindMyBackgroundHELETransient")) {
    return 65543;
  }
  if (!strcasecmp(a1, "FindMyNotOptedIn")) {
    return 65544;
  }
  if (!strcasecmp(a1, "FindMyOptedIn")) {
    return 65545;
  }
  if (!strcasecmp(a1, "FindMySepAlertsEnabled")) {
    return 65546;
  }
  if (!strcasecmp(a1, "FindMyTemporaryAggressiveLegacy")) {
    return 65547;
  }
  if (!strcasecmp(a1, "FindMyTemporaryLongAggressive")) {
    return 65548;
  }
  if (!strcasecmp(a1, "FindMyBTFindingUserInitiated")) {
    return 65549;
  }
  if (!strcasecmp(a1, "FindMyHELE")) {
    return 65550;
  }
  if (!strcasecmp(a1, "FindMyBeaconOnDemand")) {
    return 65551;
  }
  if (!strcasecmp(a1, "FindMyWildTimedScan")) {
    return 65552;
  }
  if (!strcasecmp(a1, "FindMyBackgroundLeechScan")) {
    return 65553;
  }
  if (!strcasecmp(a1, "FindMySnifferMode")) {
    return 65554;
  }
  if (!strcasecmp(a1, "FindMyUnpair")) {
    return 65555;
  }
  if (!strcasecmp(a1, "FindMyUnpairHELE")) {
    return 65556;
  }
  if (!strcasecmp(a1, "FindMyPlaySound")) {
    return 65557;
  }
  if (!strcasecmp(a1, "FindMyPlaySoundHELE")) {
    return 65558;
  }
  if (!strcasecmp(a1, "FindMyNotOptedInBeepOnMoveWaking")) {
    return 65559;
  }
  if (!strcasecmp(a1, "FindMyUTTransient")) {
    return 65560;
  }
  if (!strcasecmp(a1, "FindMyUTHELETransient")) {
    return 65561;
  }
  if (!strcasecmp(a1, "SharingDefault")) {
    return 0x20000;
  }
  if (!strcasecmp(a1, "SharingPhoneAutoUnlock")) {
    return 131073;
  }
  if (!strcasecmp(a1, "SharingSiriWatchAuth")) {
    return 131074;
  }
  if (!strcasecmp(a1, "SharingMacAutoUnlock")) {
    return 131075;
  }
  if (!strcasecmp(a1, "SharingEDTScreenOn")) {
    return 131076;
  }
  if (!strcasecmp(a1, "SharingEDTWiFiDisabled")) {
    return 131077;
  }
  if (!strcasecmp(a1, "SharingEDTWombatEligibleAsDefaultCamera")) {
    return 131078;
  }
  if (!strcasecmp(a1, "SharingEDTWombatCameraPicker")) {
    return 131079;
  }
  if (!strcasecmp(a1, "SharingWombatBackground")) {
    return 131080;
  }
  if (!strcasecmp(a1, "SharingUniversalControl")) {
    return 131081;
  }
  if (!strcasecmp(a1, "SharingPeopleProximity")) {
    return 131082;
  }
  if (!strcasecmp(a1, "SharingEDTEnsembleOpenDisplayPrefs")) {
    return 131083;
  }
  if (!strcasecmp(a1, "SharingEDTNearbydMotionStopped")) {
    return 131084;
  }
  if (!strcasecmp(a1, "SharingDoubleBoostGenericScan")) {
    return 131085;
  }
  if (!strcasecmp(a1, "SharingEDTIncomingAdvertisement")) {
    return 131086;
  }
  if (!strcasecmp(a1, "SharingEDTWombatStreamStart")) {
    return 131087;
  }
  if (!strcasecmp(a1, "SharingOYAutoUnlock")) {
    return 131088;
  }
  if (!strcasecmp(a1, "SharingAirDrop")) {
    return 131090;
  }
  if (!strcasecmp(a1, "SharingNearbyInvitationHost")) {
    return 131091;
  }
  if (!strcasecmp(a1, "SharingNearbyInvitationParticipant")) {
    return 131092;
  }
  if (!strcasecmp(a1, "SharingAirDropAskToAirDrop")) {
    return 131093;
  }
  if (!strcasecmp(a1, "SharingAirDropTempIdentity")) {
    return 131094;
  }
  if (!strcasecmp(a1, "SharingAirDropNeedsCLink")) {
    return 131095;
  }
  if (!strcasecmp(a1, "SharingRemoteWidgetUpdate")) {
    return 131096;
  }
  if (!strcasecmp(a1, "SharingCountryCodeUpdate")) {
    return 131097;
  }
  if (!strcasecmp(a1, "SharingMacPhoneAutoUnlock")) {
    return 131098;
  }
  if (!strcasecmp(a1, "SharingVisionProDiscovery")) {
    return 131099;
  }
  if (!strcasecmp(a1, "SharingVisionProStateChange")) {
    return 131100;
  }
  if (!strcasecmp(a1, "SharingContinuityScreen")) {
    return 131101;
  }
  if (!strcasecmp(a1, "SharingEDTRemoteDisplay")) {
    return 131102;
  }
  if (!strcasecmp(a1, "DigitalIDTSA")) {
    return 196608;
  }
  if (!strcasecmp(a1, "RapportThirdParty")) {
    return 327680;
  }
  if (!strcasecmp(a1, "CaptiveNetworkJoin")) {
    return 393216;
  }
  if (!strcasecmp(a1, "UseCaseSIMTransfer")) {
    return 393217;
  }
  if (!strcasecmp(a1, "MacSetup")) {
    return 393218;
  }
  if (!strcasecmp(a1, "AppleIDSignIn")) {
    return 393219;
  }
  if (!strcasecmp(a1, "AppleIDSignInSettings")) {
    return 393220;
  }
  if (!strcasecmp(a1, "PrecisionFindingFinder")) {
    return 458752;
  }
  if (!strcasecmp(a1, "PrecisionFindingFindee")) {
    return 458753;
  }
  if (!strcasecmp(a1, "ADPD")) {
    return 0x80000;
  }
  if (!strcasecmp(a1, "ADPDBuffer")) {
    return 524289;
  }
  if (!strcasecmp(a1, "MicroLocation")) {
    return 524290;
  }
  if (!strcasecmp(a1, "MicroLocationLeech")) {
    return 524291;
  }
  if (!strcasecmp(a1, "FindNearbyRemote")) {
    return 589824;
  }
  if (!strcasecmp(a1, "FindNearbyPencil")) {
    return 589825;
  }
  if (!strcasecmp(a1, "AccessDigitalHomeKey")) {
    return 655360;
  }
  if (!strcasecmp(a1, "ProxControlDeviceClose")) {
    return 786432;
  }
  if (!strcasecmp(a1, "InternalTestNoLockScan")) {
    return 2147418112;
  }
  if (!strcasecmp(a1, "InternalTestNoScreenOffScan")) {
    return 2147418113;
  }
  if (!strcasecmp(a1, "InternalTestScanWithNoDups")) {
    return 2147418114;
  }
  if (!strcasecmp(a1, "InternalTestScanWithDups")) {
    return 2147418115;
  }
  if (!strcasecmp(a1, "InternalTestScanFor20Seconds")) {
    return 2147418116;
  }
  if (!strcasecmp(a1, "InternalTestActiveScan")) {
    return 2147418117;
  }
  if (!strcasecmp(a1, "InternalTestUUIDScan")) {
    return 2147418118;
  }
  if (!strcasecmp(a1, "InternalTestScanFor10ClockSeconds")) {
    return 2147418119;
  }
  if (!strcasecmp(a1, "InternalTestScanBoost")) {
    return 2147418120;
  }
  return 0;
}

unint64_t CBUTF8Truncate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 <= a3) {
    return a2;
  }
  if (a2 - a3 < 2)
  {
    char v3 = -80;
    if (!a3) {
      goto LABEL_11;
    }
  }
  else
  {
    char v3 = *(unsigned char *)(a3 + a1 + 1);
    if (!a3) {
      goto LABEL_11;
    }
  }
  int v4 = *(unsigned __int8 *)(a1 + a3);
  do
  {
    if ((v4 & 0xC0) != 0x80 && (v4 != 237 || (v3 & 0xF0) != 0xB0)) {
      break;
    }
    char v3 = v4;
    int v4 = *(unsigned __int8 *)(a1 - 1 + a3--);
  }
  while (a3);
LABEL_11:
  while (a3)
  {
    unint64_t v5 = a3 - 1;
    unsigned int v6 = *(unsigned __int8 *)(a1 - 1 + a3--);
    if (v6 >= 0x21) {
      return v5 + 1;
    }
  }
  return 0;
}

uint64_t CBLTV8GetNext(unint64_t a1, unsigned __int8 *a2, unsigned char *a3, void *a4, void *a5, void *a6)
{
  if ((unsigned __int8 *)a1 == a2) {
    return 4294960531;
  }
  if ((uint64_t)&a2[-a1] < 1) {
    return 4294960591;
  }
  unint64_t v6 = *(unsigned __int8 *)a1;
  if ((unint64_t)&a2[~a1] < v6) {
    return 4294960546;
  }
  if (!*(unsigned char *)a1) {
    return 4294960554;
  }
  char v7 = (unsigned __int8 *)(a1 + 2);
  *a3 = *(unsigned char *)(a1 + 1);
  *a4 = a1 + 2;
  uint64_t v8 = (v6 - 1);
  *a5 = v8;
  uint64_t result = 0;
  if (a6) {
    *a6 = &v7[v8];
  }
  return result;
}

uint64_t CBLTV8GetWithType(unint64_t a1, unsigned __int8 *a2, int a3, unsigned __int8 **a4, void *a5)
{
  if ((unsigned __int8 *)a1 == a2) {
    return 4294960531;
  }
  do
  {
    if ((unsigned __int8 *)a1 == a2) {
      return 4294960569;
    }
    if ((uint64_t)&a2[-a1] < 1) {
      return 4294960591;
    }
    unint64_t v5 = *(unsigned __int8 *)a1;
    if ((unint64_t)&a2[~a1] < v5) {
      return 4294960546;
    }
    if (!*(unsigned char *)a1) {
      return 4294960554;
    }
    unint64_t v6 = (unsigned __int8 *)(a1 + 2);
    int v7 = *(unsigned __int8 *)(a1 + 1);
    uint64_t v8 = (v5 - 1);
    a1 += 2 + v8;
  }
  while (v7 != a3);
  if (a4) {
    *a4 = v6;
  }
  uint64_t result = 0;
  if (a5) {
    *a5 = v8;
  }
  return result;
}

unint64_t CBLTV8GetSInt64(unint64_t a1, unsigned __int8 *a2, int a3, int *a4)
{
  if ((unsigned __int8 *)a1 == a2)
  {
    unint64_t result = 0;
    int v8 = -6765;
  }
  else
  {
    do
    {
      if ((unsigned __int8 *)a1 == a2)
      {
        unint64_t result = 0;
        int v8 = -6727;
        goto LABEL_19;
      }
      unint64_t v4 = a1;
      if ((uint64_t)&a2[-a1] < 1)
      {
        unint64_t result = 0;
        int v8 = -6705;
        goto LABEL_19;
      }
      unint64_t v5 = *(unsigned __int8 *)a1;
      if ((unint64_t)&a2[~a1] < v5)
      {
        unint64_t result = 0;
        int v8 = -6750;
        goto LABEL_19;
      }
      if (!*(unsigned char *)a1)
      {
        unint64_t result = 0;
        int v8 = -6742;
        goto LABEL_19;
      }
      unint64_t v6 = (char *)(a1 + 2);
      int v7 = *(unsigned __int8 *)(a1 + 1);
      a1 += 2 + (v5 - 1);
    }
    while (v7 != a3);
    switch((int)v5)
    {
      case 2:
        int v8 = 0;
        unint64_t result = *v6;
        break;
      case 3:
        int v8 = 0;
        unint64_t result = (__int16)(*(unsigned __int8 *)(v4 + 3) << 8) | (unint64_t)*(unsigned __int8 *)(v4 + 2);
        break;
      case 4:
        int v8 = 0;
        unint64_t v10 = (uint64_t)*(char *)(v4 + 4) << 16;
        goto LABEL_18;
      case 5:
        int v8 = 0;
        unint64_t result = *(int *)v6;
        break;
      case 6:
        int v8 = 0;
        unint64_t v11 = (uint64_t)*(char *)(v4 + 6) << 32;
        goto LABEL_17;
      case 7:
        int v8 = 0;
        unint64_t v12 = (uint64_t)*(char *)(v4 + 7) << 40;
        goto LABEL_16;
      case 8:
        int v8 = 0;
        unint64_t v12 = ((uint64_t)*(char *)(v4 + 8) << 48) | ((unint64_t)*(unsigned __int8 *)(v4 + 7) << 40);
LABEL_16:
        unint64_t v11 = v12 | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32);
LABEL_17:
        unint64_t v10 = v11 | ((unint64_t)*(unsigned __int8 *)(v4 + 5) << 24) | ((unint64_t)*(unsigned __int8 *)(v4 + 4) << 16);
LABEL_18:
        unint64_t result = v10 | ((unint64_t)*(unsigned __int8 *)(v4 + 3) << 8) | *(unsigned __int8 *)(v4 + 2);
        break;
      case 9:
        int v8 = 0;
        unint64_t result = *(void *)v6;
        break;
      default:
        unint64_t result = 0;
        int v8 = -6743;
        break;
    }
  }
LABEL_19:
  if (a4) {
    *a4 = v8;
  }
  return result;
}

unint64_t CBLTV8GetUInt64(unint64_t a1, unsigned __int8 *a2, int a3, int *a4)
{
  if ((unsigned __int8 *)a1 == a2)
  {
    unint64_t result = 0;
    int v8 = -6765;
  }
  else
  {
    do
    {
      if ((unsigned __int8 *)a1 == a2)
      {
        unint64_t result = 0;
        int v8 = -6727;
        goto LABEL_17;
      }
      unint64_t v4 = a1;
      if ((uint64_t)&a2[-a1] < 1)
      {
        unint64_t result = 0;
        int v8 = -6705;
        goto LABEL_17;
      }
      unint64_t v5 = *(unsigned __int8 *)a1;
      if ((unint64_t)&a2[~a1] < v5)
      {
        unint64_t result = 0;
        int v8 = -6750;
        goto LABEL_17;
      }
      if (!*(unsigned char *)a1)
      {
        unint64_t result = 0;
        int v8 = -6742;
        goto LABEL_17;
      }
      unint64_t v6 = (unsigned __int8 *)(a1 + 2);
      int v7 = *(unsigned __int8 *)(a1 + 1);
      a1 += 2 + (v5 - 1);
    }
    while (v7 != a3);
    switch((int)v5)
    {
      case 2:
        int v8 = 0;
        unint64_t result = *v6;
        break;
      case 3:
        int v8 = 0;
        unint64_t result = *(unsigned __int16 *)(v4 + 2);
        break;
      case 4:
        int v8 = 0;
        unint64_t result = *(unsigned __int16 *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 4) << 16);
        break;
      case 5:
        int v8 = 0;
        unint64_t result = *(unsigned int *)v6;
        break;
      case 6:
        int v8 = 0;
        unint64_t result = *(unsigned int *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32);
        break;
      case 7:
        int v8 = 0;
        unint64_t result = *(unsigned int *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32) | ((unint64_t)*(unsigned __int8 *)(v4 + 7) << 40);
        break;
      case 8:
        int v8 = 0;
        unint64_t result = *(unsigned int *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32) | ((unint64_t)*(unsigned __int8 *)(v4 + 7) << 40) | ((unint64_t)*(unsigned __int8 *)(v4 + 8) << 48);
        break;
      case 9:
        int v8 = 0;
        unint64_t result = *(void *)v6;
        break;
      default:
        unint64_t result = 0;
        int v8 = -6743;
        break;
    }
  }
LABEL_17:
  if (a4) {
    *a4 = v8;
  }
  return result;
}

void CBMockAddOrUpdateAdvertiser(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  os_unfair_lock_lock(&stru_1EB479184);
  unint64_t v5 = [(id)qword_1EB479238 objectForKeyedSubscript:v3];
  if (!v5)
  {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    unint64_t v6 = (void *)qword_1EB479238;
    if (!qword_1EB479238)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v8 = (void *)qword_1EB479238;
      qword_1EB479238 = (uint64_t)v7;

      unint64_t v6 = (void *)qword_1EB479238;
    }
    [v6 setObject:v5 forKeyedSubscript:v3];
  }
  [v5 addObject:v4];
  int v9 = [v4 mockDevice];
  if (v9)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v10 = objc_msgSend((id)qword_1EB479240, "objectForKeyedSubscript:", v3, 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v14++) reportMockDeviceFound:v9];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
  os_unfair_lock_unlock(&stru_1EB479184);
}

void CBMockRemoveAdvertiser(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  os_unfair_lock_lock(&stru_1EB479184);
  unint64_t v5 = [(id)qword_1EB479238 objectForKeyedSubscript:v3];
  if ([v5 containsObject:v4])
  {
    [v5 removeObject:v4];
    if (![v5 count]) {
      [(id)qword_1EB479238 setObject:0 forKeyedSubscript:v3];
    }
    unint64_t v6 = [v4 mockDevice];
    if (v6)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = objc_msgSend((id)qword_1EB479240, "objectForKeyedSubscript:", v3, 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * v11++) reportMockDeviceLost:v6];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
    os_unfair_lock_unlock(&stru_1EB479184);
  }
  else
  {
    os_unfair_lock_unlock(&stru_1EB479184);
  }
}

void CBMockAddOrUpdateDiscovery(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  os_unfair_lock_lock(&stru_1EB479184);
  unint64_t v5 = [(id)qword_1EB479240 objectForKeyedSubscript:v3];
  if (!v5)
  {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    unint64_t v6 = (void *)qword_1EB479240;
    if (!qword_1EB479240)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = (void *)qword_1EB479240;
      qword_1EB479240 = (uint64_t)v7;

      unint64_t v6 = (void *)qword_1EB479240;
    }
    [v6 setObject:v5 forKeyedSubscript:v3];
  }
  [v5 addObject:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = objc_msgSend((id)qword_1EB479238, "objectForKeyedSubscript:", v3, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v15 + 1) + 8 * v13) mockDevice];
        if (v14) {
          [v4 reportMockDeviceFound:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock(&stru_1EB479184);
}

void CBMockRemoveDiscovery(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  os_unfair_lock_lock(&stru_1EB479184);
  id v4 = [(id)qword_1EB479240 objectForKeyedSubscript:v5];
  [v4 removeObject:v3];

  if (![v4 count]) {
    [(id)qword_1EB479240 setObject:0 forKeyedSubscript:v5];
  }
  os_unfair_lock_unlock(&stru_1EB479184);
}

id CBUserControllerXPCInterface()
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0307520];
  id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v14, "initWithObjects:", v13, v12, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  [v0 setClasses:v10 forSelector:sel_appleAudioAccessoryLimitedLoggingWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_setAppleAudioAccessoryLimitedLogging_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_getDistributedLoggingStatusWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_setDistributedLoggingStatus_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_getCurrentUserGivenNameWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_getControllerInfoForDevice_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_getCloudPairedDevicesWithCompletionHandler_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_getControllerInfoForDevice_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_storeControllerInfo_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_readPrefKeys_source_completion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v10 forSelector:sel_writePrefKey_value_source_completion_ argumentIndex:0 ofReply:1];

  return v0;
}

id CBGetHexString(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:2 * a2];
  if (a2)
  {
    uint64_t v5 = a2;
    do
    {
      unsigned int v6 = *a1++;
      objc_msgSend(v4, "appendFormat:", @"%02x", v6);
      --v5;
    }
    while (v5);
  }

  return v4;
}

id CBGenerateSHA256HashedString(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (const char *)[a1 UTF8String];
  *(_OWORD *)md = 0u;
  long long v6 = 0u;
  CC_LONG v2 = strlen(v1);
  if (CC_SHA256(v1, v2, md))
  {
    uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:64];
    objc_msgSend(v3, "appendFormat:", @"%02x", md[0]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[1]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[2]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[3]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[4]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[5]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[6]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[7]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[8]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[9]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[10]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[11]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[12]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[13]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[14]);
    objc_msgSend(v3, "appendFormat:", @"%02x", md[15]);
    objc_msgSend(v3, "appendFormat:", @"%02x", v6);
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE1(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE2(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE3(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE4(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE5(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE6(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE7(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE8(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE9(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE10(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE11(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE12(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE13(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", BYTE14(v6));
    objc_msgSend(v3, "appendFormat:", @"%02x", HIBYTE(v6));
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1ABA4B008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  (*(void (**)(uint64_t))(v7 + 16))(v7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA4C0A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA4C1F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA4C204(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA4C374(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA4C388(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA4C428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const char *CBCentralManagerConnectionLatencyToString(uint64_t a1)
{
  uint64_t v1 = a1 + 99;
  unint64_t result = "Invalid";
  switch(v1)
  {
    case 0:
      return result;
    case 88:
      unint64_t result = "MagnetSubrating";
      break;
    case 89:
      unint64_t result = "VeryHigh";
      break;
    case 90:
      unint64_t result = "Mid-Fixed";
      break;
    case 91:
      unint64_t result = "Low-Fixed";
      break;
    case 92:
      unint64_t result = "VeryLow";
      break;
    case 93:
      unint64_t result = "PowerOptimize";
      break;
    case 94:
      unint64_t result = "HomeKit";
      break;
    case 95:
      unint64_t result = "Continuity";
      break;
    case 96:
      unint64_t result = "MagnetUpgraded";
      break;
    case 97:
      unint64_t result = "Magnet";
      break;
    case 98:
      unint64_t result = "Midi";
      break;
    case 99:
      unint64_t result = "Low";
      break;
    case 100:
      unint64_t result = "Medium";
      break;
    case 101:
      unint64_t result = "High";
      break;
    default:
      unint64_t result = "?";
      break;
  }
  return result;
}

void sub_1ABA519F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA51FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA52D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA54CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA55218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA559A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA562A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA58770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA587C4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

uint64_t convertToWhbMsgId(uint64_t a1)
{
  if (_MergedGlobals_2 != -1) {
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_4);
  }
  CC_LONG v2 = NSNumber;
  id v3 = (id)qword_1EB479260;
  uint64_t v4 = [v2 numberWithUnsignedShort:a1];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [v5 unsignedShortValue];

    return v6;
  }
  else
  {

    return 0;
  }
}

uint64_t convertToCBMsgId(__int16 a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  __int16 v10 = 0;
  if (_MergedGlobals_2 != -1) {
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_4);
  }
  id v2 = (id)qword_1EB479260;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __convertToCBMsgId_block_invoke;
  v5[3] = &unk_1E5E33D98;
  __int16 v6 = a1;
  v5[4] = &v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
  uint64_t v3 = *((unsigned __int16 *)v8 + 12);

  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_1ABA5A5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __msgConversionMap_block_invoke()
{
  v3[35] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0301BD0;
  v2[1] = &unk_1F0301BE8;
  v3[0] = &unk_1F0301BD0;
  v3[1] = &unk_1F0301BE8;
  v2[2] = &unk_1F0301C00;
  v2[3] = &unk_1F0301C18;
  v3[2] = &unk_1F0301C00;
  v3[3] = &unk_1F0301C18;
  v2[4] = &unk_1F0301C30;
  v2[5] = &unk_1F0301C48;
  v3[4] = &unk_1F0301C30;
  v3[5] = &unk_1F0301C48;
  v2[6] = &unk_1F0301C60;
  v2[7] = &unk_1F0301C90;
  v3[6] = &unk_1F0301C78;
  v3[7] = &unk_1F0301CA8;
  v2[8] = &unk_1F0301CC0;
  v2[9] = &unk_1F0301CF0;
  v3[8] = &unk_1F0301CD8;
  v3[9] = &unk_1F0301C90;
  v2[10] = &unk_1F0301D08;
  v2[11] = &unk_1F0301D20;
  v3[10] = &unk_1F0301CC0;
  v3[11] = &unk_1F0301D38;
  v2[12] = &unk_1F0301D50;
  v2[13] = &unk_1F0301D80;
  v3[12] = &unk_1F0301D68;
  v3[13] = &unk_1F0301D98;
  v2[14] = &unk_1F0301DB0;
  v2[15] = &unk_1F0301DC8;
  v3[14] = &unk_1F0301DB0;
  v3[15] = &unk_1F0301DE0;
  v2[16] = &unk_1F0301DF8;
  v2[17] = &unk_1F0301E28;
  v3[16] = &unk_1F0301E10;
  v3[17] = &unk_1F0301E40;
  v2[18] = &unk_1F0301E58;
  v2[19] = &unk_1F0301E88;
  v3[18] = &unk_1F0301E70;
  v3[19] = &unk_1F0301EA0;
  v2[20] = &unk_1F0301EB8;
  v2[21] = &unk_1F0301ED0;
  v3[20] = &unk_1F0301DB0;
  v3[21] = &unk_1F0301EE8;
  v2[22] = &unk_1F0301F00;
  v2[23] = &unk_1F0301F30;
  v3[22] = &unk_1F0301F18;
  v3[23] = &unk_1F0301F48;
  v2[24] = &unk_1F0301F60;
  v2[25] = &unk_1F0301F90;
  v3[24] = &unk_1F0301F78;
  v3[25] = &unk_1F0301FA8;
  v2[26] = &unk_1F0301FC0;
  v2[27] = &unk_1F0301FF0;
  v3[26] = &unk_1F0301FD8;
  v3[27] = &unk_1F0302008;
  v2[28] = &unk_1F0302020;
  v2[29] = &unk_1F0302050;
  v3[28] = &unk_1F0302038;
  v3[29] = &unk_1F0301DC8;
  v2[30] = &unk_1F0302068;
  v2[31] = &unk_1F0302080;
  v3[30] = &unk_1F0301DF8;
  v3[31] = &unk_1F0302098;
  v2[32] = &unk_1F03020B0;
  v2[33] = &unk_1F03020E0;
  v3[32] = &unk_1F03020C8;
  v3[33] = &unk_1F03020F8;
  v2[34] = &unk_1F0302110;
  v3[34] = &unk_1F0302128;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:35];
  uint64_t v1 = (void *)qword_1EB479260;
  qword_1EB479260 = v0;
}

void __convertToCBMsgId_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  if ([a3 unsignedShortValue] == *(unsigned __int16 *)(a1 + 40))
  {
    *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 unsignedShortValue];
    *a4 = 1;
  }
}

uint64_t __CBXpcCreateNSArrayWithXpcArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = CBXpcCreateNSObjectWithXpcObject(a3);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 8 * a2);
  *(void *)(v6 + 8 * a2) = v5;

  return 1;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

const char *CBUseCaseToString_0(int a1)
{
  if (a1 >= 0x20000)
  {
    if (a1 >= 327680)
    {
      if (a1 > 589824)
      {
        if (a1 <= 2147418111)
        {
          switch(a1)
          {
            case 589825:
              return "FindNearbyPencil";
            case 655360:
              return "AccessDigitalHomeKey";
            case 786432:
              return "ProxControlDeviceClose";
            default:
              return "?";
          }
        }
        else
        {
          switch(a1)
          {
            case 2147418112:
              unint64_t result = "InternalTestNoLockScan";
              break;
            case 2147418113:
              unint64_t result = "InternalTestNoScreenOffScan";
              break;
            case 2147418114:
              unint64_t result = "InternalTestScanWithNoDups";
              break;
            case 2147418115:
              unint64_t result = "InternalTestScanWithDups";
              break;
            case 2147418116:
              unint64_t result = "InternalTestScanFor20Seconds";
              break;
            case 2147418117:
              unint64_t result = "InternalTestActiveScan";
              break;
            case 2147418118:
              unint64_t result = "InternalTestUUIDScan";
              break;
            case 2147418119:
              unint64_t result = "InternalTestScanFor10ClockSeconds";
              break;
            case 2147418120:
              unint64_t result = "InternalTestScanBoost";
              break;
            default:
              return "?";
          }
        }
      }
      else if (a1 > 458752)
      {
        switch(a1)
        {
          case 524288:
            unint64_t result = "ADPD";
            break;
          case 524289:
            unint64_t result = "ADPDBuffer";
            break;
          case 524290:
            unint64_t result = "MicroLocation";
            break;
          case 524291:
            unint64_t result = "MicroLocationLeech";
            break;
          default:
            if (a1 == 458753)
            {
              unint64_t result = "PrecisionFindingFindee";
            }
            else
            {
              if (a1 != 589824) {
                return "?";
              }
              unint64_t result = "FindNearbyRemote";
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 393216:
            unint64_t result = "CaptiveNetworkJoin";
            break;
          case 393217:
            unint64_t result = "UseCaseSIMTransfer";
            break;
          case 393218:
            unint64_t result = "MacSetup";
            break;
          case 393219:
            unint64_t result = "AppleIDSignIn";
            break;
          case 393220:
            unint64_t result = "AppleIDSignInSettings";
            break;
          default:
            if (a1 == 327680)
            {
              unint64_t result = "RapportThirdParty";
            }
            else
            {
              if (a1 != 458752) {
                return "?";
              }
              unint64_t result = "PrecisionFindingFinder";
            }
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 131072:
          return "SharingDefault";
        case 131073:
          return "SharingPhoneAutoUnlock";
        case 131074:
          return "SharingSiriWatchAuth";
        case 131075:
          return "SharingMacAutoUnlock";
        case 131076:
          return "SharingEDTScreenOn";
        case 131077:
          return "SharingEDTWiFiDisabled";
        case 131078:
          return "SharingEDTWombatEligibleAsDefaultCamera";
        case 131079:
          return "SharingEDTWombatCameraPicker";
        case 131080:
          return "SharingWombatBackground";
        case 131081:
          return "SharingUniversalControl";
        case 131082:
          return "SharingPeopleProximity";
        case 131083:
          return "SharingEDTEnsembleOpenDisplayPrefs";
        case 131084:
          return "SharingEDTNearbydMotionStopped";
        case 131085:
          return "SharingDoubleBoostGenericScan";
        case 131086:
          return "SharingEDTIncomingAdvertisement ";
        case 131087:
          return "SharingEDTWombatStreamStart";
        case 131088:
          return "SharingOYAutoUnlock";
        case 131089:
          return "?";
        case 131090:
          return "SharingAirDrop";
        case 131091:
          return "SharingNearbyInvitationHost";
        case 131092:
          return "SharingNearbyInvitationParticipant";
        case 131093:
          return "SharingAirDropAskToAirDrop";
        case 131094:
          return "SharingAirDropTempIdentity";
        case 131095:
          return "SharingAirDropNeedsCLink";
        case 131096:
          return "SharingRemoteWidgetUpdate";
        case 131097:
          return "SharingCountryCodeUpdate";
        case 131098:
          return "SharingMacPhoneAutoUnlock";
        case 131099:
          return "SharingVisionProDiscovery";
        case 131100:
          return "SharingVisionProStateChange";
        case 131101:
          return "SharingContinuityScreen";
        case 131102:
          return "SharingEDTRemoteDisplay";
        default:
          if (a1 == 196608)
          {
            unint64_t result = "DigitalIDTSA";
          }
          else
          {
            if (a1 != 0x40000) {
              return "?";
            }
            unint64_t result = "DigitalCarKeyThirdParty";
          }
          break;
      }
    }
  }
  else
  {
    unint64_t result = "Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        unint64_t result = "HealthKit";
        break;
      case 2:
        unint64_t result = "HomeKit";
        break;
      case 3:
        unint64_t result = "FindMyObjectConnection";
        break;
      case 4:
        unint64_t result = "FindMyObjectConnectionTransient";
        break;
      case 5:
        unint64_t result = "MIDI";
        break;
      case 6:
        unint64_t result = "Continuity";
        break;
      case 7:
        unint64_t result = "InstantHotSpot";
        break;
      case 8:
        unint64_t result = "NearBy";
        break;
      case 9:
        unint64_t result = "Sharing";
        break;
      case 10:
        unint64_t result = "HearingSupport";
        break;
      case 11:
        unint64_t result = "Magnet";
        break;
      case 12:
        unint64_t result = "HID";
        break;
      case 13:
        unint64_t result = "LEA";
        break;
      case 14:
        unint64_t result = "External";
        break;
      case 15:
        unint64_t result = "ExternalMedical";
        break;
      case 16:
        unint64_t result = "ExternalLock";
        break;
      case 17:
        unint64_t result = "ExternalWatch";
        break;
      case 18:
        unint64_t result = "SmartRouting";
        break;
      case 19:
        unint64_t result = "DigitalID";
        break;
      case 20:
        unint64_t result = "DigitalKey";
        break;
      case 21:
        unint64_t result = "DigitalCarKey";
        break;
      case 22:
        unint64_t result = "HeySiri";
        break;
      case 23:
        unint64_t result = "ThirdPartyApp";
        break;
      case 24:
        unint64_t result = "CNJ";
        break;
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 261:
      case 262:
        return "?";
      case 256:
        unint64_t result = "DevicePresenceDetection";
        break;
      case 257:
        unint64_t result = "AudioBox";
        break;
      case 258:
        unint64_t result = "SIMTransfer";
        break;
      case 259:
        unint64_t result = "ProximityScreenOnLeechScan";
        break;
      case 260:
        unint64_t result = "MacMigrate";
        break;
      case 263:
        unint64_t result = "HIDUARTService";
        break;
      case 264:
        unint64_t result = "AccessibilitySwitchControlPairing";
        break;
      case 265:
        unint64_t result = "BaseBandFastConnect";
        break;
      case 266:
        unint64_t result = "SafetyAlerts";
        break;
      case 267:
        unint64_t result = "LECarPlay";
        break;
      case 268:
        unint64_t result = "TCCBluetooth";
        break;
      case 269:
        unint64_t result = "AOPBufferLeech";
        break;
      default:
        switch(a1)
        {
          case 65536:
            unint64_t result = "FindMyAction";
            break;
          case 65537:
            unint64_t result = "FindMyBackground";
            break;
          case 65538:
            unint64_t result = "FindMyActionHELE";
            break;
          case 65539:
            unint64_t result = "FindMyBackgroundHELE";
            break;
          case 65540:
            unint64_t result = "FindMyActionTransient";
            break;
          case 65541:
            unint64_t result = "FindMyBackgroundTransient";
            break;
          case 65542:
            unint64_t result = "FindMyActionHELETransient";
            break;
          case 65543:
            unint64_t result = "FindMyBackgroundHELETransient";
            break;
          case 65544:
            unint64_t result = "FindMyNotOptedIn";
            break;
          case 65545:
            unint64_t result = "FindMyOptedIn";
            break;
          case 65546:
            unint64_t result = "FindMySepAlertsEnabled";
            break;
          case 65547:
            unint64_t result = "FindMyTemporaryAggressiveLegacy";
            break;
          case 65548:
            unint64_t result = "FindMyTemporaryLongAggressive";
            break;
          case 65549:
            unint64_t result = "FindMyBTFindingUserInitiated";
            break;
          case 65550:
            unint64_t result = "FindMyHELE";
            break;
          case 65551:
            unint64_t result = "FindMyBeaconOnDemand";
            break;
          case 65552:
            unint64_t result = "FindMyWildTimedScan";
            break;
          case 65553:
            unint64_t result = "FindMyBackgroundLeechScan";
            break;
          case 65554:
            unint64_t result = "FindMySnifferMode";
            break;
          case 65555:
            unint64_t result = "FindMyUnpair";
            break;
          case 65556:
            unint64_t result = "FindMyUnpairHELE";
            break;
          case 65557:
            unint64_t result = "FindMyPlaySound";
            break;
          case 65558:
            unint64_t result = "FindMyPlaySoundHELE";
            break;
          case 65559:
            unint64_t result = "FindMyNotOptedInBeepOnMoveWaking";
            break;
          case 65560:
            unint64_t result = "FindMyUTTransient";
            break;
          case 65561:
            unint64_t result = "FindMyUTHELETransient";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  return result;
}

void sub_1ABA5F22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA6081C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA60834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA60C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA61228(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA61698(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA616AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA6420C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA64220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA64234(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA6424C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA64D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA64EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1ABA6531C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA65330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA65344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA65358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA6536C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA65380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA65394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA653A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA653BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA653D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA653E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1ABA654E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1ABA669CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA669E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA669F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA66A08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA66A20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA66C30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA66FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1ABA66FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1ABA66FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1ABA66FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1ABA6700C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1ABA67020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1ABA67034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1ABA67048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1ABA67060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1ABA67180(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA674E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA674FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA67510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA67524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA67538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA6754C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA67560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA67574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA67588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA6759C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA675B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1ABA675C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

unsigned char *OUTLINED_FUNCTION_0_4(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_1_4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

const char *CBProductIDToString_0(int a1)
{
  if (a1 > 21759)
  {
    if (a1 <= 28943)
    {
      if (a1 > 28935)
      {
        if (a1 == 28936) {
          return "AppleTV6,2";
        }
        if (a1 == 28943) {
          return "AudioAccessory1,1";
        }
      }
      else
      {
        if (a1 == 21760) {
          return "Device1,21760";
        }
        if (a1 == 28420) {
          return "AppleTV5,3";
        }
      }
    }
    else if (a1 <= 29714)
    {
      if (a1 == 28944) {
        return "AudioAccessory1,2";
      }
      if (a1 == 29455) {
        return "AppleTV11,2";
      }
    }
    else
    {
      switch(a1)
      {
        case 29715:
          return "AudioAccessory5,1";
        case 65533:
          return "HeGn";
        case 65534:
          return "ApGn";
      }
    }
    return "?";
  }
  if (a1 <= 8193)
  {
    switch(a1)
    {
      case 0:
        return "Invalid";
      case 614:
        return "ATVRemote1,1";
      case 621:
        return "ATVRemote1,2";
    }
    return "?";
  }
  switch(a1)
  {
    case 8194:
      unint64_t result = "AirPods1,1";
      break;
    case 8195:
      unint64_t result = "PowerBeats3,1";
      break;
    case 8197:
      unint64_t result = "BeatsX1,1";
      break;
    case 8198:
      unint64_t result = "BeatsSolo3,1";
      break;
    case 8201:
      unint64_t result = "BeatsStudio3,2";
      break;
    case 8202:
      unint64_t result = "Device1,8202";
      break;
    case 8203:
      unint64_t result = "PowerbeatsPro1,1";
      break;
    case 8204:
      unint64_t result = "BeatsSoloPro1,1";
      break;
    case 8205:
      unint64_t result = "Powerbeats4,1";
      break;
    case 8206:
      unint64_t result = "AirPodsPro1,1";
      break;
    case 8207:
      unint64_t result = "AirPods1,3";
      break;
    case 8208:
      unint64_t result = "Device1,8208";
      break;
    case 8209:
      unint64_t result = "BeatsStudioBuds1,1";
      break;
    case 8210:
      unint64_t result = "Device1,8210";
      break;
    case 8211:
      unint64_t result = "Device1,8211";
      break;
    case 8212:
      unint64_t result = "Device1,8212";
      break;
    case 8213:
      unint64_t result = "Device1,8213";
      break;
    case 8214:
      unint64_t result = "BeatsStudioBuds1,2";
      break;
    case 8215:
      unint64_t result = "BeatsStudioPro1,1";
      break;
    case 8216:
      unint64_t result = "Device1,8216";
      break;
    case 8217:
      unint64_t result = "Device1,8217";
      break;
    case 8218:
      unint64_t result = "Device1,8218";
      break;
    case 8219:
      unint64_t result = "Device1,8219";
      break;
    case 8220:
      unint64_t result = "Device1,8220";
      break;
    case 8221:
      unint64_t result = "Device1,8221";
      break;
    case 8222:
      unint64_t result = "Device1,8222";
      break;
    case 8223:
      unint64_t result = "Device1,8223";
      break;
    case 8224:
      unint64_t result = "Device1,8224";
      break;
    case 8228:
      unint64_t result = "Device1,8228";
      break;
    case 8229:
      unint64_t result = "Device1,8229";
      break;
    case 8230:
      unint64_t result = "Device1,8230";
      break;
    default:
      return "?";
  }
  return result;
}

id CBProductIDToNSLocalizedProductNameString(uint64_t a1)
{
  if ((int)a1 > 776)
  {
    if ((int)a1 <= 8212)
    {
      switch((int)a1)
      {
        case 777:
          uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          id v2 = v1;
          uint64_t v3 = @"apple_wireless_mouse";
          goto LABEL_22;
        case 780:
          uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          id v2 = v1;
          uint64_t v3 = @"apple_mighty_mouse";
          goto LABEL_22;
        case 781:
        case 803:
LABEL_6:
          uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          id v2 = v1;
          uint64_t v3 = @"apple_magic_mouse";
          goto LABEL_22;
        case 782:
        case 804:
LABEL_11:
          uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          id v2 = v1;
          uint64_t v3 = @"apple_magic_trackpad";
          goto LABEL_22;
        case 800:
LABEL_12:
          uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          id v2 = v1;
          uint64_t v3 = @"apple_magic_keyboard";
          goto LABEL_22;
        case 801:
LABEL_13:
          uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          id v2 = v1;
          uint64_t v3 = @"apple_magic_keyboard_touch";
          goto LABEL_22;
        case 802:
LABEL_14:
          uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
          id v2 = v1;
          uint64_t v3 = @"apple_magic_keyboard_touch_keypad";
          goto LABEL_22;
        default:
          goto LABEL_26;
      }
    }
    if (a1 == 8220 || a1 == 8216 || a1 == 8213)
    {
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      id v2 = v1;
      uint64_t v3 = @"apple_airpods_case";
LABEL_22:
      uint64_t v6 = [v1 localizedStringForKey:v3 value:&stru_1F02E5F20 table:@"CBLocalizable"];
    }
    else
    {
LABEL_26:
      id v2 = +[CBProductInfo productInfoWithProductID:a1];
      uint64_t v6 = [v2 productName];
    }
    id v7 = (void *)v6;

    uint64_t v4 = v7;
  }
  else
  {
    switch((int)a1)
    {
      case 520:
      case 521:
      case 522:
      case 556:
      case 557:
      case 558:
      case 569:
      case 570:
      case 571:
      case 597:
      case 598:
      case 599:
        uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
        id v2 = v1;
        uint64_t v3 = @"apple_wireless_keyboard";
        goto LABEL_22;
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 600:
      case 601:
      case 602:
      case 603:
      case 604:
      case 605:
      case 606:
      case 607:
      case 608:
      case 609:
      case 610:
      case 611:
      case 612:
      case 614:
      case 616:
      case 618:
      case 619:
      case 621:
      case 622:
      case 623:
      case 624:
      case 625:
      case 626:
      case 627:
      case 628:
      case 629:
      case 630:
      case 631:
      case 632:
      case 633:
      case 634:
      case 635:
      case 636:
      case 637:
      case 638:
      case 639:
      case 640:
      case 641:
      case 642:
      case 643:
      case 644:
      case 645:
      case 646:
      case 647:
      case 648:
      case 649:
      case 650:
      case 651:
      case 652:
      case 653:
      case 654:
      case 655:
      case 656:
      case 657:
      case 658:
      case 659:
      case 660:
      case 661:
      case 662:
      case 663:
      case 664:
      case 665:
      case 667:
      case 669:
      case 670:
        goto LABEL_26;
      case 613:
        goto LABEL_11;
      case 615:
      case 668:
        goto LABEL_12;
      case 617:
        goto LABEL_6;
      case 620:
        uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
        id v2 = v1;
        uint64_t v3 = @"apple_magic_keyboard_keypad";
        goto LABEL_22;
      case 666:
        goto LABEL_13;
      case 671:
        goto LABEL_14;
      default:
        if (a1) {
          goto LABEL_26;
        }
        uint64_t v4 = 0;
        break;
    }
  }
  return v4;
}

void sub_1ABA6DA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA6DAC0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_1ABA74EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA74ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA75748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA75B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1ABA787B0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA7A3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

void sub_1ABA7E24C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA7F584(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA80510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose((const void *)(v12 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1ABA81414(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA81428(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA8150C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA82178(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1ABA82420(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CBXpcCreateNSObjectWithXpcObject_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1AB9F0000, v1, OS_LOG_TYPE_ERROR, "xpc_fd_dup failed: errno %d", (uint8_t *)v3, 8u);
}

void CBXpcCreateNSObjectWithXpcObject_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x1F4115EE8]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1F4115F08]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x1F4115F20]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

uint64_t CFGetInt64Ranged()
{
  return MEMORY[0x1F4115F90]();
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFStreamCreatePairWithSocket(CFAllocatorRef alloc, CFSocketNativeHandle sock, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1F40D89D0](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CUAppendF()
{
  return MEMORY[0x1F41160A0]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x1F41160A8]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x1F41160B8]();
}

uint64_t CUFatalErrorF()
{
  return MEMORY[0x1F41160D0]();
}

uint64_t CUPrintAddress()
{
  return MEMORY[0x1F4116110]();
}

uint64_t CUPrintDurationDouble()
{
  return MEMORY[0x1F4116128]();
}

uint64_t CUPrintErrorCode()
{
  return MEMORY[0x1F4116130]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x1F4116138]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x1F4116148]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x1F4116160]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x1F4116168]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x1F4116170]();
}

uint64_t CUPrintNSObjectMasked()
{
  return MEMORY[0x1F4116188]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x1F4116190]();
}

uint64_t CUPrintNSObjectOneLineEx()
{
  return MEMORY[0x1F4116198]();
}

uint64_t CUPrintText()
{
  return MEMORY[0x1F41161A8]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x1F41161B0]();
}

uint64_t CUXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F41161C0]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x1F41161C8]();
}

uint64_t CUXPCDecodeDouble()
{
  return MEMORY[0x1F41161D0]();
}

uint64_t CUXPCDecodeNSArrayOfClass()
{
  return MEMORY[0x1F41161D8]();
}

uint64_t CUXPCDecodeNSArrayOfNSData()
{
  return MEMORY[0x1F41161E0]();
}

uint64_t CUXPCDecodeNSArrayOfNSString()
{
  return MEMORY[0x1F41161E8]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x1F41161F0]();
}

uint64_t CUXPCDecodeNSDataOfLength()
{
  return MEMORY[0x1F41161F8]();
}

uint64_t CUXPCDecodeNSError()
{
  return MEMORY[0x1F4116200]();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return MEMORY[0x1F4116208]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x1F4116210]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x1F4116218]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x1F4116220]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x1F4116228]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x1F4116230]();
}

uint64_t CUXPCEncodeNSArrayOfNSData()
{
  return MEMORY[0x1F4116238]();
}

uint64_t CUXPCEncodeNSArrayOfNSString()
{
  return MEMORY[0x1F4116240]();
}

uint64_t CUXPCEncodeNSArrayOfObjects()
{
  return MEMORY[0x1F4116248]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x1F4116250]();
}

uint64_t CUXPCEncodeObject()
{
  return MEMORY[0x1F4116260]();
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x1F4116298]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x1F4116580]();
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x1F40E8750](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E87C0](device, key);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x1F40E8840](device, *(void *)&reportType, reportID, report, reportLength);
}

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1F40E8C48](manager, *(void *)&options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x1F40E8C60](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x1F40E8C70](allocator, *(void *)&options);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1F40E8C88](manager, *(void *)&options);
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED0](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F58](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9170](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9260](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9270](name);
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x1F4116598]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x1F41165F0]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x1F4116608]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x1F4116638]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x1F4116640]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1F41166D8]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x1F41166E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSDecodeNSDictionaryOfClassesIfPresent()
{
  return MEMORY[0x1F4116718]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x1F4116768]();
}

uint64_t NSErrorF_safe()
{
  return MEMORY[0x1F4116770]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x1F4116780]();
}

uint64_t NSPrintF_safe()
{
  return MEMORY[0x1F41167B8]();
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1F41168C8]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x1F41169F8]();
}

uint64_t SocketReadDataEx()
{
  return MEMORY[0x1F4116AC0]();
}

uint64_t SocketSetNonBlocking()
{
  return MEMORY[0x1F4116AE0]();
}

uint64_t SocketWriteData()
{
  return MEMORY[0x1F4116B08]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1F415CC10]();
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1F4116BA8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x1F4116C80]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t abort_with_payload()
{
  return MEMORY[0x1F40CA1F0]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1F40CA6A0]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x1F40CA6E0]();
}

uint64_t ccecb_context_size()
{
  return MEMORY[0x1F40CABB8]();
}

uint64_t ccecb_init()
{
  return MEMORY[0x1F40CABC0]();
}

uint64_t cclr_aes_init()
{
  return MEMORY[0x1F40CAF70]();
}

uint64_t cclr_decrypt_block()
{
  return MEMORY[0x1F40CAF78]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1F40CBBE0](queue, relative_priority_ptr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t dispatch_workloop_copy_current()
{
  return MEMORY[0x1F40CBD48]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

uint64_t os_channel_attr_create()
{
  return MEMORY[0x1F40CD188]();
}

uint64_t os_channel_attr_destroy()
{
  return MEMORY[0x1F40CD190]();
}

uint64_t os_channel_attr_set()
{
  return MEMORY[0x1F40CD1A0]();
}

uint64_t os_channel_create_extended()
{
  return MEMORY[0x1F40CD1C0]();
}

uint64_t os_channel_destroy()
{
  return MEMORY[0x1F40CD1C8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDCB8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40CDFC0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x1F40CDFF8](*(void *)&a1, *(void *)&a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1F415CC60]();
}

uint64_t tcc_credential_singleton_for_self()
{
  return MEMORY[0x1F415CCC0]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1F415CD28]();
}

uint64_t tcc_message_options_set_client_dict()
{
  return MEMORY[0x1F415CD30]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1F415CD48]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x1F415CD58]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1F415CD88]();
}

uint64_t tcc_server_message_request_authorization()
{
  return MEMORY[0x1F415CDB0]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1F415CDF0]();
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBC0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1F40CED30]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1F40CEFE8](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1F40CF0D0](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1F40CF360](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}