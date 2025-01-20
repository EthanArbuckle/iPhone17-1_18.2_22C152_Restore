@interface NSData(CBOR)
+ (id)dataWithCBOR:()CBOR encodingKeyOrder:;
+ (uint64_t)dataWithCBOR:()CBOR;
@end

@implementation NSData(CBOR)

+ (uint64_t)dataWithCBOR:()CBOR
{
  return [a1 dataWithCBOR:a3 encodingKeyOrder:0];
}

+ (id)dataWithCBOR:()CBOR encodingKeyOrder:
{
  v86[16] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 tag];

  unint64_t v7 = 0x263EFF000uLL;
  if (v6)
  {
    id v8 = [v5 tag];
    self;
    unint64_t v9 = [v8 unsignedLongLongValue];

    if (HIDWORD(v9))
    {
      LOBYTE(v81) = -37;
      v86[0] = bswap64(v9);
      v6 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:9];
      [v6 appendBytes:&v81 length:1];
      v10 = (long long *)v86;
      v11 = v6;
      uint64_t v12 = 8;
    }
    else if (v9 < 0x10000)
    {
      if (v9 < 0x100)
      {
        if (v9 > 0x17)
        {
          LOBYTE(v81) = -40;
          LOBYTE(v86[0]) = v9;
          v6 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:2];
          [v6 appendBytes:&v81 length:1];
          v10 = (long long *)v86;
          v11 = v6;
        }
        else
        {
          LOBYTE(v81) = v9 - 64;
          v11 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:1];
          v6 = v11;
          v10 = &v81;
        }
        uint64_t v12 = 1;
      }
      else
      {
        LOBYTE(v81) = -39;
        LOWORD(v86[0]) = bswap32(v9) >> 16;
        v6 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:3];
        [v6 appendBytes:&v81 length:1];
        v10 = (long long *)v86;
        v11 = v6;
        uint64_t v12 = 2;
      }
    }
    else
    {
      LOBYTE(v81) = -38;
      LODWORD(v86[0]) = bswap32(v9);
      v6 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:5];
      [v6 appendBytes:&v81 length:1];
      v10 = (long long *)v86;
      v11 = v6;
      uint64_t v12 = 4;
    }
    [v11 appendBytes:v10 length:v12];
  }
  switch([v5 type])
  {
    case 0:
      unint64_t v22 = [v5 unsignedLongLongValue];
      self;
      if (HIDWORD(v22))
      {
        LOBYTE(v81) = 27;
        unint64_t v23 = bswap64(v22);
        goto LABEL_31;
      }
      if (v22 >= 0x10000)
      {
        LOBYTE(v81) = 26;
        unsigned int v44 = bswap32(v22);
        goto LABEL_56;
      }
      if (v22 >= 0x100)
      {
        LOBYTE(v81) = 25;
        unsigned int v45 = bswap32(v22);
        goto LABEL_67;
      }
      if (v22 <= 0x17)
      {
        LOBYTE(v81) = v22;
        goto LABEL_76;
      }
      LOBYTE(v81) = 24;
      LOBYTE(v86[0]) = v22;
      goto LABEL_83;
    case 1:
      unint64_t v24 = [v5 longLongValue];
      self;
      unint64_t v25 = ~v24;
      if (v24 > 0xFFFFFFFEFFFFFFFFLL)
      {
        if (v24 > 0xFFFFFFFFFFFEFFFFLL)
        {
          if (v24 > 0xFFFFFFFFFFFFFEFFLL)
          {
            if (v24 < 0xFFFFFFFFFFFFFFE8)
            {
              LOBYTE(v81) = 56;
              LOBYTE(v86[0]) = ~(_BYTE)v24;
LABEL_83:
              id v16 = (id)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:2];
              [v16 appendBytes:&v81 length:1];
              v26 = (long long *)v86;
              v27 = v16;
            }
            else
            {
              LOBYTE(v81) = 31 - v24;
LABEL_76:
              v27 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:1];
              id v16 = v27;
              v26 = &v81;
            }
            uint64_t v28 = 1;
          }
          else
          {
            LOBYTE(v81) = 57;
            unsigned int v45 = bswap32(v25);
LABEL_67:
            LOWORD(v86[0]) = HIWORD(v45);
            id v16 = (id)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:3];
            [v16 appendBytes:&v81 length:1];
            v26 = (long long *)v86;
            v27 = v16;
            uint64_t v28 = 2;
          }
        }
        else
        {
          LOBYTE(v81) = 58;
          unsigned int v44 = bswap32(v25);
LABEL_56:
          LODWORD(v86[0]) = v44;
          id v16 = (id)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:5];
          [v16 appendBytes:&v81 length:1];
          v26 = (long long *)v86;
          v27 = v16;
          uint64_t v28 = 4;
        }
      }
      else
      {
        LOBYTE(v81) = 59;
        unint64_t v23 = bswap64(v25);
LABEL_31:
        v86[0] = v23;
        id v16 = (id)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:9];
        [v16 appendBytes:&v81 length:1];
        v26 = (long long *)v86;
        v27 = v16;
        uint64_t v28 = 8;
      }
      [v27 appendBytes:v26 length:v28];
      if (!v6) {
        goto LABEL_122;
      }
      goto LABEL_98;
    case 2:
      v29 = [v5 data];
      goto LABEL_34;
    case 3:
      v29 = [v5 string];
