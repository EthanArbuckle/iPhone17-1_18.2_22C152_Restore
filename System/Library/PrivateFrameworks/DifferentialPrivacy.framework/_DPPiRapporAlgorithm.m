@interface _DPPiRapporAlgorithm
+ (id)piRapporWithNumberOfClasses:(unint64_t)a3 prime:(unsigned int)a4 alpha0:(double)a5 alpha1:(double)a6;
- (BOOL)encodeClassIndex:(unint64_t)a3 coeffs:(unsigned int *)a4 phi0Buf:(unsigned int *)a5 otherPhiBuf:(unsigned int *)a6;
- (_DPBiasedCoin)coin;
- (_DPPiRapporAlgorithm)init;
- (_DPPiRapporAlgorithm)initWithNumberOfClasses:(unint64_t)a3 prime:(unsigned int)a4 alpha0:(double)a5 alpha1:(double)a6;
- (double)alpha0;
- (double)alpha1;
- (id)decode:(id)a3;
- (id)encodeClassIndex:(unint64_t)a3;
- (id)encodeClassIndices:(id)a3;
- (unint64_t)numberOfClasses;
- (unint64_t)numberOfOtherPhi;
- (unsigned)prime;
- (unsigned)threshold;
@end

@implementation _DPPiRapporAlgorithm

- (_DPPiRapporAlgorithm)init
{
  return 0;
}

- (_DPPiRapporAlgorithm)initWithNumberOfClasses:(unint64_t)a3 prime:(unsigned int)a4 alpha0:(double)a5 alpha1:(double)a6
{
  v6 = self;
  if (!a3)
  {
    v9 = +[_DPLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_29;
  }
  if (a4 > 1)
  {
    if (a5 <= 0.0 || a5 >= 1.0)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:](v9, v19, v20, v21, v22, v23, v24, v25);
      }
LABEL_29:

      goto LABEL_30;
    }
    if (a6 <= 0.0 || a6 >= 1.0)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.4(v9, v32, v33, v34, v35, v36, v37, v38);
      }
      goto LABEL_29;
    }
    if (a5 >= a6)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.7();
      }
      goto LABEL_29;
    }
    v43.receiver = self;
    v43.super_class = (Class)_DPPiRapporAlgorithm;
    v28 = [(_DPPiRapporAlgorithm *)&v43 init];
    v6 = v28;
    if (v28)
    {
      v28->_numberOfClasses = a3;
      v28->_prime = a4;
      v28->_alpha0 = a5;
      v28->_alpha1 = a6;
      double v29 = log((double)a3);
      v6->_numberOfOtherPhi = vcvtpd_u64_f64(v29 / log((double)a4));
      unsigned int v30 = vcvtpd_u64_f64((double)a4 * a5);
      v6->_threshold = v30;
      if (v30) {
        BOOL v31 = v30 >= a4;
      }
      else {
        BOOL v31 = 1;
      }
      if (v31)
      {
        v8 = +[_DPLog framework];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.6();
        }
        goto LABEL_5;
      }
      uint64_t v41 = +[_DPBiasedCoin coinWithBias:a6];
      if (!v41)
      {
        v9 = +[_DPLog framework];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:].cold.5();
        }
        goto LABEL_29;
      }
      coin = v6->_coin;
      v6->_coin = (_DPBiasedCoin *)v41;
    }
    v6 = v6;
    v39 = v6;
    goto LABEL_31;
  }
  v8 = +[_DPLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_DPPiRapporAlgorithm initWithNumberOfClasses:prime:alpha0:alpha1:]();
  }
LABEL_5:

LABEL_30:
  v39 = 0;
LABEL_31:

  return v39;
}

+ (id)piRapporWithNumberOfClasses:(unint64_t)a3 prime:(unsigned int)a4 alpha0:(double)a5 alpha1:(double)a6
{
  v6 = [[_DPPiRapporAlgorithm alloc] initWithNumberOfClasses:a3 prime:*(void *)&a4 alpha0:a5 alpha1:a6];
  return v6;
}

- (id)encodeClassIndex:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [(_DPPiRapporAlgorithm *)self encodeClassIndices:v5];

  return v6;
}

