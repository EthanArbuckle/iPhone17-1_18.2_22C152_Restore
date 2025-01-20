@interface CECMessage
+ (id)abortFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)activeSourceFrom:(unsigned __int8)a3 physicalAddress:(unsigned __int16)a4;
+ (id)cecVersion:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)deckControlWithMode:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)deckStatusWithInfo:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)deviceVendorID:(unsigned int)a3 from:(unsigned __int8)a4;
+ (id)featureAbort:(unsigned __int8)a3 reason:(unsigned __int8)a4 from:(unsigned __int8)a5 to:(unsigned __int8)a6;
+ (id)getCECVersionFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)getMenuLanguageFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)giveAudioStatusFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)giveDeckStatusWithRequest:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)giveDevicePowerStatusFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)giveDeviceVendorIDFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)giveOSDNameFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)givePhysicalAddressFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)giveSystemAudioModeStatusFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)imageViewOnFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)inactiveSourceFrom:(unsigned __int8)a3 to:(unsigned __int8)a4 physicalAddress:(unsigned __int16)a5;
+ (id)initiateARCFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)menuStatus:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)messageWithFrame:(CECFrame *)a3;
+ (id)playWithMode:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)pollFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)reportAudioStatusWithVolume:(unint64_t)a3 mute:(BOOL)a4 from:(unsigned __int8)a5 to:(unsigned __int8)a6;
+ (id)reportFeaturesWith:(unsigned __int8)a3 deviceTypes:(unsigned __int8)a4 rcProfile:(id)a5 deviceFeatures:(unsigned __int8)a6 from:(unsigned __int8)a7;
+ (id)reportPhysicalAddress:(unsigned __int16)a3 deviceType:(unsigned __int8)a4 from:(unsigned __int8)a5;
+ (id)reportPowerStatus:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)reportShortAudioDescriptor:(char *)a3 length:(unsigned __int8)a4 from:(unsigned __int8)a5 to:(unsigned __int8)a6;
+ (id)requestActiveSourceFrom:(unsigned __int8)a3;
+ (id)routingChangeFrom:(unsigned __int8)a3 originalAddress:(unsigned __int16)a4 newAddress:(unsigned __int16)a5;
+ (id)routingInformationFrom:(unsigned __int8)a3 physicalAddress:(unsigned __int16)a4;
+ (id)setAudioVolumeLevel:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)setMenuLanguage:(CECLanguage)a3 from:(unsigned __int8)a4;
+ (id)setOSDName:(CECOSDName)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)setStreamPathFrom:(unsigned __int8)a3 physicalAddress:(unsigned __int16)a4;
+ (id)setSystemAudioMode:(BOOL)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)standbyFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)systemAudioModeRequestWithPhysicalAddress:(unsigned __int16)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)systemAudioModeStatus:(unint64_t)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)terminateARCFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)textViewOnFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
+ (id)userControlPressed:(CECUserControl)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5;
+ (id)userControlReleasedFrom:(unsigned __int8)a3 to:(unsigned __int8)a4;
- (BOOL)isBroadcast;
- (BOOL)loopback;
- (BOOL)parseActiveSourcePhysicalAddress:(unint64_t *)a3;
- (BOOL)parseCECVersion:(unsigned __int8 *)a3;
- (BOOL)parseDeckControlMode:(unint64_t *)a3;
- (BOOL)parseDeckStatusInfo:(unint64_t *)a3;
- (BOOL)parseDeviceVendorID:(unsigned int *)a3;
- (BOOL)parseFeatureAbortOpcode:(char *)a3 reason:(unsigned __int8 *)a4;
- (BOOL)parseGiveDeckStatusRequest:(unsigned __int8 *)a3;
- (BOOL)parseInactiveSourcePhysicalAddress:(unint64_t *)a3;
- (BOOL)parseMenuRequest:(unsigned __int8 *)a3;
- (BOOL)parsePlayMode:(unint64_t *)a3;
- (BOOL)parseReportAudioStatus:(unint64_t *)a3 muteStatus:(BOOL *)a4;
- (BOOL)parseReportFeatures:(unsigned __int8 *)a3 deviceTypes:(char *)a4 rcProfile:(id *)a5 features:(char *)a6;
- (BOOL)parseReportPhysicalAddress:(unint64_t *)a3 deviceType:(unint64_t *)a4;
- (BOOL)parseReportPowerStatus:(unint64_t *)a3;
- (BOOL)parseRoutingChangeOriginalAddress:(unint64_t *)a3 newAddress:(unint64_t *)a4;
- (BOOL)parseRoutingInformationPhysicalAddress:(unint64_t *)a3;
- (BOOL)parseSetMenuLanguage:(CECLanguage *)a3;
- (BOOL)parseSetOSDName:(id *)a3;
- (BOOL)parseSetStreamPathPhysicalAddress:(unint64_t *)a3;
- (BOOL)parseSystemAudioModeStatus:(unint64_t *)a3;
- (BOOL)parseUserControlPressed:(CECUserControl *)a3;
- (BOOL)shouldBeIgnored;
- (CECFrame)frame;
- (CECMessage)initWithFrame:(CECFrame *)a3;
- (const)_operandsWithLength:(unsigned __int8)a3;
- (double)nominalLatency;
- (id)debugDescription;
- (id)description;
- (int)messageType;
- (unsigned)_operandsLength;
- (unsigned)destination;
- (unsigned)initiator;
- (unsigned)length;
- (void)setLoopback:(BOOL)a3;
@end

@implementation CECMessage