LABEL_34:
      id v13 = v29;
      +[CBOR encodeMajorType2or3:]((uint64_t)CBOR, v29);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_97;
    case 4:
      id v30 = [v5 array];
      self;
      id v16 = (id)objc_opt_new();
      [v30 count];
      if ((unint64_t)[v30 count] >> 32)
      {
        LOBYTE(v80[0]) = -101;
        v86[0] = bswap64([v30 count]);
        [v16 appendBytes:v80 length:1];
        v31 = v86;
        v32 = v16;
        uint64_t v33 = 8;
      }
      else if ((unint64_t)[v30 count] < 0x10000)
      {
        if ((unint64_t)[v30 count] < 0x100)
        {
          if ((unint64_t)[v30 count] < 0x18)
          {
            LOBYTE(v80[0]) = [v30 count] ^ 0x80;
            v31 = v80;
          }
          else
          {
            LOBYTE(v80[0]) = -104;
            LOBYTE(v86[0]) = [v30 count];
            [v16 appendBytes:v80 length:1];
            v31 = v86;
          }
          v32 = v16;
          uint64_t v33 = 1;
        }
        else
        {
          LOBYTE(v80[0]) = -103;
          LOWORD(v86[0]) = bswap32([v30 count]) >> 16;
          [v16 appendBytes:v80 length:1];
          v31 = v86;
          v32 = v16;
          uint64_t v33 = 2;
        }
      }
      else
      {
        LOBYTE(v80[0]) = -102;
        LODWORD(v86[0]) = bswap32([v30 count]);
        [v16 appendBytes:v80 length:1];
        v31 = v86;
        v32 = v16;
        uint64_t v33 = 4;
      }
      [v32 appendBytes:v31 length:v33];
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v13 = v30;
      uint64_t v46 = [v13 countByEnumeratingWithState:&v81 objects:v86 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v82;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v82 != v48) {
              objc_enumerationMutation(v13);
            }
            v50 = [MEMORY[0x263EFF8F8] dataWithCBOR:*(void *)(*((void *)&v81 + 1) + 8 * i)];
            [v16 appendData:v50];
          }
          uint64_t v47 = [v13 countByEnumeratingWithState:&v81 objects:v86 count:16];
        }
        while (v47);
      }

      goto LABEL_97;
    case 5:
      id v34 = v5;
      self;
      v35 = [v34 dictionary];
      id v16 = (id)objc_opt_new();
      [v35 count];
      if ((unint64_t)[v35 count] >> 32)
      {
        char v85 = -69;
        v86[0] = bswap64([v35 count]);
        [v16 appendBytes:&v85 length:1];
        v36 = (char *)v86;
        v37 = v16;
        uint64_t v38 = 8;
      }
      else if ((unint64_t)[v35 count] < 0x10000)
      {
        if ((unint64_t)[v35 count] < 0x100)
        {
          if ((unint64_t)[v35 count] < 0x18)
          {
            char v85 = [v35 count] - 96;
            v36 = &v85;
          }
          else
          {
            char v85 = -72;
            LOBYTE(v86[0]) = [v35 count];
            [v16 appendBytes:&v85 length:1];
            v36 = (char *)v86;
          }
          v37 = v16;
          uint64_t v38 = 1;
        }
        else
        {
          char v85 = -71;
          LOWORD(v86[0]) = bswap32([v35 count]) >> 16;
          [v16 appendBytes:&v85 length:1];
          v36 = (char *)v86;
          v37 = v16;
          uint64_t v38 = 2;
        }
      }
      else
      {
        char v85 = -70;
        LODWORD(v86[0]) = bswap32([v35 count]);
        [v16 appendBytes:&v85 length:1];
        v36 = (char *)v86;
        v37 = v16;
        uint64_t v38 = 4;
      }
      [v37 appendBytes:v36 length:v38];
      v55 = [v34 orderedKeys];

      if (v55)
      {
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v56 = [v34 orderedKeys];
        uint64_t v57 = [v56 countByEnumeratingWithState:&v81 objects:v86 count:16];
        if (!v57) {
          goto LABEL_121;
        }
        uint64_t v58 = v57;
        id v78 = v34;
        id v79 = v5;
        uint64_t v59 = *(void *)v82;
        do
        {
          for (uint64_t j = 0; j != v58; ++j)
          {
            if (*(void *)v82 != v59) {
              objc_enumerationMutation(v56);
            }
            uint64_t v61 = *(void *)(*((void *)&v81 + 1) + 8 * j);
            v62 = [MEMORY[0x263EFF8F8] dataWithCBOR:v61];
            [v16 appendData:v62];

            v63 = (void *)MEMORY[0x263EFF8F8];
            v64 = [v35 objectForKey:v61];
            v65 = [v63 dataWithCBOR:v64];
            [v16 appendData:v65];
          }
          uint64_t v58 = [v56 countByEnumeratingWithState:&v81 objects:v86 count:16];
        }
        while (v58);
      }
      else
      {
        id v78 = v34;
        id v79 = v5;
        v66 = [v35 allKeys];
        v80[0] = MEMORY[0x263EF8330];
        v80[1] = 3221225472;
        v80[2] = __51__CBOR_Encoder__encodeMajorType5_encodingKeyOrder___block_invoke;
        v80[3] = &__block_descriptor_40_e23_q24__0__CBOR_8__CBOR_16l;
        v80[4] = a4;
        v67 = [v66 sortedArrayUsingComparator:v80];

        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v56 = v67;
        uint64_t v68 = [v56 countByEnumeratingWithState:&v81 objects:v86 count:16];
        if (v68)
        {
          uint64_t v69 = v68;
          uint64_t v70 = *(void *)v82;
          do
          {
            for (uint64_t k = 0; k != v69; ++k)
            {
              if (*(void *)v82 != v70) {
                objc_enumerationMutation(v56);
              }
              uint64_t v72 = *(void *)(*((void *)&v81 + 1) + 8 * k);
              v73 = [MEMORY[0x263EFF8F8] dataWithCBOR:v72];
              [v16 appendData:v73];

              v74 = (void *)MEMORY[0x263EFF8F8];
              v75 = [v35 objectForKey:v72];
              v76 = [v74 dataWithCBOR:v75];
              [v16 appendData:v76];
            }
            uint64_t v69 = [v56 countByEnumeratingWithState:&v81 objects:v86 count:16];
          }
          while (v69);
        }
      }
      id v34 = v78;
      id v5 = v79;
      unint64_t v7 = 0x263EFF000;