- (id)encodeClassIndices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 4 * [v4 count];
  v6 = [MEMORY[0x1E4F1CA58] dataWithLength:v5];
  v7 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", v5 * -[_DPPiRapporAlgorithm numberOfOtherPhi](self, "numberOfOtherPhi"));
  id v32 = v6;
  uint64_t v8 = [v32 bytes];
  id v9 = v7;
  uint64_t v10 = [v9 bytes];
  context = (void *)MEMORY[0x1E019F810]();
  objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", 4 * -[_DPPiRapporAlgorithm numberOfOtherPhi](self, "numberOfOtherPhi"));
  id v11 = objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 bytes];
  if ([v4 count])
  {
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = [v4 objectAtIndexedSubscript:v13];
      unint64_t v15 = [v14 unsignedIntegerValue];

      if (v15 >= [(_DPPiRapporAlgorithm *)self numberOfClasses]) {
        break;
      }
      if (![(_DPPiRapporAlgorithm *)self encodeClassIndex:v15 coeffs:v12 phi0Buf:v8 otherPhiBuf:v10 + 4 * [(_DPPiRapporAlgorithm *)self numberOfOtherPhi] * v13])
      {
        v18 = +[_DPLog framework];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[_DPPiRapporAlgorithm encodeClassIndices:](v15, v18, v25, v26, v27, v28, v29, v30);
        }
        goto LABEL_11;
      }
      ++v13;
      v8 += 4;
      if (v13 >= [v4 count]) {
        goto LABEL_6;
      }
    }
    v18 = +[_DPLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_DPPiRapporAlgorithm encodeClassIndices:](v15, v18, v19, v20, v21, v22, v23, v24);
    }
LABEL_11:
    uint64_t v16 = v32;

    v17 = 0;
  }
  else
  {
LABEL_6:

    uint64_t v16 = v32;
    v17 = +[_DPPiRapporEncoderResult encoderResultWithPhi0:v32 otherPhi:v9];
  }

  return v17;
}

- (id)decode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 numberOfEncodedIndices];
  id v6 = [v4 phi0];
  uint64_t v25 = [v6 bytes];

  id v7 = [v4 otherPhi];
  uint64_t v24 = [v7 bytes];

  uint64_t v8 = [v4 numberOfOtherPhi];
  if (v8 == [(_DPPiRapporAlgorithm *)self numberOfOtherPhi])
  {
    id v23 = v4;
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_DPPiRapporAlgorithm numberOfClasses](self, "numberOfClasses"));
    context = (void *)MEMORY[0x1E019F810]();
    id v21 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * v8];
    uint64_t v10 = (unsigned int *)[v21 bytes];
    if ([(_DPPiRapporAlgorithm *)self numberOfClasses])
    {
      unint64_t v11 = 0;
      uint64_t v26 = v9;
      uint64_t v27 = v5;
      do
      {
        unint64_t v28 = v11;
        pi_rappor_get_coefficients(v10, v8, v11, [(_DPPiRapporAlgorithm *)self prime]);
        uint64_t v12 = 0;
        if (v5)
        {
          uint64_t v14 = (unsigned int *)v24;
          unint64_t v13 = (int *)v25;
          do
          {
            int v15 = *v13++;
            unsigned int v16 = dotprod_mod32(v10, v14, v8, [(_DPPiRapporAlgorithm *)self prime]);
            unsigned int v17 = addmod32(v16, v15, [(_DPPiRapporAlgorithm *)self prime]);
            v12 += pi_rappor_BOOL_func(v17, [(_DPPiRapporAlgorithm *)self threshold]);
            v14 += v8;
            --v5;
          }
          while (v5);
        }
        v18 = [NSNumber numberWithUnsignedInteger:v12];
        id v9 = v26;
        [v26 setObject:v18 atIndexedSubscript:v28];

        unint64_t v11 = v28 + 1;
        uint64_t v5 = v27;
      }
      while (v28 + 1 < [(_DPPiRapporAlgorithm *)self numberOfClasses]);
    }

    id v4 = v23;
  }
  else
  {
    uint64_t v19 = +[_DPLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(_DPPiRapporAlgorithm *)self decode:v19];
    }

    id v9 = 0;
  }

  return v9;
}