- (CECMessage)initWithFrame:(CECFrame *)a3
{
  result = [(CECMessage *)self init];
  if (result)
  {
    if ((*((unsigned char *)a3 + 16) & 0x1Fu) - 17 < 0xFFFFFFF0)
    {

      return 0;
    }
    else
    {
      long long v5 = *(_OWORD *)a3->blocks;
      *((_DWORD *)&result->_frame + 4) = *((_DWORD *)a3 + 4);
      *(_OWORD *)result->_frame.blocks = v5;
    }
  }
  return result;
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)CECMessage;
  return (id)objc_msgSend(-[CECMessage description](&v3, sel_description), "stringByAppendingFormat:", @" %@;",
               [(CECMessage *)self description]);
}

- (id)description
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_new();
  v4 = new_printf_domain();
  if (v4)
  {
    long long v5 = v4;
    if (register_printf_domain_render_std(v4, "H"))
    {
LABEL_36:
      free_printf_domain(v5);
      return v3;
    }
    int v6 = [(CECMessage *)self messageType];
    v7 = (char *)CECMessageTypeString(v6);
    v8 = v7;
    if (v6 > 127)
    {
      switch(v6)
      {
        case 128:
          v9 = [(CECMessage *)self _operandsWithLength:4];
          if (!v9) {
            goto LABEL_38;
          }
          v10 = v9;
          CECPhysicalAddressStringWithAddress(bswap32(*(unsigned __int16 *)v9) >> 16);
          v11 = v34;
          __strlcpy_chk();
          __strlcat_chk();
          CECPhysicalAddressStringWithAddress(bswap32(*((unsigned __int16 *)v10 + 1)) >> 16);
          goto LABEL_19;
        case 129:
        case 130:
        case 134:
          goto LABEL_13;
        case 131:
        case 133:
        case 136:
        case 137:
        case 138:
        case 139:
        case 140:
        case 141:
        case 142:
        case 143:
          goto LABEL_15;
        case 132:
          v14 = [(CECMessage *)self _operandsWithLength:3];
          if (!v14) {
            goto LABEL_38;
          }
          v15 = v14;
          CECPhysicalAddressStringWithAddress(bswap32(*(unsigned __int16 *)v14) >> 16);
          v11 = v34;
          __strlcpy_chk();
          __strlcat_chk();
          CECDeviceTypeString(*((unsigned __int8 *)v15 + 2));
LABEL_19:
          __strlcat_chk();
          goto LABEL_35;
        case 135:
          v16 = [(CECMessage *)self _operandsWithLength:3];
          if (!v16) {
            goto LABEL_38;
          }
          CECVendorIDStringWithID((*(unsigned __int8 *)v16 << 16) | (*((unsigned __int8 *)v16 + 1) << 8) | *((unsigned __int8 *)v16 + 2));
          v11 = v34;
          goto LABEL_22;
        case 144:
          v17 = [(CECMessage *)self _operandsWithLength:1];
          if (!v17) {
            goto LABEL_38;
          }
          v18 = v17;
          v19 = CECPowerStatusString(*(unsigned __int8 *)v17);
          v11 = (char *)v19;
          v20 = kCECPowerStatusStringUnknown;
          goto LABEL_30;
        default:
          if (v6 == 158)
          {
            v23 = [(CECMessage *)self _operandsWithLength:1];
            if (!v23) {
              goto LABEL_38;
            }
            v18 = v23;
            v19 = CECVersionString(*(unsigned __int8 *)v23);
            v11 = (char *)v19;
            v20 = kCECVersionStringUnknown;
LABEL_30:
            if (v19 == *v20)
            {
              v28 = v18;
              uint64_t v30 = [(CECMessage *)self _operandsLength];
              v24 = "Other %H";
              goto LABEL_34;
            }
            if (v11) {
              goto LABEL_35;
            }
            goto LABEL_32;
          }
          if (v6 != 157) {
            goto LABEL_15;
          }
LABEL_13:
          v13 = [(CECMessage *)self _operandsWithLength:2];
          if (v13)
          {
            CECPhysicalAddressStringWithAddress(bswap32(*(unsigned __int16 *)v13) >> 16);
            v11 = v34;
LABEL_22:
            __strlcpy_chk();
            goto LABEL_35;
          }
          break;
      }
      goto LABEL_38;
    }
    if (v6)
    {
      if (v6 != 50 && v6 != 71)
      {
LABEL_15:
        if (v7 == "Unknown")
        {
          v8 = __str;
          snprintf(__str, 0x20uLL, "<<? 0x%02X>>", v6);
        }
LABEL_32:
        v28 = [(CECMessage *)self _operandsWithLength:0];
        uint64_t v30 = [(CECMessage *)self _operandsLength];
        v24 = "%H";
LABEL_34:
        v11 = v34;
        sxprintf(v34, 0x50uLL, v5, 0, v24, v28, v30);
        goto LABEL_35;
      }
      v27 = (const char *)[(CECMessage *)self _operandsLength];
      v29 = [(CECMessage *)self _operandsWithLength:0];
      v12 = "'%.*s'";
    }
    else
    {
      v21 = [(CECMessage *)self _operandsWithLength:2];
      if (!v21)
      {
LABEL_38:
        sxprintf(v34, 0x50uLL, v5, 0, "malformed frame: <%H>\n", &self->_frame, *((unsigned char *)&self->_frame + 16) & 0x1F);
        objc_msgSend(v3, "appendFormat:", @" %s", v34, v31, v32, v33);
        goto LABEL_36;
      }
      v22 = v21;
      v27 = CECMessageTypeString(*(unsigned __int8 *)v21);
      v29 = CECAbortReasonString(*((unsigned __int8 *)v22 + 1));
      v12 = "[%s] [%s]";
    }
    v11 = v34;
    snprintf(v34, 0x50uLL, v12, v27, v29);
LABEL_35:
    v25 = CECAddressString([(CECMessage *)self initiator], 1);
    objc_msgSend(v3, "appendFormat:", @"%s -> %s: %s %s", v25, CECAddressString(-[CECMessage destination](self, "destination"), 0), v8, v11);
    goto LABEL_36;
  }
  return v3;
}