LABEL_121:

      if (!v6) {
        goto LABEL_122;
      }
      goto LABEL_98;
    case 6:
    case 7:
    case 8:
      id v13 = v5;
      self;
      LOBYTE(v81) = 0;
      v14 = [v13 value];
      objc_opt_class();
      objc_opt_isKindOfClass();

      v15 = [v13 value];
      if ([v13 valueSize] == 2 && objc_msgSend(v13, "type") == 6)
      {
        LOBYTE(v81) = -7;
        id v16 = (id)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:3];
        [v16 appendBytes:&v81 length:1];
        [v15 doubleValue];
        LOWORD(v86[0]) = 0;
        v17 = v16;
        uint64_t v18 = 2;
LABEL_24:
        [v17 appendBytes:v86 length:v18];
        goto LABEL_26;
      }
      if ([v13 valueSize] == 4 && objc_msgSend(v13, "type") == 7)
      {
        LOBYTE(v81) = -6;
        id v16 = (id)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:5];
        [v16 appendBytes:&v81 length:1];
        [v15 floatValue];
        LODWORD(v86[0]) = bswap32(v19);
        v17 = v16;
        uint64_t v18 = 4;
        goto LABEL_24;
      }
      if ([v13 valueSize] == 8 && objc_msgSend(v13, "type") == 8)
      {
        LOBYTE(v81) = -5;
        id v16 = (id)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:9];
        [v16 appendBytes:&v81 length:1];
        [v15 doubleValue];
        v86[0] = bswap64(v21);
        v17 = v16;
        uint64_t v18 = 8;
        goto LABEL_24;
      }
      id v16 = 0;
