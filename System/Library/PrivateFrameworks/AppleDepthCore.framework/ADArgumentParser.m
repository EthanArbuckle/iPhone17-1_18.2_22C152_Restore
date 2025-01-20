@interface ADArgumentParser
- (BOOL)parse;
- (BOOL)parseArguments:(id)a3;
- (BOOL)parseStringCommand:(id)a3;
- (void)addProgramDescription:(id)a3;
@end

@implementation ADArgumentParser

- (void).cxx_destruct
{
}

- (BOOL)parseArguments:(id)a3
{
  id v4 = a3;
  [(ADArgumentParserCommand *)self setDescriptionString:self->_programDescription];
  v5 = [v4 objectAtIndexedSubscript:0];
  v6 = [v5 lastPathComponent];
  [(ADArgumentParserCommand *)self setName:v6];

  if (![(ADArgumentParserCommand *)self verifyCommandStructure])
  {
    puts("found error in command tree structure. stopping");
    __assert_rtn("-[ADArgumentParser parseArguments:]", "ADArgumentParser.mm", 51, "false");
  }
  BOOL v7 = [(ADArgumentParserCommand *)self commandParse:v4 commandIndex:0];

  return v7;
}

- (BOOL)parseStringCommand:(id)a3
{
  id v4 = [a3 componentsSeparatedByString:@" "];
  LOBYTE(self) = [(ADArgumentParser *)self parseArguments:v4];

  return (char)self;
}

- (BOOL)parse
{
  v3 = [MEMORY[0x263F08AB0] processInfo];
  id v4 = [v3 arguments];
  LOBYTE(self) = [(ADArgumentParser *)self parseArguments:v4];

  return (char)self;
}

- (void)addProgramDescription:(id)a3
{
}

@end