- (BOOL)encodeClassIndex:(unint64_t)a3 coeffs:(unsigned int *)a4 phi0Buf:(unsigned int *)a5 otherPhiBuf:(unsigned int *)a6
{
  if ([(_DPPiRapporAlgorithm *)self numberOfOtherPhi])
  {
    unint64_t v11 = 0;
    do
      a6[v11++] = arc4random_uniform([(_DPPiRapporAlgorithm *)self prime]);
    while (v11 < [(_DPPiRapporAlgorithm *)self numberOfOtherPhi]);
  }
  uint64_t v12 = [(_DPPiRapporAlgorithm *)self coin];
  uint64_t v13 = [v12 flip];

  pi_rappor_get_coefficients(a4, [(_DPPiRapporAlgorithm *)self numberOfOtherPhi], a3, [(_DPPiRapporAlgorithm *)self prime]);
  unsigned int v14 = dotprod_mod32(a4, a6, [(_DPPiRapporAlgorithm *)self numberOfOtherPhi], [(_DPPiRapporAlgorithm *)self prime]);
  int v15 = submod32(0, v14, [(_DPPiRapporAlgorithm *)self prime]);
  unsigned int v22 = 0;
  unsigned int v21 = [(_DPPiRapporAlgorithm *)self prime];
  pi_rappor_inverse_BOOL_func(v13, [(_DPPiRapporAlgorithm *)self threshold], [(_DPPiRapporAlgorithm *)self prime], &v22, &v21);
  unsigned int v17 = v21;
  unsigned int v16 = v22;
  if (v21 <= v22)
  {
    uint64_t v19 = +[_DPLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_DPPiRapporAlgorithm encodeClassIndex:coeffs:phi0Buf:otherPhiBuf:]((int *)&v22, (int *)&v21, v19);
    }
  }
  else
  {
    unsigned int v18 = arc4random_uniform(v21 - v22) + v16;
    *a5 = addmod32(v18, v15, [(_DPPiRapporAlgorithm *)self prime]);
  }
  return v17 > v16;
}

- (unint64_t)numberOfClasses
{
  return self->_numberOfClasses;
}

- (unsigned)prime
{
  return self->_prime;
}

- (double)alpha0
{
  return self->_alpha0;
}

- (double)alpha1
{
  return self->_alpha1;
}

- (unint64_t)numberOfOtherPhi
{
  return self->_numberOfOtherPhi;
}

- (unsigned)threshold
{
  return self->_threshold;
}

- (_DPBiasedCoin)coin
{
  return self->_coin;
}

- (void).cxx_destruct
{
}

- (void)initWithNumberOfClasses:(uint64_t)a3 prime:(uint64_t)a4 alpha0:(uint64_t)a5 alpha1:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithNumberOfClasses:prime:alpha0:alpha1:.cold.2()
{
  OUTLINED_FUNCTION_1_6();
  _os_log_error_impl(v0, v1, v2, v3, v4, 8u);
}

- (void)initWithNumberOfClasses:(uint64_t)a3 prime:(uint64_t)a4 alpha0:(uint64_t)a5 alpha1:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithNumberOfClasses:(uint64_t)a3 prime:(uint64_t)a4 alpha0:(uint64_t)a5 alpha1:(uint64_t)a6 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithNumberOfClasses:prime:alpha0:alpha1:.cold.5()
{
  OUTLINED_FUNCTION_1_6();
  _os_log_error_impl(v0, v1, v2, v3, v4, 2u);
}

- (void)initWithNumberOfClasses:prime:alpha0:alpha1:.cold.6()
{
  OUTLINED_FUNCTION_1_6();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

- (void)initWithNumberOfClasses:prime:alpha0:alpha1:.cold.7()
{
  OUTLINED_FUNCTION_1_6();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

- (void)encodeClassIndices:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeClassIndices:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decode:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 numberOfOtherPhi];
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DC55E000, a3, OS_LOG_TYPE_ERROR, "The provided Pi-Rappor encoder result is likely not generated by this Pi-Rappor algorithm instance, expected numberOfOtherPhi: %lu, got numberOfOtherPhi: %lu", (uint8_t *)&v5, 0x16u);
}

- (void)encodeClassIndex:(os_log_t)log coeffs:phi0Buf:otherPhiBuf:.cold.1(int *a1, int *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Pi-Rappor algorithm failed to sample phi0 within lower bound (%d) and upper bound (%d).", (uint8_t *)v5, 0xEu);
}

@end