- (unsigned)initiator
{
  return self->_frame.blocks[0] >> 4;
}

- (unsigned)destination
{
  return self->_frame.blocks[0] & 0xF;
}

- (int)messageType
{
  if ((*((unsigned char *)&self->_frame + 16) & 0x1E) != 0) {
    return self->_frame.blocks[1];
  }
  else {
    return -1;
  }
}

- (unsigned)length
{
  return *((unsigned char *)&self->_frame + 16) & 0x1F;
}

- (unsigned)_operandsLength
{
  unsigned int v2 = *((unsigned char *)&self->_frame + 16) & 0x1F;
  BOOL v3 = v2 >= 2;
  unsigned __int8 v4 = v2 - 2;
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

- (const)_operandsWithLength:(unsigned __int8)a3
{
  if (a3 + 2 <= (*((unsigned char *)&self->_frame + 16) & 0x1Fu)) {
    return (const char *)&self->_frame.blocks[2];
  }
  else {
    return 0;
  }
}

- (double)nominalLatency
{
  return (double)(24000 * [(CECMessage *)self length] + 16500) / 1000000.0;
}

- (BOOL)shouldBeIgnored
{
  int v3 = [(CECMessage *)self messageType];
  int v4 = [(CECMessage *)self destination];
  int v5 = [(CECMessage *)self initiator];
  if (v4 == 15)
  {
    if (v3 <= 113)
    {
      if (v3 != 50 && v3 != 54) {
        goto LABEL_21;
      }
    }
    else if (((v3 - 114) > 0x34 || ((1 << (v3 - 114)) & 0x104000433DC001) == 0) {
           && v3 != 248)
    }
    {
      goto LABEL_21;
    }
  }
  else
  {
    if (v3 > 102)
    {
      switch(v3)
      {
        case 103:
        case 112:
        case 113:
        case 114:
        case 115:
        case 122:
        case 125:
        case 126:
        case 131:
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
        case 151:
        case 153:
        case 154:
        case 157:
        case 158:
        case 159:
        case 160:
        case 161:
        case 162:
        case 163:
        case 164:
        case 165:
        case 192:
        case 193:
        case 194:
        case 195:
        case 196:
        case 197:
          goto LABEL_16;
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 123:
        case 124:
        case 127:
        case 128:
        case 129:
        case 130:
        case 132:
        case 133:
        case 134:
        case 135:
        case 136:
        case 148:
        case 149:
        case 150:
        case 152:
        case 155:
        case 156:
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
          goto LABEL_21;
        default:
          if (v3 != 255) {
            goto LABEL_21;
          }
          goto LABEL_16;
      }
    }
    if (((v3 + 1) > 0x37 || ((1 << (v3 + 1)) & 0xF0000018015FE3) == 0)
      && ((v3 - 65) > 0x23 || ((1 << (v3 - 65)) & 0x80000007FLL) == 0))
    {
      goto LABEL_21;
    }
  }
LABEL_16:
  if (v5 != 15)
  {
    if (v3 == 50)
    {
      if (!v5) {
        return v5;
      }
    }
    else if (v3 != 255 || v4 != 15)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    goto LABEL_21;
  }
  LOBYTE(v5) = 0;
  if (((v3 - 128) > 0x11 || ((1 << (v3 + 0x80)) & 0x2103F) == 0) && v3 != 54 && v3 != 248) {
LABEL_21:
  }
    LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)isBroadcast
{
  return [(CECMessage *)self destination] == 15;
}

- (CECFrame)frame
{
  *retstr = *(CECFrame *)((char *)self + 8);
  return self;
}

- (BOOL)parseActiveSourcePhysicalAddress:(unint64_t *)a3
{
  if ([(CECMessage *)self messageType] != 130 || (*((unsigned char *)&self->_frame + 16) & 0x1C) == 0) {
    goto LABEL_9;
  }
  unint64_t v7 = 0;
  BOOL v5 = CoreCECPhysicalAddressForPackedPhysicalAddress(&v7, bswap32(*(unsigned __int16 *)&self->_frame.blocks[2]) >> 16);
  if (!v5) {
    return v5;
  }
  if (v7 != 252645135)
  {
    if (a3) {
      *a3 = v7;
    }
    LOBYTE(v5) = 1;
  }
  else
  {
LABEL_9:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)parseInactiveSourcePhysicalAddress:(unint64_t *)a3
{
  if ([(CECMessage *)self messageType] != 157 || (*((unsigned char *)&self->_frame + 16) & 0x1C) == 0) {
    goto LABEL_9;
  }
  unint64_t v7 = 0;
  BOOL v5 = CoreCECPhysicalAddressForPackedPhysicalAddress(&v7, bswap32(*(unsigned __int16 *)&self->_frame.blocks[2]) >> 16);
  if (!v5) {
    return v5;
  }
  if (v7 != 252645135)
  {
    if (a3) {
      *a3 = v7;
    }
    LOBYTE(v5) = 1;
  }
  else
  {
LABEL_9:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)parseRoutingChangeOriginalAddress:(unint64_t *)a3 newAddress:(unint64_t *)a4
{
  if ([(CECMessage *)self messageType] != 128 || (*((unsigned char *)&self->_frame + 16) & 0x1Eu) < 6) {
    goto LABEL_14;
  }
  unint64_t v13 = 0;
  BOOL v7 = CoreCECPhysicalAddressForPackedPhysicalAddress(&v13, bswap32(*(unsigned __int16 *)&self->_frame.blocks[2]) >> 16);
  if (!v7) {
    return v7;
  }
  unint64_t v12 = 0;
  BOOL v8 = CoreCECPhysicalAddressForPackedPhysicalAddress(&v12, bswap32(*(unsigned __int16 *)&self->_frame.blocks[4]) >> 16);
  unint64_t v9 = v12;
  if (!v8 || v12 == 252645135)
  {
LABEL_14:
    LOBYTE(v7) = 0;
  }
  else
  {
    if (a3) {
      *a3 = v13;
    }
    if (a4) {
      *a4 = v9;
    }
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)parseRoutingInformationPhysicalAddress:(unint64_t *)a3
{
  if ([(CECMessage *)self messageType] != 129 || (*((unsigned char *)&self->_frame + 16) & 0x1C) == 0) {
    goto LABEL_9;
  }
  unint64_t v7 = 0;
  BOOL v5 = CoreCECPhysicalAddressForPackedPhysicalAddress(&v7, bswap32(*(unsigned __int16 *)&self->_frame.blocks[2]) >> 16);
  if (!v5) {
    return v5;
  }
  if (v7 != 252645135)
  {
    if (a3) {
      *a3 = v7;
    }
    LOBYTE(v5) = 1;
  }
  else
  {
LABEL_9:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)parseSetStreamPathPhysicalAddress:(unint64_t *)a3
{
  if ([(CECMessage *)self messageType] != 134 || (*((unsigned char *)&self->_frame + 16) & 0x1C) == 0) {
    goto LABEL_9;
  }
  unint64_t v7 = 0;
  BOOL v5 = CoreCECPhysicalAddressForPackedPhysicalAddress(&v7, bswap32(*(unsigned __int16 *)&self->_frame.blocks[2]) >> 16);
  if (!v5) {
    return v5;
  }
  if (v7 != 252645135)
  {
    if (a3) {
      *a3 = v7;
    }
    LOBYTE(v5) = 1;
  }
  else
  {
LABEL_9:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)parseCECVersion:(unsigned __int8 *)a3
{
  if ([(CECMessage *)self messageType] != 158 || (*((unsigned char *)&self->_frame + 16) & 0x1Fu) < 3) {
    return 0;
  }
  if (a3) {
    *a3 = self->_frame.blocks[2];
  }
  return 1;
}

- (BOOL)parseReportPhysicalAddress:(unint64_t *)a3 deviceType:(unint64_t *)a4
{
  if ([(CECMessage *)self messageType] != 132
    || (*((unsigned char *)&self->_frame + 16) & 0x1Fu) < 5
    || ((unint64_t v11 = 0,
         CoreCECPhysicalAddressForPackedPhysicalAddress(&v11, bswap32(*(unsigned __int16 *)&self->_frame.blocks[2]) >> 16))? (BOOL v7 = v11 == 252645135): (BOOL v7 = 1), v7))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    unint64_t v10 = 0;
    BOOL v8 = CoreCECDeviceTypeForCECDeviceType(&v10, self->_frame.blocks[4]);
    if (v8)
    {
      if (a3) {
        *a3 = v11;
      }
      if (a4) {
        *a4 = v10;
      }
      LOBYTE(v8) = 1;
    }
  }
  return v8;
}

- (BOOL)parseSetMenuLanguage:(CECLanguage *)a3
{
  if ([(CECMessage *)self messageType] != 50 || (*((unsigned char *)&self->_frame + 16) & 0x1Fu) < 5) {
    return 0;
  }
  if (a3)
  {
    __int16 v5 = *(_WORD *)&self->_frame.blocks[2];
    a3->characters[2] = self->_frame.blocks[4];
    *(_WORD *)a3->characters = v5;
  }
  return 1;
}

- (BOOL)parseDeckControlMode:(unint64_t *)a3
{
  if ([(CECMessage *)self messageType] == 66 && (*((unsigned char *)&self->_frame + 16) & 0x1Fu) >= 3)
  {
    unint64_t v7 = 0;
    BOOL v5 = CoreCECDeckControlModeForCECDeckControlMode(&v7, self->_frame.blocks[2]);
    if (v5)
    {
      if (a3) {
        *a3 = v7;
      }
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)parseDeckStatusInfo:(unint64_t *)a3
{
  if ([(CECMessage *)self messageType] == 27 && (*((unsigned char *)&self->_frame + 16) & 0x1Fu) >= 3)
  {
    unint64_t v7 = 0;
    BOOL v5 = CoreCECDeckInfoForCECDeckInfo(&v7, self->_frame.blocks[2]);
    if (v5)
    {
      if (a3) {
        *a3 = v7;
      }
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)parseGiveDeckStatusRequest:(unsigned __int8 *)a3
{
  if ([(CECMessage *)self messageType] != 26 || (*((unsigned char *)&self->_frame + 16) & 0x1Fu) < 3) {
    return 0;
  }
  if (a3) {
    *a3 = self->_frame.blocks[2];
  }
  return 1;
}

- (BOOL)parsePlayMode:(unint64_t *)a3
{
  if ([(CECMessage *)self messageType] == 65 && (*((unsigned char *)&self->_frame + 16) & 0x1Fu) >= 3)
  {
    unint64_t v7 = 0;
    int v5 = CoreCECPlayModeForCECPlayMode(&v7, self->_frame.blocks[2]);
    if (v5)
    {
      if (a3) {
        *a3 = v7;
      }
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)parseDeviceVendorID:(unsigned int *)a3
{
  if ([(CECMessage *)self messageType] != 135 || (*((unsigned char *)&self->_frame + 16) & 0x1Fu) < 5) {
    return 0;
  }
  if (a3) {
    *a3 = (self->_frame.blocks[2] << 16) | (self->_frame.blocks[3] << 8) | self->_frame.blocks[4];
  }
  return 1;
}

- (BOOL)parseReportAudioStatus:(unint64_t *)a3 muteStatus:(BOOL *)a4
{
  if ([(CECMessage *)self messageType] != 122 || (*((unsigned char *)&self->_frame + 16) & 0x1Fu) < 3) {
    return 0;
  }
  if (a3) {
    *a3 = self->_frame.blocks[2] & 0x7F;
  }
  if (a4) {
    *a4 = self->_frame.blocks[2] >> 7;
  }
  return 1;
}

- (BOOL)parseSetOSDName:(id *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, sizeof(v9));
  if ([(CECMessage *)self messageType] != 71) {
    return 0;
  }
  unsigned int v5 = *((unsigned char *)&self->_frame + 16) & 0x1F;
  if (v5 < 3) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  unsigned __int8 v8 = v5 - 2;
  __memcpy_chk();
  BOOL v6 = 1;
  *a3 = (id)[[NSString alloc] initWithBytes:v9 length:v8 encoding:1];
  return v6;
}

- (BOOL)parseMenuRequest:(unsigned __int8 *)a3
{
  if ([(CECMessage *)self messageType] != 141 || (*((unsigned char *)&self->_frame + 16) & 0x1Fu) < 3) {
    return 0;
  }
  if (a3) {
    *a3 = self->_frame.blocks[2];
  }
  return 1;
}

- (BOOL)parseUserControlPressed:(CECUserControl *)a3
{
  if ([(CECMessage *)self messageType] != 68) {
    return 0;
  }
  unsigned int v5 = *((unsigned char *)&self->_frame + 16) & 0x1F;
  if (v5 < 3) {
    return 0;
  }
  unsigned __int8 v6 = 0;
  int v7 = self->_frame.blocks[2];
  unsigned int v8 = 0;
  switch(self->_frame.blocks[2])
  {
    case 'h':
    case 'i':
    case 'j':
      goto LABEL_4;
    case 'a':
    case 'b':
    case 'c':
    case 'd':
    case 'e':
    case 'f':
      goto LABEL_6;
    case 'g':
      if (v5 < 7) {
        return 0;
      }
      int v10 = self->_frame.blocks[3];
      HIDWORD(v11) = self->_frame.blocks[4];
      LODWORD(v11) = v10 << 24;
      unsigned __int8 v6 = v11 >> 26;
      unsigned int v8 = ((self->_frame.blocks[5] << 24) | (self->_frame.blocks[6] << 16) | (unsigned __int16)(((_WORD)v10 << 14) | (self->_frame.blocks[4] << 6))) >> 8;
      goto LABEL_6;
    default:
      if (v7 != 86)
      {
        unsigned int v8 = 0;
        if (v7 != 87) {
          goto LABEL_6;
        }
      }
LABEL_4:
      if (v5 < 4) {
        return 0;
      }
      unsigned int v8 = 0;
      unsigned __int8 v6 = self->_frame.blocks[3];
LABEL_6:
      if (a3)
      {
        a3->command = v7;
        a3->operand.playMode = v6;
        *(_WORD *)((char *)&a3->operand.channelIdentifier + 1) = v8;
        *(&a3->operand.broadcastType + 3) = BYTE2(v8);
      }
      BOOL result = 1;
      break;
  }
  return result;
}

- (BOOL)parseReportPowerStatus:(unint64_t *)a3
{
  if ([(CECMessage *)self messageType] == 144 && (*((unsigned char *)&self->_frame + 16) & 0x1Fu) >= 3)
  {
    unint64_t v7 = 0;
    BOOL v5 = CoreCECPowerStatusForCECPowerStatus(&v7, self->_frame.blocks[2]);
    if (v5)
    {
      if (a3) {
        *a3 = v7;
      }
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)parseSystemAudioModeStatus:(unint64_t *)a3
{
  if (([(CECMessage *)self messageType] == 126 || [(CECMessage *)self messageType] == 114)
    && (*((unsigned char *)&self->_frame + 16) & 0x1Fu) >= 3)
  {
    unint64_t v7 = 0;
    int v5 = CoreCECSystemAudioModeStatusForCECSystemAudioModeStatus((uint64_t *)&v7, self->_frame.blocks[2]);
    if (v5)
    {
      if (a3) {
        *a3 = v7;
      }
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)parseFeatureAbortOpcode:(char *)a3 reason:(unsigned __int8 *)a4
{
  if ([(CECMessage *)self messageType] || (*((unsigned char *)&self->_frame + 16) & 0x1C) == 0) {
    return 0;
  }
  if (a3) {
    *a3 = self->_frame.blocks[2];
  }
  if (a4) {
    *a4 = self->_frame.blocks[3];
  }
  return 1;
}

- (BOOL)parseReportFeatures:(unsigned __int8 *)a3 deviceTypes:(char *)a4 rcProfile:(id *)a5 features:(char *)a6
{
  if ([(CECMessage *)self messageType] == 166 && (*((unsigned char *)&self->_frame + 16) & 0x1Eu) >= 6)
  {
    *a3 = self->_frame.blocks[2];
    *a4 = self->_frame.blocks[3];
    unsigned __int8 v11 = self->_frame.blocks[4];
    a5->var0 = (v11 & 0x40) != 0;
    if ((v11 & 0x40) != 0) {
      char v12 = 63;
    }
    else {
      char v12 = 15;
    }
    a5->var1.var0 = self->_frame.blocks[4] & v12;
    uint64_t v13 = *((unsigned char *)&self->_frame + 16) & 0x1F;
    if (v13 < 5)
    {
      LODWORD(v13) = 4;
LABEL_14:
      *a6 = self->_frame.blocks[v13 + 1];
      return 1;
    }
    uint64_t v14 = 0;
    while ((char)self->_frame.blocks[v14 + 4] < 0)
    {
      if (v13 - 4 == ++v14) {
        goto LABEL_13;
      }
    }
    LODWORD(v13) = v14 + 4;
LABEL_13:
    if (v13 <= 0xE) {
      goto LABEL_14;
    }
  }
  return 0;
}

+ (id)messageWithFrame:(CECFrame *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = [CECMessage alloc];
  CECFrame v6 = *a3;
  return [(CECMessage *)v4 initWithFrame:&v6];
}

+ (id)activeSourceFrom:(unsigned __int8)a3 physicalAddress:(unsigned __int16)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v10 = 0;
  __int16 v9 = 0;
  v5[0] = (16 * a3) | 0xF;
  v5[1] = -126;
  v5[2] = HIBYTE(a4);
  v5[3] = a4;
  uint64_t v6 = 0;
  int v7 = 0;
  char v8 = 4;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)imageViewOnFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = a4 | (16 * a3);
  v5[1] = 4;
  memset(&v5[2], 0, 14);
  v5[16] = 2;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)textViewOnFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = a4 | (16 * a3);
  v5[1] = 13;
  memset(&v5[2], 0, 14);
  v5[16] = 2;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)inactiveSourceFrom:(unsigned __int8)a3 to:(unsigned __int8)a4 physicalAddress:(unsigned __int16)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v11 = 0;
  __int16 v10 = 0;
  v6[0] = a4 | (16 * a3);
  v6[1] = -99;
  v6[2] = HIBYTE(a5);
  v6[3] = a5;
  uint64_t v7 = 0;
  int v8 = 0;
  char v9 = 4;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)requestActiveSourceFrom:(unsigned __int8)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v6 = 0;
  __int16 v5 = 0;
  v4[0] = (16 * a3) | 0xF;
  v4[1] = -123;
  memset(&v4[2], 0, 14);
  v4[16] = 2;
  return +[CECMessage messageWithFrame:v4];
}

+ (id)routingChangeFrom:(unsigned __int8)a3 originalAddress:(unsigned __int16)a4 newAddress:(unsigned __int16)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v11 = 0;
  __int16 v10 = 0;
  v6[0] = (16 * a3) | 0xF;
  v6[1] = 0x80;
  v6[2] = HIBYTE(a4);
  v6[3] = a4;
  unsigned char v6[4] = HIBYTE(a5);
  v6[5] = a5;
  uint64_t v7 = 0;
  __int16 v8 = 0;
  char v9 = 6;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)routingInformationFrom:(unsigned __int8)a3 physicalAddress:(unsigned __int16)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v10 = 0;
  __int16 v9 = 0;
  v5[0] = (16 * a3) | 0xF;
  v5[1] = -127;
  v5[2] = HIBYTE(a4);
  v5[3] = a4;
  uint64_t v6 = 0;
  int v7 = 0;
  char v8 = 4;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)setStreamPathFrom:(unsigned __int8)a3 physicalAddress:(unsigned __int16)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v10 = 0;
  __int16 v9 = 0;
  v5[0] = (16 * a3) | 0xF;
  v5[1] = -122;
  v5[2] = HIBYTE(a4);
  v5[3] = a4;
  uint64_t v6 = 0;
  int v7 = 0;
  char v8 = 4;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)standbyFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v12 = 0;
  __int16 v11 = 0;
  char v5 = a4 | (16 * a3);
  strcpy(v6, "6");
  v6[2] = 0;
  __int16 v7 = 0;
  __int16 v8 = 0;
  uint64_t v9 = 0;
  char v10 = 2;
  return +[CECMessage messageWithFrame:&v5];
}

+ (id)cecVersion:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = a5 | (16 * a4);
  v6[1] = -98;
  v6[2] = a3;
  memset(&v6[3], 0, 13);
  v6[16] = 3;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)getCECVersionFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = a4 | (16 * a3);
  v5[1] = -97;
  memset(&v5[2], 0, 14);
  v5[16] = 2;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)givePhysicalAddressFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = a4 | (16 * a3);
  v5[1] = -125;
  memset(&v5[2], 0, 14);
  v5[16] = 2;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)getMenuLanguageFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = a4 | (16 * a3);
  v5[1] = -111;
  memset(&v5[2], 0, 14);
  v5[16] = 2;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)pollFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = a4 | (16 * a3);
  memset(&v5[1], 0, 15);
  v5[16] = 1;
  __int16 v6 = 0;
  char v7 = 0;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)reportPhysicalAddress:(unsigned __int16)a3 deviceType:(unsigned __int8)a4 from:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = (16 * a5) | 0xF;
  v6[1] = -124;
  v6[2] = HIBYTE(a3);
  char v6[3] = a3;
  unsigned char v6[4] = a4;
  memset(&v6[5], 0, 11);
  v6[16] = 5;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)setMenuLanguage:(CECLanguage)a3 from:(unsigned __int8)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v9 = 0;
  __int16 v8 = 0;
  v5[0] = (16 * a4) | 0xF;
  v5[1] = 50;
  CECLanguage v6 = a3;
  memset(v7, 0, 11);
  v7[11] = 5;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)reportFeaturesWith:(unsigned __int8)a3 deviceTypes:(unsigned __int8)a4 rcProfile:(id)a5 deviceFeatures:(unsigned __int8)a6 from:(unsigned __int8)a7
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v13 = 0;
  __int16 v12 = 0;
  v8[0] = (16 * a7) | 0xF;
  v8[1] = -90;
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = (a5.var0 << 6) | a5.var1.var0;
  v8[5] = a6;
  uint64_t v9 = 0;
  __int16 v10 = 0;
  char v11 = 6;
  return +[CECMessage messageWithFrame:v8];
}

