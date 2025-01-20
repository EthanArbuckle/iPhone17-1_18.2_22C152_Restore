@interface MurmurHash3
+ ($7DEDF3842AEFB7F1E6DF5AF62E424A02)hash128WithKey:(const void *)a3 length:(unint64_t)a4 seed:(unsigned int)a5;
@end

@implementation MurmurHash3

+ ($7DEDF3842AEFB7F1E6DF5AF62E424A02)hash128WithKey:(const void *)a3 length:(unint64_t)a4 seed:(unsigned int)a5
{
  uint64_t v5 = a5;
  if (a4 >= 0x10)
  {
    unint64_t v7 = a4 >> 4;
    v8 = (char *)a3 + 8;
    uint64_t v6 = a5;
    do
    {
      uint64_t v6 = 5
         * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *(v8 - 1)) | ((0x87C37B91114253D5 * *(v8 - 1)) >> 33))) ^ v6, 37)+ v5)+ 1390208809;
      uint64_t v5 = 5
         * (v6
          + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * *v8) | ((unint64_t)(0x4CF5AD432745937FLL * *v8) >> 31))) ^ v5, 33))+ 944331445;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  else
  {
    uint64_t v6 = a5;
  }
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  unint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v17 = 0;
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v20 = 0;
  unint64_t v21 = 0;
  v22 = (unsigned __int8 *)a3 + (a4 & 0xFFFFFFFFFFFFFFF0);
  switch(a4 & 0xF)
  {
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      goto LABEL_14;
    case 8uLL:
      goto LABEL_13;
    case 9uLL:
      goto LABEL_12;
    case 0xAuLL:
      goto LABEL_11;
    case 0xBuLL:
      goto LABEL_10;
    case 0xCuLL:
      goto LABEL_9;
    case 0xDuLL:
      goto LABEL_8;
    case 0xEuLL:
      goto LABEL_7;
    case 0xFuLL:
      unint64_t v9 = (unint64_t)v22[14] << 48;
LABEL_7:
      unint64_t v10 = v9 | ((unint64_t)v22[13] << 40);
LABEL_8:
      unint64_t v11 = v10 ^ ((unint64_t)v22[12] << 32);
LABEL_9:
      unint64_t v12 = v11 ^ ((unint64_t)v22[11] << 24);
LABEL_10:
      unint64_t v13 = v12 ^ ((unint64_t)v22[10] << 16);
LABEL_11:
      unint64_t v14 = v13 ^ ((unint64_t)v22[9] << 8);
LABEL_12:
      v5 ^= 0x87C37B91114253D5
          * ((0x4E8B26FE00000000 * (v14 ^ v22[8])) | ((0x4CF5AD432745937FLL * (v14 ^ v22[8])) >> 31));
LABEL_13:
      unint64_t v15 = (unint64_t)v22[7] << 56;
LABEL_14:
      unint64_t v16 = v15 | ((unint64_t)v22[6] << 48);
LABEL_15:
      unint64_t v17 = v16 ^ ((unint64_t)v22[5] << 40);
LABEL_16:
      unint64_t v18 = v17 ^ ((unint64_t)v22[4] << 32);
LABEL_17:
      unint64_t v19 = v18 ^ ((unint64_t)v22[3] << 24);
LABEL_18:
      unint64_t v20 = v19 ^ ((unint64_t)v22[2] << 16);
LABEL_19:
      unint64_t v21 = v20 ^ ((unint64_t)v22[1] << 8);
LABEL_20:
      v6 ^= 0x4CF5AD432745937FLL
          * ((0x88A129EA80000000 * (v21 ^ *v22)) | ((0x87C37B91114253D5 * (v21 ^ *v22)) >> 33));
      break;
    default:
      break;
  }
  unint64_t v23 = v5 ^ a4;
  unint64_t v24 = v23 + (v6 ^ a4);
  unint64_t v25 = v24 + v23;
  unint64_t v26 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v24 ^ (v24 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v24 ^ (v24 >> 33))) >> 33));
  unint64_t v27 = v26 ^ (v26 >> 33);
  unint64_t v28 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v25 ^ (v25 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v25 ^ (v25 >> 33))) >> 33));
  unint64_t v29 = v28 ^ (v28 >> 33);
  unint64_t v30 = v29 + v27;
  unint64_t v31 = v29 + v27 + v29;
  result.var1 = v31;
  result.var0 = v30;
  return result;
}

@end