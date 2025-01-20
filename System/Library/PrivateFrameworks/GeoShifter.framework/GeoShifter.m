double obfuscate(unint64_t a1, double *a2, double *a3, double *a4, double a5, double a6, double a7)
{
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  long double v23;
  long double v24;
  long double v25;
  long double v26;
  long double v27;
  long double v28;
  long double v29;
  long double v30;
  double v31;
  double v32;
  double v33;
  __double2 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  long double v39;
  double result;
  long double v41;
  double v42;
  double v43;
  double v45;

  v12 = a1 % 0x2710;
  if (a1 % 0x2710 <= 1) {
    v12 = 1;
  }
  v13 = (double)v12;
  v14 = pow((double)v12, 0.634970963);
  v15 = 7.96553478;
  if (v14 >= 7.96553478) {
    v15 = -0.0;
  }
  v16 = v14 + v15;
  if (v14 + v15 > 35.4940095) {
    v16 = 35.4940095 - fmod(v16, 27.5284747);
  }
  v17 = pow(v13, 1.07641673);
  v18 = 68.1766451;
  if (v17 >= 68.1766451) {
    v18 = -0.0;
  }
  v19 = v17 + v18;
  if (v19 > 97.4025615) {
    v19 = 97.4025615 - fmod(v19, 29.2259163);
  }
  v42 = round(v16 * 100000.0) / 100000.0;
  v43 = a6;
  v20 = a5 - v42;
  v21 = a6 - round(v19 * 100000.0) / 100000.0;
  v22 = sin((a5 - v42) * 25.1327412);
  v23 = sin((a5 - v42) * 6.28318531) * 20.0 + v22 * 40.0;
  v24 = v23 + sin((a5 - v42) * 3.14159265) * 20.0;
  v25 = v24 + sin((a5 - v42) * 3.14159265 + (a5 - v42) * 3.14159265) * 100.0;
  v45 = a5;
  v26 = v25 + sin((a5 - v42) * 3.14159265 / 0.9) * 120.0;
  v41 = (v26 + sin((a5 - v42) * 3.14159265 / 1.2) * 120.0) * 0.666666667;
  v27 = v23 + sin(v21 * 3.14159265) * 20.0;
  v28 = v27 + sin(v21 * 3.14159265 + v21 * 3.14159265) * 100.0;
  v29 = v28 + sin(v21 * 3.14159265 / 0.9) * 120.0;
  v30 = (v29 + sin(v21 * 3.14159265 / 1.2) * 120.0) * 0.666666667;
  v31 = sqrt(vabdd_f64(a5, v42));
  v32 = v20 + 300.0 + v21 * 2.0 + v20 * 0.1 * v20 + v20 * 0.1 * v21 + v31 * 0.1;
  v33 = v20 * 2.0 + 100.0 + v21 * 3.0 + v21 * 0.2 * v21 + v20 * 0.1 * v21 + v31 * 0.2;
  v34 = __sincos_stret(v20 * 0.0104719755 + 3.232323);
  v35 = cos(v20 * 3.14159265 + 3.232323);
  v36 = fabs(v34.__sinval) + fabs(v41 / 200.0 + v32 / 500.0);
  v37 = fabs(v35) + fabs(v41 / 312.0 + v32 / 312.0) + 3.0;
  v38 = v36 * 0.00000898315284;
  v39 = cos(v45 * 0.0174532925);
  *a2 = v38 + v45;
  *a3 = 0.00000898315284 / v39 * (fabs(v34.__cosval) + fabs(v33 / 500.0 + v30 / 200.0)) + v43;
  result = v37 + a7;
  *a4 = v37 + a7;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}