+ (id)deckControlWithMode:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = a5 | (16 * a4);
  v6[1] = 66;
  v6[2] = a3;
  memset(&v6[3], 0, 13);
  v6[16] = 3;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)deckStatusWithInfo:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = a5 | (16 * a4);
  v6[1] = 27;
  v6[2] = a3;
  memset(&v6[3], 0, 13);
  v6[16] = 3;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)giveDeckStatusWithRequest:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = a5 | (16 * a4);
  v6[1] = 26;
  v6[2] = a3;
  memset(&v6[3], 0, 13);
  v6[16] = 3;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)playWithMode:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = a5 | (16 * a4);
  v6[1] = 65;
  v6[2] = a3;
  memset(&v6[3], 0, 13);
  v6[16] = 3;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)deviceVendorID:(unsigned int)a3 from:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = (16 * a4) | 0xF;
  v5[1] = -121;
  unsigned char v5[2] = BYTE2(a3);
  v5[3] = BYTE1(a3);
  unsigned char v5[4] = a3;
  memset(&v5[5], 0, 11);
  v5[16] = 5;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)giveDeviceVendorIDFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = a4 | (16 * a3);
  v5[1] = -116;
  memset(&v5[2], 0, 14);
  v5[16] = 2;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)giveOSDNameFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v12 = 0;
  __int16 v11 = 0;
  char v5 = a4 | (16 * a3);
  strcpy(v6, "F");
  v6[2] = 0;
  __int16 v7 = 0;
  __int16 v8 = 0;
  uint64_t v9 = 0;
  char v10 = 2;
  return +[CECMessage messageWithFrame:&v5];
}