LABEL_26:

LABEL_97:
      if (v6)
      {
LABEL_98:
        v51 = (void *)MEMORY[0x21D468040]();
        v52 = (void *)[objc_alloc(*(Class *)(v7 + 2448)) initWithData:v6];
        v53 = v52;
        if (v16) {
          [v52 appendData:v16];
        }
        v54 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithData:v53];
      }
      else
      {
LABEL_122:
        if (!v16) {
LABEL_123:
        }
          id v16 = (id)objc_opt_new();
        id v16 = v16;
        v54 = v16;
      }

      return v54;
    case 9:
      int v39 = 0;
      goto LABEL_41;
    case 10:
      int v39 = 1;
LABEL_41:
      uint64_t v20 = +[CBOR encodeMajorType7Bool:]((uint64_t)CBOR, v39);
      goto LABEL_50;
    case 11:
      self;
      char v40 = -10;
      goto LABEL_48;
    case 12:
    case 16:
      goto LABEL_20;
    case 13:
      unint64_t v41 = [v5 longLongValue];
      self;
      if (v41 > 0x1F)
      {
        if (v41 - 32 > 0xDF)
        {
LABEL_20:
          uint64_t v20 = +[CBOR encodeMajorType7Undefined]();
          goto LABEL_50;
        }
        LOBYTE(v86[0]) = -8;
        BYTE1(v86[0]) = v41;
        id v42 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t v43 = 2;
      }
      else
      {
        char v40 = v41 - 32;
LABEL_48:
        LOBYTE(v86[0]) = v40;
        id v42 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t v43 = 1;
      }
      uint64_t v20 = [v42 initWithBytes:v86 length:v43];
LABEL_50:
      id v16 = (id)v20;
      if (!v6) {
        goto LABEL_122;
      }
      goto LABEL_98;
    case 15:
      self;
      char v40 = -1;
      goto LABEL_48;
    default:
      if (!v6) {
        goto LABEL_123;
      }
      id v16 = 0;
      goto LABEL_98;
  }
}

@end