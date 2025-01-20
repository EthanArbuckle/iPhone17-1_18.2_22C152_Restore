@interface NSError(IOReturn)
+ (id)errorWithIOReturn:()IOReturn;
@end

@implementation NSError(IOReturn)

+ (id)errorWithIOReturn:()IOReturn
{
  v13[50] = *MEMORY[0x1E4F143B8];
  v12[0] = &unk_1F35BDB18;
  v12[1] = &unk_1F35BDB30;
  v13[0] = @"success";
  v13[1] = @"general error";
  v12[2] = &unk_1F35BDB48;
  v12[3] = &unk_1F35BDB60;
  v13[2] = @"memory allocation error";
  v13[3] = @"resource shortage";
  v12[4] = &unk_1F35BDB78;
  v12[5] = &unk_1F35BDB90;
  v13[4] = @"Mach IPC failure";
  v13[5] = @"no such device";
  v12[6] = &unk_1F35BDBA8;
  v12[7] = &unk_1F35BDBC0;
  v13[6] = @"privilege violation";
  v13[7] = @"invalid argument";
  v12[8] = &unk_1F35BDBD8;
  v12[9] = &unk_1F35BDBF0;
  v13[8] = @"device is read locked";
  v13[9] = @"device is write locked";
  v12[10] = &unk_1F35BDC08;
  v12[11] = &unk_1F35BDC20;
  v13[10] = @"device is exclusive access";
  v13[11] = @"bad IPC message ID";
  v12[12] = &unk_1F35BDC38;
  v12[13] = &unk_1F35BDC50;
  v13[12] = @"unsupported function";
  v13[13] = @"virtual memory error";
  v12[14] = &unk_1F35BDC68;
  v12[15] = &unk_1F35BDC80;
  v13[14] = @"internal driver error";
  v13[15] = @"I/O error";
  v12[16] = &unk_1F35BDC98;
  v12[17] = &unk_1F35BDCB0;
  v13[16] = @"cannot acquire lock";
  v13[17] = @"device is not open";
  v12[18] = &unk_1F35BDCC8;
  v12[19] = &unk_1F35BDCE0;
  v13[18] = @"device is not readable";
  v13[19] = @"device is not writeable";
  v12[20] = &unk_1F35BDCF8;
  v12[21] = &unk_1F35BDD10;
  v13[20] = @"alignment error";
  v13[21] = @"media error";
  v12[22] = &unk_1F35BDD28;
  v12[23] = &unk_1F35BDD40;
  v13[22] = @"device is still open";
  v13[23] = @"rld failure";
  v12[24] = &unk_1F35BDD58;
  v12[25] = &unk_1F35BDD70;
  v13[24] = @"DMA failure";
  v13[25] = @"device is busy";
  v12[26] = &unk_1F35BDD88;
  v12[27] = &unk_1F35BDDA0;
  v13[26] = @"I/O timeout";
  v13[27] = @"device is offline";
  v12[28] = &unk_1F35BDDB8;
  v12[29] = &unk_1F35BDDD0;
  v13[28] = @"device is not ready";
  v13[29] = @"device/channel is not attached";
  v12[30] = &unk_1F35BDDE8;
  v12[31] = &unk_1F35BDE00;
  v13[30] = @"no DMA channels available";
  v13[31] = @"no space for data";
  v12[32] = &unk_1F35BDE18;
  v12[33] = &unk_1F35BDE30;
  v13[32] = @"device port already exists";
  v13[33] = @"cannot wire physical memory";
  v12[34] = &unk_1F35BDE48;
  v12[35] = &unk_1F35BDE60;
  v13[34] = @"no interrupt attached";
  v13[35] = @"no DMA frames enqueued";
  v12[36] = &unk_1F35BDE78;
  v12[37] = &unk_1F35BDE90;
  v13[36] = @"message is too large";
  v13[37] = @"operation is not permitted";
  v12[38] = &unk_1F35BDEA8;
  v12[39] = &unk_1F35BDEC0;
  v13[38] = @"device is without power";
  v13[39] = @"media is not present";
  v12[40] = &unk_1F35BDED8;
  v12[41] = &unk_1F35BDEF0;
  v13[40] = @"media is not formatted";
  v13[41] = @"unsupported mode";
  v12[42] = &unk_1F35BDF08;
  v12[43] = &unk_1F35BDF20;
  v13[42] = @"data underrun";
  v13[43] = @"data overrun";
  v12[44] = &unk_1F35BDF38;
  v12[45] = &unk_1F35BDF50;
  v13[44] = @"device error";
  v13[45] = @"no completion routine";
  v12[46] = &unk_1F35BDF68;
  v12[47] = &unk_1F35BDF80;
  v13[46] = @"operation was aborted";
  v13[47] = @"bus bandwidth would be exceeded";
  v12[48] = &unk_1F35BDF98;
  v12[49] = &unk_1F35BDFB0;
  v13[48] = @"device is not responding";
  v13[49] = @"unanticipated driver error";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:50];
  v5 = [NSNumber numberWithInt:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x unknown", a3);
  }
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11 = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HIDFramework" code:(int)a3 userInfo:v7];

  return v8;
}

@end