+ (id)setOSDName:(CECOSDName)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  unsigned __int8 length = a3.length;
  uint64_t v12 = *MEMORY[0x263EF8340];
  CECOSDName v11 = a3;
  LOBYTE(v9) = a5 | (16 * a4);
  *(_WORD *)((char *)&v9 + 1) = 16199;
  *(void *)((char *)&v9 + 3) = 0;
  *((void *)&v9 + 1) = 0;
  int v10 = 3;
  if (a3.length)
  {
    __memcpy_chk();
    LOBYTE(v10) = v10 & 0xE0 | (length + 2) & 0x1F;
  }
  long long v7 = v9;
  int v8 = v10;
  return +[CECMessage messageWithFrame:&v7];
}

+ (id)menuStatus:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = a5 | (16 * a4);
  v6[1] = -114;
  v6[2] = a3;
  memset(&v6[3], 0, 13);
  v6[16] = 3;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)userControlPressed:(CECUserControl)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v5 = 3;
  LOBYTE(v6) = 0;
  LOBYTE(v7) = 0;
  char v8 = 0;
  char v9 = 0;
  switch(a3.command)
  {
    case 'h':
    case 'i':
    case 'j':
      LOBYTE(v7) = 0;
      char v8 = 0;
      char v9 = 0;
      char v5 = 4;
      LOBYTE(v6) = a3.operand.playMode;
      break;
    case 'a':
    case 'b':
    case 'c':
    case 'd':
    case 'e':
    case 'f':
      break;
    case 'g':
      int v6 = (*(unint64_t *)&a3 >> 46) & 3 | (4 * *(_DWORD *)&a3.operand.channelIdentifier);
      unint64_t v7 = *(unint64_t *)&a3 >> 38;
      char v8 = *(&a3.operand.broadcastType + 3);
      char v5 = 7;
      char v9 = *(&a3.operand.playMode + 2);
      break;
    default:
      char v5 = 3;
      LOBYTE(v6) = 0;
      LOBYTE(v7) = 0;
      char v8 = 0;
      char v9 = 0;
      break;
  }
  v11[0] = a5 | (16 * a4);
  v11[1] = 68;
  v11[2] = a3.command;
  v11[3] = v6;
  v11[4] = v7;
  v11[5] = v8;
  v11[6] = v9;
  uint64_t v12 = 0;
  char v13 = 0;
  char v14 = v5;
  __int16 v15 = 0;
  char v16 = 0;
  return +[CECMessage messageWithFrame:v11];
}

+ (id)userControlReleasedFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v12 = 0;
  __int16 v11 = 0;
  char v5 = a4 | (16 * a3);
  strcpy(v6, "E");
  v6[2] = 0;
  __int16 v7 = 0;
  __int16 v8 = 0;
  uint64_t v9 = 0;
  char v10 = 2;
  return +[CECMessage messageWithFrame:&v5];
}

+ (id)giveDevicePowerStatusFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = a4 | (16 * a3);
  v5[1] = -113;
  memset(&v5[2], 0, 14);
  v5[16] = 2;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)reportPowerStatus:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = a5 | (16 * a4);
  v6[1] = -112;
  v6[2] = a3;
  memset(&v6[3], 0, 13);
  v6[16] = 3;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)featureAbort:(unsigned __int8)a3 reason:(unsigned __int8)a4 from:(unsigned __int8)a5 to:(unsigned __int8)a6
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v12 = 0;
  __int16 v11 = 0;
  v7[0] = a6 | (16 * a5);
  v7[1] = 0;
  v7[2] = a3;
  v7[3] = a4;
  uint64_t v8 = 0;
  int v9 = 0;
  char v10 = 4;
  return +[CECMessage messageWithFrame:v7];
}

+ (id)abortFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = a4 | (16 * a3);
  v5[1] = -1;
  memset(&v5[2], 0, 14);
  v5[16] = 2;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)giveAudioStatusFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v12 = 0;
  __int16 v11 = 0;
  char v5 = a4 | (16 * a3);
  strcpy(v6, "q");
  v6[2] = 0;
  __int16 v7 = 0;
  __int16 v8 = 0;
  uint64_t v9 = 0;
  char v10 = 2;
  return +[CECMessage messageWithFrame:&v5];
}

+ (id)giveSystemAudioModeStatusFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v12 = 0;
  __int16 v11 = 0;
  char v5 = a4 | (16 * a3);
  strcpy(v6, "}");
  v6[2] = 0;
  __int16 v7 = 0;
  __int16 v8 = 0;
  uint64_t v9 = 0;
  char v10 = 2;
  return +[CECMessage messageWithFrame:&v5];
}

+ (id)setSystemAudioMode:(BOOL)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = a5 | (16 * a4);
  v6[1] = 114;
  v6[2] = a3;
  memset(&v6[3], 0, 13);
  v6[16] = 3;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)systemAudioModeRequestWithPhysicalAddress:(unsigned __int16)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v10 = 0;
  __int16 v9 = 0;
  LOBYTE(v7[0]) = a5 | (16 * a4);
  BYTE1(v7[0]) = 112;
  if (a3 == 0xFFFF)
  {
    memset((char *)v7 + 2, 0, 14);
    char v5 = 2;
  }
  else
  {
    BYTE2(v7[0]) = HIBYTE(a3);
    HIBYTE(v7[0]) = a3;
    *(void *)&v7[1] = 0;
    v7[3] = 0;
    char v5 = 4;
  }
  char v8 = v5;
  return +[CECMessage messageWithFrame:v7];
}

+ (id)systemAudioModeStatus:(unint64_t)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = a5 | (16 * a4);
  v6[1] = 126;
  v6[2] = a3 == 2;
  memset(&v6[3], 0, 13);
  v6[16] = 3;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)reportAudioStatusWithVolume:(unint64_t)a3 mute:(BOOL)a4 from:(unsigned __int8)a5 to:(unsigned __int8)a6
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v10 = 0;
  __int16 v9 = 0;
  v8[0] = a6 | (16 * a5);
  v8[1] = 122;
  if (a4) {
    char v6 = 0x80;
  }
  else {
    char v6 = 0;
  }
  v8[2] = v6 | (a3
              - 101
              * ((((unint64_t)(a3 - ((a3 * (unsigned __int128)0x446F86562D9FAEE5uLL) >> 64)) >> 1)
                + ((a3 * (unsigned __int128)0x446F86562D9FAEE5uLL) >> 64)) >> 6));
  memset(&v8[3], 0, 13);
  v8[16] = 3;
  return +[CECMessage messageWithFrame:v8];
}

+ (id)reportShortAudioDescriptor:(char *)a3 length:(unsigned __int8)a4 from:(unsigned __int8)a5 to:(unsigned __int8)a6
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  LOBYTE(v9) = a6 | (16 * a5);
  BYTE1(v9) = -93;
  memset((char *)&v9 + 2, 0, 14);
  int v10 = (a4 + 2) & 0x1F;
  __memcpy_chk();
  long long v7 = (unsigned __int16)v9;
  int v8 = v10;
  return +[CECMessage messageWithFrame:&v7];
}

+ (id)setAudioVolumeLevel:(unsigned __int8)a3 from:(unsigned __int8)a4 to:(unsigned __int8)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v8 = 0;
  __int16 v7 = 0;
  v6[0] = a5 | (16 * a4);
  v6[1] = 115;
  v6[2] = a3;
  memset(&v6[3], 0, 13);
  v6[16] = 3;
  return +[CECMessage messageWithFrame:v6];
}

+ (id)initiateARCFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = a4 | (16 * a3);
  v5[1] = -64;
  memset(&v5[2], 0, 14);
  v5[16] = 2;
  return +[CECMessage messageWithFrame:v5];
}

+ (id)terminateARCFrom:(unsigned __int8)a3 to:(unsigned __int8)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v7 = 0;
  __int16 v6 = 0;
  v5[0] = a4 | (16 * a3);
  v5[1] = -59;
  memset(&v5[2], 0, 14);
  v5[16] = 2;
  return +[CECMessage messageWithFrame:v5];
}

- (BOOL)loopback
{
  return self->_loopback;
}

- (void)setLoopback:(BOOL)a3
{
  self->_loopback = a3;
}

@end